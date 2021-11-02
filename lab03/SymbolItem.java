package lab03;
import java.util.ArrayList;

/**
 * @author BFlame
 */
public class SymbolItem {
    public static final int NOT_ASSIGN = -1239032;
    public static final int ADDRESS_NOT_ASSIGN = 0;
    public String name;
    public int kind; // var 0,const 1,function 2,array 3
    public int type; // void 0 int 1;
    private int valueInt;

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

    public int getLoadAddress() {
        if(loadAddress == 0){
            throw new IllegalArgumentException("load address = 0");
        }
        return loadAddress;
    }

    public void setLoadAddress(int loadAddress) {
        this.loadAddress = loadAddress;
    }

    public int getAddress() {
        if( address == 0)
            throw new IllegalArgumentException("Address is not assign");
        return address;
    }

    public void setAddress(int address) {
        this.loadAddress = address;
        this.address = address;
    }

    public int length; // 数组长度，函数变量参数数目
    ArrayList<Integer> parametersList; // 参数类型

    public SymbolItem(String name,int kind ){
        this.name = name;
        this.kind = kind;
        length = valueInt = NOT_ASSIGN;
        address = ADDRESS_NOT_ASSIGN;
        parametersList = new ArrayList<>();
        type = 0;
    }
    public SymbolItem(String name,int kind,int valueInt){
        this.name = name;
        this.kind = kind;
        address = ADDRESS_NOT_ASSIGN;
        type = 0;
        length = 0; parametersList = new ArrayList<Integer>();
        this.valueInt = valueInt;
    }public SymbolItem(String name,int kind,int valueInt,int type,int length){
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
        if(kind == 1){
            out += "This is a const:"+name+" value = "+valueInt+ "in address:"+address;
        }else if(kind == 0){
            out += "This is a Variable:"+name+" value = "+valueInt+ "in address:"+address;
        }else{
            out += "not a const or var";
        }

        // TODO 根据不同种类输出
        return out;
    }
    public  Boolean isConstant(){
        return kind == 1;
    }


    @Override
    public String toString() {
        return "name："+name+" kind"+kind+" value:"+valueInt;
    }


}