package com.test;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class TestController extends Controller {
	
	public void index(){
		render("/test/index.jsp");
	}
	public void test(){
		render("/test/test.jsp");
	}
}
