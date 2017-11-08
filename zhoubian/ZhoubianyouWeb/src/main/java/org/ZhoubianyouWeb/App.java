package org.ZhoubianyouWeb;

import com.zhoubianyou.common.PropertyUtil;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        String s = PropertyUtil.getProperty("test");
        System.out.println(s);
    }
    
 
}
