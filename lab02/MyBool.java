package lab02;

/**
 * @author Bflame
 */
public class MyBool {
    public static Boolean isFuncType(int type){
        return type == Lexical.INT_DEC || type == Lexical.VOID_DEC;
    }
    public static Boolean isIdent(int type){
        return type == Lexical.IDENT;
    }
    public static Boolean isLParen(int type){
        return type == Lexical.LPAREN;
    }
    public static Boolean isRParen(int type){return type == Lexical.RPAREN;}
    public static Boolean isLBrace(int type){return type == Lexical.LBRACE;}
    public static Boolean isRBrace(int type){return type == Lexical.RBRACE;}
    public static Boolean isReturn(int type){return type == Lexical.RETURN_DEC;}
    public static Boolean isNumber(int type){return type == Lexical.DECIMAL_CONST;}
    public static Boolean isSemicolon(int type){return type == Lexical.SEMICOLON;}
    public static Boolean isLBlockComment(int type){return type == Lexical.LBLOCK_COMMENT;}
    public static Boolean isRBlockComment(int type){return type == Lexical.RBLOCK_COMMENT;}


//    public static Boolean Statements(String str){
//        if (MyConst.isNumber(str)){
//            return true;
//        }
//        else if (){
//            return true;
//        }
//        // 分号结尾
//        return false;
//    }

}

