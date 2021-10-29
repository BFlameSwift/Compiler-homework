package lab03;

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
    public static Boolean isPlus(int type){return type == Lexical.PLUS;}
    public static Boolean isMinus(int type){return type == Lexical.MINUS;}
    public static Boolean isUnaryOp(int type){return isPlus(type) || isMinus(type);}
    public static Boolean isMultiply(int type){return type == Lexical.MUL;}
    public static Boolean isDiv(int type){return type == Lexical.DIV;}
    public static Boolean isMod(int type){return type == Lexical.MOD;}
    public static Boolean isLevel3Operator(int type){return isMod(type)|| isMultiply(type) || isDiv(type);}
    public static Boolean isConstDec(int type){return type == Lexical.CONST_DEC;}
    public static Boolean isIntDec(int type){return type == Lexical.INT_DEC;}
    public static Boolean isVoidDec(int type){return type == Lexical.VOID_DEC;}
    public static Boolean isEqual(int type){return type == Lexical.EQUALS;}
    public static Boolean isAssign(int type){return type == Lexical.ASSIGN;}

    public static Boolean isComma(int type){return type == Lexical.COMMA;}
    public static Boolean isDecl(int type){return isIntDec(type) || isConstDec(type);}

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

