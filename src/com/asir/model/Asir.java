package com.asir.model;

import java.util.List;

import javax.swing.text.AbstractDocument.Content;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Asir extends Model<Asir> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Asir dao = new Asir();
	
	public Page<Asir> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from t_form order by id asc");
	}
	
	//searchType检索的是标题还是作者还是……
	public Page<Asir> searchpaginate(int pageNumber, int pageSize, String searchWord){
		System.out.println("select * "+"from t_form where title like '%"+searchWord+"%' or author like '%"+searchWord+"%' or abstract like '%"+searchWord+"%' or keyword like '%"+searchWord+"%' order by id asc");
		return paginate(pageNumber, pageSize, "select id,title,author,resourceType,source,keyword,abstract",
				"from t_form where title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%' order by id asc");
	}
	
	//高级检索
	public Page<Asir> searchpaginate1(int pageNumber, int pageSize, String searchType1, String searchType2, String searchType3, String searchWord1, String searchWord2, String searchWord3){
		System.out.println("select * "+"from t_form where "+searchType1+" like '%"+searchWord1+"%' and "+searchType2+" like '%"+searchWord2+"%' and "+searchType3+" like '%"+searchWord3+"%' order by id asc");
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract", 
				"from t_form where "+searchType1+" like '%"+searchWord1+"%' "
						+ "and "+searchType2+" like '%"+searchWord2+"%' "
								+ "and "+searchType3+" like '%"+searchWord3+"%' order by id asc");
	}
	
	//聚类_MediaType
	public Page<Asir> searchpaginate2(int pageNumber, int pageSize, String mediaType, String searchWord){
		if(mediaType.equals("all")){
			return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
					"from t_form where title like '%"+searchWord+"%' "
							+ "or author like '%"+searchWord+"%' "
							+ "or abstract like '%"+searchWord+"%' "
							+ "or resourceType like '%"+searchWord+"%' "
							+ "or keyword like '%"+searchWord+"%' order by id asc  ");
		}
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	} 
	//MediaType计数
	public Page<Asir> count_baike(int pageNumber, int pageSize,String searchWord){
		String mediaType="百科";
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	}
	
	public Page<Asir> count_blog(int pageNumber, int pageSize,String searchWord){
		String mediaType="博客";
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	}
	public Page<Asir> count_course(int pageNumber, int pageSize,String searchWord){
		String mediaType="精品课程";
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	}
	public Page<Asir> count_ztxh(int pageNumber, int pageSize,String searchWord){
		String mediaType="中图学会";
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	}
	public Page<Asir> count_xdts(int pageNumber, int pageSize,String searchWord){
		String mediaType="现代图书情报";
		return paginate(pageNumber, pageSize, "select 't_form' as db ,id,title,author,resourceType,source,keyword,abstract",
				"from t_form where source = '"+mediaType+"' "
				+ "and (title like '%"+searchWord+"%' "
						+ "or author like '%"+searchWord+"%' "
						+ "or abstract like '%"+searchWord+"%' "
						+ "or resourceType like '%"+searchWord+"%' "
						+ "or keyword like '%"+searchWord+"%')order by id asc  ");
	}
	public List<Record> content(String id){
		String sql = "select title, author, content from t_form where id = '"+id+"'";
		List<Record> list = Db.find(sql);
		return list;
	}
}
