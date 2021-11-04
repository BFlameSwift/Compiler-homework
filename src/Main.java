import Util.CompileException;
import Util.Utils;
import frontend.*;
import java.io.FileNotFoundException;

public class Main {
    public static void main(String[] args) throws CompileException, FileNotFoundException {
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
        for(String str : Parser.midCodeOut){
            System.out.println(str);
        } Parser.outputFile(args[1],Parser.midCodeOut );
        System.exit(0);
    }
}
