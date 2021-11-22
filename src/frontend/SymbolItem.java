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
    public static final int ADDRESS_NOT_ASSIGN = 0;
    public String name;
    public int kind; // var 0,const 1,function 2,const array 3,var array 4
    public int type; // void 0 int 1,label 2;
    public Boolean isCond = false;
    public Boolean isLabel = false;
    private int valueInt;
    public int length; // 数组总长度，函数变量参数数目
    public int blockIndex = 0;
    public ArrayList<Integer> parametersList; // 参数类型  可以用作数据的对应维度的大小以及参数的类型
    public ArrayList<Integer> arrayAddrList;
    public int getValueInt() throws CompileException {
        if (valueInt == NOT_ASSIGN){
            throw new CompileException("this symbol"+name+ "is not assign value!!! cant read");
        }
        return valueInt;
    }

    public void setValueInt(int valueInt) {
        this.valueInt = valueInt;
    }

    private int address = 0;
    private int loadAddress = 0;
    public Boolean isGlobal(){
        return address>=Utils.GLOBAL_BEGIN_ADDRESS && address <0;
    }
    public int getLoadAddress() throws CompileException {
        if(loadAddress == 0){
            throw new CompileException("load address = 0");
        }
        return loadAddress;
    }

    public void setLoadAddress(int loadAddress) {
        this.loadAddress = loadAddress;
    }

    public int getAddress() throws CompileException {
        if( address == 0) {
            throw new CompileException("Address is not assign");
        }
        return address;
    }

    public void setAddress(int address) {
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
    public SymbolItem(String name,int kind,int valueInt,int type,int length){
        this.name = name;
        this.kind = kind;
        address = ADDRESS_NOT_ASSIGN;
        this.type = type;
        this.length = length; parametersList = new ArrayList<Integer>();
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
        }else{
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
            e.printStackTrace();
            for(String str : Parser.midCodeOut){
                System.out.println(str);
            }
            System.exit(-1);
        }
        ArrayList<String> itemList = new ArrayList<String>();
        for(int i=1;i<Utils.getNowAddress();i++){
            try {
                itemList.add(i+" ."+Utils.getSymbolItemByAddress(i).output());
            }catch (IllegalArgumentException e){
                itemList.add(i+"null");
            }catch (NullPointerException r){
                itemList.add(i+"null");
            }
        }Parser.outputFile("./test/symbolItem.txt",itemList);


        for(String str : Parser.midCodeOut){
            System.out.println(str);
        } Parser.outputFile(args[1],Parser.midCodeOut );

        System.exit(0);

    }

}