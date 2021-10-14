package lab01;

import java.util.regex.Pattern;

/**
 * @author BFlame
 */
public class MyNumber {
    public static final  String NONZERO_DIGIT = "[1-9]+";
    public static final String OCTAL_DIGIT = "0[0-7]*";
    public static final String HEXADECIMAL = "\\b0[xX][0-9a-fA-F]+\\b";
    public static Boolean isNonZeroDigit(String str){
        Pattern pattern = Pattern.compile(NONZERO_DIGIT);
        return pattern.matcher(str).matches();
    }
    public static Boolean isOctalDigit(String str){
        Pattern pattern = Pattern.compile(OCTAL_DIGIT);
        return pattern.matcher(str).matches();
    }
    public static Boolean isHexadecimalDigit(String str){
        Pattern pattern = Pattern.compile(HEXADECIMAL);
        return pattern.matcher(str).matches();
    }
    public static Boolean isNumber(String str){
        return isNonZeroDigit(str) || isHexadecimalDigit(str) || isOctalDigit(str);
    }
    public static int  toInteger(String str){
        if( ! isNumber(str)) {
            throw new IllegalArgumentException("is not a number");
        }
        if(isHexadecimalDigit(str)){
            return Integer.valueOf(str.replaceAll("^0[x|X]", ""),16);
        }
        else if (isOctalDigit(str)){
            return Integer.valueOf(str,8);
        }
        else{
            return Integer.parseInt(str);
        }
    }

    public static void main(String[] args) {
        System.out.println(toInteger("0x123"));
    }
}
