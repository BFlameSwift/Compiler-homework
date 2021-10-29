package lab03;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Utils {


    public static Map<String, SymbolItem> globalSymbolTable = new HashMap<String, SymbolItem>();
    public static Map<String, SymbolItem> LocalSymbolTable = new HashMap<String, SymbolItem>();
//    public static Map<Integer ,SymbolItem> addressSymbolTable = new HashMap<Integer, SymbolItem>(); // <
    public static ArrayList<HashMap<String, SymbolItem> > blockSymbolTable = new ArrayList<HashMap<String, SymbolItem>>();
    public static Map<String,HashMap<String, SymbolItem>> allLocalSymbolTable = new HashMap<String,HashMap<String, SymbolItem>>(); // 按照函数存储变量
    private static int blockIndex = -1;



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
        symbolItem.address = nowAddress;
        if(isGolbal){
            globalSymbolTable.put(symbolName, symbolItem);
            return nowAddress;
        }
        //TODO 根据不同函数进入不同的Map块
        putallocalSymbolTable(symbolItem,"main");
        putblockSymbolTable(symbolItem,blockIndex);
        return nowAddress;
    }
    public static void putallocalSymbolTable(SymbolItem symbolItem,String funcName){
        try {
            allLocalSymbolTable.get(funcName).put(symbolItem.name,symbolItem);
        }catch(NullPointerException e){
            allLocalSymbolTable.put(funcName,new HashMap<String, SymbolItem>()) ;
            allLocalSymbolTable.get(funcName).put(symbolItem.name,symbolItem);
        }
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
        symbolItem.constInt = value;
        return symbolItem.address;
    }


    public static String storeVariableOutput(int varAddr){
        return "store i32 %"+nowAddress+", i32* %"+varAddr;
    }

    public static String midExpOutput(String op,String num1,String num2){
        return "%"+(++nowAddress) + " = "+op+" i32 "+num1+", "+num2;
    }
    public static String loadLValOutput(Token token,String funcName) throws CompileException {
        SymbolItem theSymbolItem = getSymbolItem(token,funcName);
//        System.out.println(token.getValue());
        if(theSymbolItem.address == 0){
            System.out.println(theSymbolItem);
        }
        return "%"+(++nowAddress)+" = load i32, i32* %"+theSymbolItem.address;
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
    public static int getIdentLVal(Token ident,String funcName) throws CompileException {
        // TODO 正确的找到真正数值
       int ret = -1;
       try {
          ret =  allLocalSymbolTable.get(funcName).get(ident.getValue()).constInt;
       }catch(Exception e){
           throw new CompileException("This ident"+ident.getValue()+"is not define");
       }SymbolItem thisSymbol = allLocalSymbolTable.get(funcName).get(ident.getValue());
//       if(thisSymbol.constInt == SymbolItem.NOT_ASSIGN){
//           throw new CompileException("This ident"+ident.getValue()+"is not Assign");
//       }
       return ret;
    }
    public static void storeConstVariable(Token token,int value,String funcName) throws CompileException{
        SymbolItem constIdent = new SymbolItem(token.getValue(),1,value);

        putallocalSymbolTable(constIdent,funcName);
        putblockSymbolTable(constIdent,blockIndex);

    }
}
