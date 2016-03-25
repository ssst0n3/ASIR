package com.asir.controller;


import com.asir.model.Form;
import com.jfinal.core.Controller;

public class FormController extends Controller {
	/**
	 * 显示数据列表
	 */
	public void index(){
//		String sql = "select * from t_form order by id desc";
//		setAttr("objectlist", Form.dao.find(sql));
//		String sql = "from t_form order by id desc";
//		int pageNumber = getParaToInt("pageNum", 1);
//		setAttr("pageNum", pageNumber);
		setAttr("objectlist", Form.dao.paginate(getParaToInt(0, 1), 10));
		render("index.jsp");
	}
	
	public void add(){
		render("add.jsp");
	}
	
	public void doAdd(){
		Form form = getModel(Form.class);
		boolean flag = form.save();
		if (flag){
			redirect("/form/");
		}else{
			renderText("Sorry,Insert Failed!");
		}
	}
	
	public void queryById(){
		int id = getParaToInt(0);
		String sql = "select * from t_form where id = ? limit 1";
		Form form = Form.dao.findFirst(sql, id);
		setAttr("form", form);
		render("edit.jsp");
	}
	
	public void deleteById(){
		int id = getParaToInt(0);
		boolean flag = Form.dao.deleteById(id);
		if (flag){
			redirect("/form/");
		}else{
			render("Sorry,delete failed!");
		}
	}
	
	public void update(){
		Form form = getModel(Form.class);
		boolean flag = form.update();
		if (flag){
			redirect("/form/");
		}else{
			renderText("Sorry,update Failed!");
		}
	}
}
