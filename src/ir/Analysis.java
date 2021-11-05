package ir;

import java.util.ArrayList;
import Util.CompileException;
/**
 * @author ly
 * @date 2021/11/3 16:00
 */
public class Analysis {
    public static final String BR_ADDRESS1 = "Myplaceholder1",BR_ADDRESS2 = "Myplaceholder2";
    public static final String LEAVE_ADDRESS = "jumpToEndAddr";

    public ArrayList<String> midCode = new ArrayList<String>();
    public static void replaceStrInList(ArrayList<String> list,String before,String after) throws CompileException {
        for (int i=list.size()-1;i>=0;i--){
            String str = list.get(i);
            if(str.indexOf(before)>=0){
                list.set(i,str.replaceAll(before,after));
                return ;
            }
        }
//        throw new CompileException("nothing "+before+" to replace");
    }
}
