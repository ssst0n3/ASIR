package com.asir.controller;

import com.jfinal.core.Controller;

public class IndexController extends Controller {
	public void index(){

	}
	
	public void basicSearch(){
		render("/asir/basicSearch.jsp");
	}
}
