package com.asir.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Inf extends Model<Inf> {
	private static final long serialVersionUID = 1L;
	public static Inf dao = new Inf();
	
	public Page<Inf> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from t_form order by id asc");
	}
	
	//功能单元元数据
	public Page<Inf> infpaginate(int pageNumber, int pageSize, String searchWord, String searchType){
		return paginate(pageNumber, pageSize, 
				"SELECT `来源文献ID` as `id`,`题名` as `title`,`构成名称` as `component`,`存储位置` as `abstract`,`资源类型` as `resourceType`",
				"FROM (`构成单元1002` JOIN `篇章元数据1002`)"
				+ "WHERE `来源文献ID` = `资源ID`"
						+ "and (`题名` like '%"+searchWord+"%'"
						+ "or `作者` like '%"+searchWord+"%'"
						+ "or `标题关键词` like '%"+searchWord+"%'"
						+ "or `更新时间` like '%"+searchWord+"%'"
						+ "or `资源类型` like '%"+searchWord+"%')"
				+ "ORDER BY `构成ID`");
	}

}
