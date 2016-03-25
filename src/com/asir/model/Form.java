package com.asir.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Form extends Model<Form> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Form dao = new Form();
	
	public Page<Form> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from t_form order by id asc");
	}
}
