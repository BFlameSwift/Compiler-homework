package lab03;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Utils {

    public static Scanner scanner = new Scanner(System.in);

    public static Map<String, SymbolItem> globalSymbolTable = new HashMap<String, SymbolItem>();
//    public static Map<String, SymbolItem> LocalSymbolTable = new HashMap<String, SymbolItem>();
    public static Map<Integer ,SymbolItem> addressSymbolTable = new HashMap<Integer, SymbolItem>(); // 用来存取当前地址是否是常量
    public static ArrayList<HashMap<String, SymbolItem> > blockSymbolTable = new ArrayList<HashMap<String, SymbolItem>>();
    public static Map<String,HashMap<String, SymbolItem>> allLocalSymbolTable = new HashMap<String,HashMap<String, SymbolItem>>(); // 按照函数存储变量
    public static ArrayList<String > allFuncList = new ArrayList<String>();
    public static Map<String,SymbolItem> funcSymbolTable = new HashMap<String,SymbolItem>();
    private static int blockIndex = -1;

    private static int constAddress = -100000;
    private static int nowAddress = 0;
    private static final String defaultGloablFunctionName = "lyTxdy'sDefaultGlobalName"; //初始化没进入函数时候的名称
    private static String nowFunctionName = defaultGloablFunctionName;
    public static String getNowFunction(){ // 获取当前函数名称，从而对变量找准位置
        return nowFunctionName;
    }
    public static Boolean isGlobal(){
        return nowFunctionName.equals(defaultGloablFunctionName);
    }
    public static void enterFunction(String funcName){
        nowFunctionName = funcName;
    }

    public static int getNowAddress() {
        return nowAddress;
    }

    public static void enterBlock(){
        blockIndex ++;
    }
    public static int getBlockIndex() {
        return blockIndex;
    }
    public static String allocateVariableOutput(int varialeAddr){
        return "%"+varialeAddr+" = alloca i32";
    }
    public static void allocateGlobalVariable(String symbolName,SymbolItem symbolItem){
        globalSymbolTable.put(symbolName, symbolItem);
    }
    public static void allocateGlobalVariable(Token token,int value,int kind,Boolean isCommon) throws CompileException {
        // 声明全局变量，value 为数值，king种类， common是否初始化了数值
        String symbolName = token.getValue();
        SymbolItem symbolItem =  new SymbolItem(symbolName,kind,value);
        if(globalSymbolTable.containsKey(symbolName)){
            throw new CompileException("this variable name"+symbolName+"has been allocate");
        }globalSymbolTable.put(symbolName,symbolItem);
        String retStr = "";
        retStr += symbolName; retStr += " = ";
        retStr += isCommon?"common":""; retStr += "dso_local ";
        retStr += kind == 0?"global i32 ":"constant i32 ";
        retStr += value+", align 4";
        Parser.midCodeOut.add(retStr);
    }
    public static int allocateVariable(Token token,int kind,String funcName) throws CompileException {
        String symbolName = token.getValue();
        judgeVariableNameIsLegal(symbolName);
        SymbolItem symbolItem =  new SymbolItem(symbolName,kind);
        symbolItem.setAddress(nowAddress);
        if(funcName.equals(defaultGloablFunctionName)){
            allocateGlobalVariable(symbolName,symbolItem);
            return 0;
        }
        nowAddress ++;
        Parser.midCodeOut.add(allocateVariableOutput(nowAddress)); // 输出声明局部变量的中间代码
        //TODO 根据不同函数进入不同的Map块
        putAddressSymbol(nowAddress,symbolItem);
        putallocalSymbolTable(symbolItem,"main");
        putblockSymbolTable(symbolItem,blockIndex);
        return nowAddress;
    }
    public static void putAddressSymbol(int addr, SymbolItem symbolItem){
        symbolItem.setAddress(addr);
        addressSymbolTable.put(addr,symbolItem);
    }
    public static void putallocalSymbolTable(SymbolItem symbolItem,String funcName){
        try {
            allLocalSymbolTable.get(funcName).put(symbolItem.name,symbolItem);
        }catch(NullPointerException e){
            allLocalSymbolTable.put(funcName,new HashMap<String, SymbolItem>()) ;
            allLocalSymbolTable.get(funcName).put(symbolItem.name,symbolItem);
        }
    }
    public static SymbolItem getSymbolItemByAddress(int address){
        if(addressSymbolTable.containsKey(address)){
            return addressSymbolTable.get(address);
        }
        throw new IllegalArgumentException("this address has not variable");
    }
    public static void putblockSymbolTable(SymbolItem symbolItem,int index) throws CompileException{
        Map<String, SymbolItem> map ;
        try {
             map = blockSymbolTable.get(index);
        }catch(IndexOutOfBoundsException e){
            blockSymbolTable.add(new HashMap<String, SymbolItem>());
            map = blockSymbolTable.get(index);
        }
        if(map.containsKey(symbolItem.name)){
            throw new CompileException("same block"+index+"redefine Var or const which name is "+ symbolItem.name);
        }
        blockSymbolTable.get(index).put(symbolItem.name,symbolItem);
    }
// 自小块向大块赋值
    public static int storeVariable(Token token,int value){
        // TODO 自下向上查找变量 而后区分出不同类型的变量并赋值
        // TODO 暂时认为只有一个块
        SymbolItem symbolItem = blockSymbolTable.get(blockIndex).get(token.getValue());
        if(symbolItem.isConstant()){
            throw new CompileException("Constant cant be store value");
        }
        symbolItem.setValueInt(value);
        return symbolItem.getAddress();
    }
    public static int storeConstVariable(String name,int value,String funcName) throws CompileException {
        SymbolItem item = new SymbolItem(name,1,value);
        item.setAddress(++ constAddress);
        if(name != null){
            putblockSymbolTable(item,blockIndex);
            putallocalSymbolTable(item,funcName);
        }putAddressSymbol(constAddress,item);

        return item.getAddress();
    }

    public static String storeVariableOutput(int valueAddr,int varAddr) throws CompileException {
        SymbolItem valueItem = getSymbolItemByAddress(valueAddr);
        String retStr = "store i32 ";
        retStr += valueItem.kind == 1?valueItem.getValueInt():"%"+valueItem.getLoadAddress();
        retStr += ", i32* %"+varAddr;
        return retStr;
    }

    public static int midExpCalculate(String op,int address1,int address2) throws CompileException {
        SymbolItem item1 = getSymbolItemByAddress(address1),item2 = getSymbolItemByAddress(address2);
        int objKind = (item1.kind == 1 && item2.kind == 1)? 1:0,objValue; // 判断新地址的是不是变量 0 是变量，1不是变量
        objValue = calculateValue(item1.getValueInt(),op, item2.getValueInt());
        int objAddress = (objKind == 1)?(++constAddress):(++nowAddress);// 将常量与变量计算分区
//        int objAddress = nowAddress;
        if(objKind == 0){// 是变量就输出过程
            // 选择计算的目标变量，如果是变量就是输出，换言之：折叠左侧常量计算
            String outStr = "%"+objAddress+" = "+op+" i32 ";
            outStr += (item1.kind == 1)?item1.getValueInt():"%"+item1.getLoadAddress();
            outStr += ", ";
            outStr += (item2.kind == 1)?item2.valueInt:"%"+item2.getLoadAddress();
            Parser.midCodeOut.add(outStr);
        }
        putAddressSymbol(objAddress,new SymbolItem(null,objKind,objValue));

        return objAddress;
    }

    public static int calculateValue(int value1,String op,int value2){
        //根据符号计算，节约Parse部分的底阿妈
        if(op.equals("add")){
            return value1 + value2;
        }else if(op.equals("sub"))
            return value1 - value2;
        else if(op.equals("mul"))
            return value1 * value2;
        else if(op.equals("sdiv"))
            return value1 / value2;
        else if(op.equals("srem"))
            return value1 % value2;
        else{
            throw new IllegalArgumentException("calculate not + - * / %");
        }
    }
    public static String loadLValOutput(Token token,String funcName) throws CompileException {
        SymbolItem theSymbolItem = getSymbolItem(token,funcName);
//        System.out.println(token.getValue());
        if(theSymbolItem.getAddress() == 0){
//            System.out.println("this symbol addr == 0"+theSymbolItem);
        }
        putAddressSymbol(nowAddress+1,new SymbolItem(null,0,theSymbolItem.getValueInt())); // TODO 这里应该是变量吗
        theSymbolItem.setLoadAddress(nowAddress+1);
        return "%"+(++nowAddress)+" = load i32, i32* %"+theSymbolItem.getAddress();
    }
    public static SymbolItem getSymbolItem(Token ident,String funcName) throws CompileException {
        SymbolItem theSymbolItem = new SymbolItem("get_symbol example",-1);

        try {
            theSymbolItem = allLocalSymbolTable.get(funcName).get(ident.getValue());
            if(! allLocalSymbolTable.get(funcName).containsKey(ident.getValue())){
                throw new CompileException("this symbol"+ident.getValue()+"is not defined !!!");
            }
        }catch (CompileException e1){
            throw new CompileException("this symbol "+ident.getValue()+" is not defined !!!");
        }
        catch(Exception e){
            throw new CompileException("This ident"+ident.getValue()+"is not define");
        }
        return theSymbolItem;
    }
    public static int callFunction(String name,ArrayList<Integer> paramAddrList) throws CompileException {
        if(!funcSymbolTable.containsKey(name)){
            throw new CompileException("cant find  this function");
        }
        SymbolItem funcItem = funcSymbolTable.get(name);
        String outputStr = "";
        if(funcItem.type == 1){// 是否有返回值
            outputStr += "%"+(++nowAddress)+" = ";
        }
        outputStr += "call "; outputStr += (funcItem.type == 1)?"i32":"void";
        outputStr+=" "+name+"(";
        for(int i=0;i<funcItem.length;i++){
            outputStr+=" i32 ";
            SymbolItem item = getSymbolItemByAddress(paramAddrList.get(i));
            outputStr += item.kind == 1?item.getValueInt():"%"+item.getLoadAddress();
//        "%"+paramAddrList.get(i);
//            outputStr += " ";
        }outputStr+=")";
        Parser.midCodeOut.add(outputStr);
        return funcItem.type == 1?nowAddress:0;
    }


    public static int getIdentLVal(Token ident,String funcName) throws CompileException {
        // TODO 正确的找到真正数值
       int ret = -1;
       try {
          ret =  allLocalSymbolTable.get(funcName).get(ident.getValue()).getValueInt();
       }catch(Exception e){
           throw new CompileException("This ident"+ident.getValue()+"is not define");
       }SymbolItem thisSymbol = allLocalSymbolTable.get(funcName).get(ident.getValue());
//       if(thisSymbol.constInt == SymbolItem.NOT_ASSIGN){
//           throw new CompileException("This ident"+ident.getValue()+"is not Assign");
//       }
       return ret;
    }

    public static void initIOFunctions() {
        Parser.midCodeOut.add("declare i32 @getint()");
        Parser.midCodeOut.add("declare i32 @getch()");
        Parser.midCodeOut.add("declare void @putint(i32)");
        Parser.midCodeOut.add("declare void @putch(i32)");
        SymbolItem getint = new SymbolItem("@getint",2,0,1,0);
        SymbolItem getch = new SymbolItem("@getch",2,0,1,0);
        SymbolItem putint = new SymbolItem("@putint",2,0,0,1);
        SymbolItem putch = new SymbolItem("@putch",2,0,0,1);
        allFuncList.add("@getint");allFuncList.add("@putint");allFuncList.add("@getch");allFuncList.add("@putch");
        funcSymbolTable.put("@getint",getint); funcSymbolTable.put("@putint",putint); funcSymbolTable.put("@getch",getch);funcSymbolTable.put("@putch",putch);
    }
}
