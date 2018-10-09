package net.artron.cms.cache;

public class SsmUtil {

    public static int convert(String key,int value){
        if (key==null){
            return value;
        }
        value=Integer.parseInt(key);
        return value;
    }
}
