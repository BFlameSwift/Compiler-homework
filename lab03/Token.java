package lab03;

public class Token {

    public int getLexcial() {
        return lexcial;
    }



    public int getLineNumber() {
        return lineNumber;
    }

    private int lexcial;
    private String value;

    public String getValue() {
        return value;
    }

    private int lineNumber;

    public Token(int lexcial, String value, int lineNumber) {
        this.lexcial = lexcial;
        this.value = value;
        this.lineNumber = lineNumber;
    }

}
