package lab03;
import java.util.ArrayList;

/**
 * @author BFlame
 */
public class SymbolItem {
    public String name;
    int kind; // var 0,const 1,function 2,array 3
    int constInt;
    int length; // 数组长度，函数变量参数数目
    ArrayList<Integer> parametersList; // 参数类型

    public SymbolItem(String name,int kind ){
        this.name = name;
        this.kind = kind;
        length = constInt = 0;
        parametersList = new ArrayList<>();
    }
    public SymbolItem(String name,int kind,int constInt){
        this.name = name;
        this.kind = kind;
        length = 0; parametersList = new ArrayList<Integer>();
        this.constInt = constInt;
    }
    // TODO 函数与数组时新增
    public String output(){
        String out = "";
        out += this.name;

        // TODO 根据不同种类输出
        return out;

    }

}