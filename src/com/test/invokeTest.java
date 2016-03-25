package com.test;

import java.lang.reflect.Method;

public class invokeTest
{
    public void print(String string)
    {
        System.out.println("print(String string)");
        System.out.println(string);
    }


    public static void main(String[] args) throws Exception
    {
        invokeTest test = new invokeTest();

        // 调用 print(String string)
        Method method1 = test.getClass().getMethod("print", String.class);
        method1.invoke(test, "a");

    }

}