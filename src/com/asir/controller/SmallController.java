package com.asir.controller;


import com.asir.model.Inf;
import com.asir.model.Sentence;
import com.asir.model.Small;
import com.asir.model.Test;
import com.jfinal.core.Controller;

public class SmallController extends Controller {
	public void index(){
		render("index.jsp");
	}
	public void chapter(){
		setAttr("objectlist", Small.dao.chapterpaginate(getParaToInt("page", 1), 25 ,getPara("mediaType", "all"), getPara("searchWord", "")));
		setAttr("searchWord", getPara("searchWord"));
		render("chapter.jsp");
	}
	public void inf(){
		setAttr("objectlist", Inf.dao.infpaginate(getParaToInt("page", 1), 25 , getPara("searchWord", ""), getPara("searchType", "介绍")));
		setAttr("searchType", getPara("searchType"));
		setAttr("searchWord", getPara("searchWord"));
		render("inf.jsp");
	}
	public void sentence(){
		setAttr("objectlist", Sentence.dao.senpaginate3(getParaToInt("page", 1), 5 
				, getPara("mediaType", "all"), getPara("searchWord", "")
				, getPara("searchType","跟进了解")));
		setAttr("searchType", getPara("searchType"));
		setAttr("searchWord", getPara("searchWord"));
		render("sentence.jsp");
	}
	public void test(){
		setAttr("objectlist", Test.dao.senpaginate2(getParaToInt("page", 1), 200 , getPara("", ""), getPara("searchType", "介绍")));
		setAttr("searchType", getPara("searchType"));
		setAttr("searchWord", getPara("searchWord"));
		render("/test/test.jsp");
	}
}
/*
setAttr("objectlist", Asir.dao.chapterpaginate(getParaToInt("page", 1), 25 ,
getPara("resourceType", ""), getPara("sourceType", ""), getPara("title", ""),
getPara("keyword", ""),getPara("source", ""),getPara("author", ""),
getPara("updateTime", ""), getPara("abstr", "")));
setAttr("sourceType", getPara("sourceType",""));
render("chapter.jsp");
*/