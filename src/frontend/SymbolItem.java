package frontend;

import Util.CompileException;
import Util.Utils;
import jdk.jshell.execution.Util;

import java.io.FileNotFoundException;
import java.util.ArrayList;

/**
 * @author BFlame
 */
public class SymbolItem {
    public static final int NOT_ASSIGN = -1239032;
    public static final int ADDRESS_NOT_ASSIGN = -114514;
    public String name;
    public int kind; // var 0,const 1,function 2,const array 3,var array 4
    public int type; // void 0 int 1,label 2,pointer 3;
    public Boolean isCond = false;
    public Boolean isLabel = false;
    private int valueInt;
    private int address = ADDRESS_NOT_ASSIGN;
    private int loadAddress = ADDRESS_NOT_ASSIGN;
    public int length; // 数组总长度，函数变量参数数目
    public int blockIndex = 0;
    public ArrayList<Integer> parametersList; // 参数类型  可以用作数据的对应维度的大小以及参数的类型
    public ArrayList<Integer> arrayAddrList;
    public int getValueInt() throws CompileException {
        if (valueInt == NOT_ASSIGN){
            throw new CompileException("this symbol "+name+" address  " +address+" not assign value!!! cant read");
        }
        return valueInt;
    }

    public void setValueInt(int valueInt) {
        this.valueInt = valueInt;
    }
    public int addrListTransLocation(ArrayList<Integer> list) throws CompileException {
        if(list.size() != parametersList.size()){
            System.out.println("list");
            for(int item:list) System.out.printf("%d ",item);
            System.out.println("parametersList");
            for(int item:parametersList) System.out.printf("%d ",item);
            System.out.println("array.name = "+name);
            throw new CompileException("array size not match");
        }
        ArrayList<Integer> satisfiedList = Parser.makeSatisfyList(parametersList);
        int ret = 0;
        int  distination= Utils.allocateConst(0);
        for(int i=0;i<list.size()-1;i++){
            int addItemAddr = Utils.midExpCalculate("mul",list.get(i),Utils.allocateConst(satisfiedList.get(i+1)));
            distination = Utils.midExpCalculate("add",addItemAddr,distination);
        }distination = Utils.midExpCalculate("add",list.get(list.size()-1),distination);
//        for(int i=0;i<valueList.size()-1;i++){
//            ret += valueList.get(i)*satisfiedList.get(i+1);
//        }ret += valueList.get(valueList.size()-1);
        System.out.println("ret addr："+distination+" ret value"+Utils.getSymbolItemByAddress(distination));
        return distination;
    }

    public Boolean isGlobal(){
        return address>=Utils.GLOBAL_BEGIN_ADDRESS && address <0;
    }
    public int getLoadAddress() throws CompileException {
        if(loadAddress == ADDRESS_NOT_ASSIGN){
            throw new CompileException("load address = -114514");
        }
        return loadAddress;
    }public Boolean isArray(){
        return kind ==3||kind ==4;
    }public Boolean isPointer(){
        return type == 3 &&(kind!=3&&kind != 4);
    }

    public void setLoadAddress(int loadAddress) {
        this.loadAddress = loadAddress;
    }

    public int getAddress() throws CompileException {
        if( address == ADDRESS_NOT_ASSIGN) {
            throw new CompileException(name+" Address is not assign");
        }
        return address;
    }

    public void setAddress(int address) {
//        Utils.putAddressSymbol(address,this);
        this.loadAddress = address;
        this.address = address;
    }


    public SymbolItem(String name,int kind ){
        this.name = name;
        this.kind = kind;
        length = valueInt = NOT_ASSIGN;
        address = ADDRESS_NOT_ASSIGN;
        parametersList = new ArrayList<>();
        type = 0;
    }
    public SymbolItem(String name,int kind,int valueInt,int blockIndex){
        this.name = name;
        this.kind = kind;
        address = ADDRESS_NOT_ASSIGN;
        type = 0;
        length = 0; parametersList = new ArrayList<Integer>();
        this.blockIndex = blockIndex;
        this.valueInt = valueInt;
    } public SymbolItem(String name,int kind,int valueInt,Boolean isCond){
        this.name = name;
        this.kind = kind;
        address = ADDRESS_NOT_ASSIGN;
        type = 0;
        this.isCond = isCond;
        length = 0; parametersList = new ArrayList<Integer>();
        this.valueInt = valueInt;
    }
    public SymbolItem(String name,int kind,int type,int length,ArrayList<Integer> parametersList){
        this.name = name;
        this.kind = kind;
        address = ADDRESS_NOT_ASSIGN;
        this.type = type;
        this.length = length;
        this.parametersList = parametersList;
        this.valueInt = valueInt;
    }
    // TODO 函数与数组时新增
    public String output(){
        String out = "";
        if (isLabel){
            return "label:";
        }
        if(kind == 1){
            out += "This is a const:"+name+" value = "+valueInt+ "in address:"+address+"load addr"+loadAddress;
        }else if(kind == 0){
            out += "This is a Variable:"+name+" value = "+valueInt+ "in address:"+address+"load addr"+loadAddress;
        }else if(kind == 2){
            out += "This is a Function:"+name+" value = "+valueInt+ "in address:"+address+"load addr"+loadAddress;
        }else if(kind == 3){
            out += "This is a Const Array:"+name+" value = "+valueInt+ "in address:"+address+"load addr"+loadAddress;
        }else if(kind ==4){
            out += "This is a Variable Array:"+name+" value = "+valueInt+ "in address:"+address+"load addr"+loadAddress;
        }
        else{
            out += "not a const or var";
        }
        if(isCond) out += "   cond";

        // TODO 根据不同种类输出
        out += '\t'+"block: "+blockIndex;
        return out;
    }
    public  Boolean isConstant(){
        return kind == 1 || kind == 3;
    }


    @Override
    public String toString() {
        return "name："+name+" kind"+kind+" value:"+valueInt;
    }

    public static void main(String[] args) throws FileNotFoundException, CompileException {
        Utils.initIOFunctions();
        Parser.lexicalAnalysis(args[0]);
        try {
            Parser.parseCompUnit();
        }catch (CompileException e){
//            System.out.println(e);
//            e.printStackTrace();
            for(String str : Parser.midCodeOut){
                System.out.println(str);
            }ArrayList<String> itemList = new ArrayList<String>();
            for(int i=3;i<Utils.getNowAddress();i++){
                try {
                    itemList.add(i+" ."+Utils.getSymbolItemByAddress(i).output());
                }catch (IllegalArgumentException e1){
                    itemList.add(i+"null");
                }catch (NullPointerException r){
                    itemList.add(i+"null");
                }
            }
            System.exit(-1);
        }finally {
            ArrayList<String> itemList = new ArrayList<String>();
            for(int i=1;i<Utils.getNowAddress();i++) {
                try {
                    itemList.add(i + " ." + Utils.getSymbolItemByAddress(i).output());
                } catch (IllegalArgumentException e) {
                    itemList.add(i + "null");
                } catch (NullPointerException r) {
                    itemList.add(i + "null");
                }
            } Parser.outputFile("./test/symbolItem.txt",itemList);

            for(String str : Parser.midCodeOut){
                System.out.println(str);
            }
            for(String str: itemList){
                System.out.println(str);
            }
        }

        Parser.outputFile(args[1],Parser.midCodeOut );

        System.exit(0);

    }

}