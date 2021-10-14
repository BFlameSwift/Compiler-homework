package lab01;
import Word.*;
import Word.Number;

/**
 * @author Bflame
 */
public class Bool {
    public static Boolean isFuncType(String str){
        if (str.equals("void") || str.equals("int")){
            return true;
        }
        return false;
    }
    public static Boolean Statements(String str){
        if (Number.isNumber(str)){
            return true;
        }
        else if (str.equals("return")){
            return true;
        }
        // 分号结尾
        return false;
    }
}

