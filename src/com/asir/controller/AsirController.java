package com.asir.controller;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;

import com.asir.model.Asir;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class AsirController extends Controller {
	public String objString;
	
	public void index(){
		render("searchResult.jsp");
		//	render("basicSearch.jsp");
	}
	
	public void advancedSearch(){
		render("advancedSearch.jsp");
	}
	
	public void basicSearchResult(){
		setAttr("objectlist", Asir.dao.searchpaginate(getParaToInt("page", 1), 25 ,getPara("searchWord", "")));
		setAttr("searchType", getPara("searchType"));
		setAttr("searchWord", getPara("searchWord",""));
		render("searchResult.jsp");
	}
	
	public void advancedSearchResult(){
		setAttr("objectlist", Asir.dao.searchpaginate1(getParaToInt("page", 1), 25, getPara("searchType1"), getPara("searchType2"), getPara("searchType3"), getPara("searchWord1", ""), getPara("searchWord2", ""), getPara("searchWord3", "")));
		setAttr("searchWord1", getPara("searchWord1",""));setAttr("searchWord2", getPara("searchWord2",""));setAttr("searchWord3", getPara("searchWord3",""));
		render("searchResult.jsp");
	}
	
	public void clusterSearchResult(){
		String mediaType=getPara("mediaType");
		setAttr("objectlist", Asir.dao.searchpaginate2(getParaToInt("page", 1), 25, mediaType ,getPara("searchWord", "")));
		setAttr("Blog", Asir.dao.count_blog(getParaToInt("page", 1), 25, getPara("searchWord", "")));
		setAttr("Course", Asir.dao.count_course(getParaToInt("page", 1), 25, getPara("searchWord", "")));	
		setAttr("Ztxh", Asir.dao.count_ztxh(getParaToInt("page", 1), 25, getPara("searchWord", "")));
		setAttr("Xdts", Asir.dao.count_xdts(getParaToInt("page", 1), 25, getPara("searchWord", "")));
		
		Page<Asir> baike = Asir.dao.count_baike(getParaToInt("page", 1), 25, getPara("searchWord", ""));
		Page<Asir> blog = Asir.dao.count_blog(getParaToInt("page", 1), 25, getPara("searchWord", ""));
		Page<Asir> course = Asir.dao.count_course(getParaToInt("page", 1), 25, getPara("searchWord", ""));
		Page<Asir> ztxh = Asir.dao.count_ztxh(getParaToInt("page", 1), 25, getPara("searchWord", ""));
		Page<Asir> xdts = Asir.dao.count_xdts(getParaToInt("page", 1), 25, getPara("searchWord", ""));

		String count_baike = String.valueOf(baike.getTotalRow());
		String count_blog = String.valueOf(blog.getTotalRow());
		String count_course = String.valueOf(course.getTotalRow());
		String count_ztxh = String.valueOf(ztxh.getTotalRow());
		String count_xdts = String.valueOf(xdts.getTotalRow());
		String []count = {"百科", count_baike, "博客", count_blog, "精品课程", count_course, "中国图书馆学会", count_ztxh, "现代图书情报技术", count_xdts };
		
		WriteCsv(count);
		
		setAttr("searchType", getPara("searchType"));
		setAttr("searchWord", getPara("searchWord",""));
		render("searchResult.jsp");
		
	}
	
	public void singleResult(){
	
	}
	
	public void visual(){
		render("Visulize.jsp");
	}
	
	
	
	
	public static void WriteCsv(String[] args) {  
	    try {  
	      File csv = new File("F:/j2ee_workspace_20150513/ASIR_advanced/WebRoot/ui/data/source.csv"); // CSV数据文件 	      
	      BufferedWriter bw = new BufferedWriter(new FileWriter(csv)); // 附加 
	      // 添加新的数据行 
	      bw.write("\"Title\"" + "," + "\"amount\"");  
	      bw.newLine();  
	      for (int i = 0; i < args.length; i+=2) {
	    	  bw.write(args[i] + "," + args[i+1]);  
		      bw.newLine();
	      }      
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
