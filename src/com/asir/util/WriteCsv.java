package com.asir.util;

import java.io.BufferedWriter;  
import java.io.File;  
import java.io.FileNotFoundException;  
import java.io.FileWriter;  
import java.io.IOException;  
 
public class WriteCsv {  
 
  public static void main(String[] args) {  
    try {  
      File csv = new File("/ui/data/source.csv"); // CSV数据文件 
 
      BufferedWriter bw = new BufferedWriter(new FileWriter(csv, true)); // 附加 
      // 添加新的数据行 
      bw.write("\"李四\"" + "," + "\"1988\"" + "," + "\"1992\"");  
      bw.newLine();  
      bw.close();  
 
    } catch (FileNotFoundException e) {  
      // File对象的创建过程中的异常捕获 
      e.printStackTrace();  
    } catch (IOException e) {  
      // BufferedWriter在关闭对象捕捉异常 
      e.printStackTrace();  
    }  
  }  
}