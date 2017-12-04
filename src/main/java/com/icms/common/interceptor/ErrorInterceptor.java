package com.icms.common.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;


public class ErrorInterceptor implements Interceptor {


    @Override
    public void intercept(Invocation inv) {
        try {
            inv.invoke();
        } catch (Exception e) {
            System.out.println("-------------出錯誤了！---------------------");
//	            StringWriter sw = new StringWriter();
//	            PrintWriter pw = new PrintWriter(sw);
//	            e.printStackTrace(pw);
//	            pw.println();  

        }
    }
}
