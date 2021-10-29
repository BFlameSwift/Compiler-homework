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

    public static int getNowAddress() {
        return nowAddress;
    }

    public static void enterBlock(){
        blockIndex ++;
    }
    public static int getBlockIndex() {
        return blockIndex;
    }
    public static int allocateVariable(Token token,int kind,Boolean isGolbal) throws CompileException {

        nowAddress ++;
        String symbolName = token.getValue();
        SymbolItem symbolItem =  new SymbolItem(symbolName,kind);
        symbolItem.setAddress(nowAddress);
        if(isGolbal){
            globalSymbolTable.put(symbolName, symbolItem);
            return nowAddress;
        }
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
        // 自下向上查找变量 而后区分出不同类型的变量并赋值
        // TODO 暂时认为只有一个块
        SymbolItem symbolItem = new SymbolItem(token.getValue(),10);
        try{
            symbolItem = blockSymbolTable.get(blockIndex).get(token.getValue());
        }catch(Exception e){
            e.printStackTrace();
        }
        symbolItem.valueInt = value;
        return symbolItem.getAddress();
    }
    public static int storeConstVariable(String name,int value,String funcName) throws CompileException {
        SymbolItem item = new SymbolItem(name,1,value);
        item.setAddress(++ constAddress);
        if(name != null){
            putblockSymbolTable(item,blockIndex);
            putallocalSymbolTable(item,funcName);
        }putAddressSymbol(constAddress,item);

//        System.out.println(item.output());
        return item.getAddress();
    }

    public static String storeVariableOutput(int varAddr){
        return "store i32 %"+nowAddress+", i32* %"+varAddr;
    }

    public static int midExpCalculate(String op,int address1,int address2){
        SymbolItem item1 = getSymbolItemByAddress(address1),item2 = getSymbolItemByAddress(address2);
        int objKind = (item1.kind == 1 && item2.kind == 1)? 1:0,objValue; // 判断新地址的是不是变量 0 是变量，1不是变量
        objValue = calculateValue(item1.valueInt,op, item2.valueInt);
//        int objAddress = (objKind == 1)?(++constAddress):(++nowAddress);
        int objAddress = ++nowAddress;
        putAddressSymbol(objAddress,new SymbolItem(null,objKind,objValue));

        if(objKind == 0||objKind == 1){// 是变量就输出过程
            String outStr = "%"+objAddress+" = "+op+" i32 ";
            outStr += (item1.kind == 1)?item1.valueInt:"%"+item1.getAddress();
            outStr += ", ";
            outStr += (item2.kind == 1)?item2.valueInt:"%"+item2.getAddress();

            Parser.output.add(outStr);
        }

        return objAddress;
    }

    public static int calculateValue(int value1,String op,int value2){
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
            throw new IllegalArgumentException("not + -  / %");
        }
    }
    public static String loadLValOutput(Token token,String funcName) throws CompileException {
        SymbolItem theSymbolItem = getSymbolItem(token,funcName);
//        System.out.println(token.getValue());
        if(theSymbolItem.getAddress() == 0){
//            System.out.println("this symbol addr == 0"+theSymbolItem);
        }
        putAddressSymbol(nowAddress+1,new SymbolItem(null,0,theSymbolItem.valueInt)); // TODO 这里应该是变量吗
        return "%"+(++nowAddress)+" = load i32, i32* %"+theSymbolItem.getAddress();
    }
    public static SymbolItem getSymbolItem(Token ident,String funcName) throws CompileException {
        SymbolItem theSymbolItem = new SymbolItem("get_symbol example",-1);
        try {
            theSymbolItem = allLocalSymbolTable.get(funcName).get(ident.getValue());
        }catch(Exception e){
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
        if(funcItem.type == 1){
            outputStr += "%"+(++nowAddress)+" = ";
        }
        outputStr += "call "; outputStr += (funcItem.type == 1)?"i32":"void";
        outputStr+=" "+name+"(";
        for(int i=0;i<funcItem.length;i++){
            outputStr+="i32 @"+paramAddrList.get(i);
            outputStr += " ";
        }outputStr+=")";
        Parser.output.add(outputStr);
        return funcItem.type == 1?nowAddress:0;
    }


    public static int getIdentLVal(Token ident,String funcName) throws CompileException {
        // TODO 正确的找到真正数值
       int ret = -1;
       try {
          ret =  allLocalSymbolTable.get(funcName).get(ident.getValue()).valueInt;
       }catch(Exception e){
           throw new CompileException("This ident"+ident.getValue()+"is not define");
       }SymbolItem thisSymbol = allLocalSymbolTable.get(funcName).get(ident.getValue());
//       if(thisSymbol.constInt == SymbolItem.NOT_ASSIGN){
//           throw new CompileException("This ident"+ident.getValue()+"is not Assign");
//       }
       return ret;
    }
//    public static void storeConstVariable(Token token,int value,String funcName) throws CompileException{
//        SymbolItem constIdent = new SymbolItem(token.getValue(),1,value);
//
//        putallocalSymbolTable(constIdent,funcName);
//        putblockSymbolTable(constIdent,blockIndex);
//
//    }
}
