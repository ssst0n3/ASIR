package com.asir.controller;

import java.util.List;

import com.asir.model.Asir;
import com.asir.model.Small;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;

public class ContentController extends Controller {
	public void index() {
		render("index.jsp");
	}
	
	public void con() {
		String id =  getPara("id");
		setAttr("id", id);
		setAttr("obj", Small.dao.content(id));
		render("index.jsp");
	}
}
