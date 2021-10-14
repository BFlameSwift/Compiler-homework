package lab01;
import Word.MyNumber;

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
        if (MyNumber.isNumber(str)){
            return true;
        }
        else if (str.equals("return")){
            return true;
        }
        // 分号结尾
        return false;
    }
}

