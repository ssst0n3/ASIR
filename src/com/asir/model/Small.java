package com.asir.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Small extends Model<Small> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Small dao = new Small();
	
	public Page<Small> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from t_form order by id asc");
	}
	
	//篇章元数据
	public Page<Small> chapterpaginate(int pageNumber, int pageSize, String mediaType, String searchWord){
		if(mediaType.equals("all")){
			return paginate(pageNumber, pageSize, "select 资源ID,更新时间,标题,摘要,作者,资源类型,来源,篇关键词,存放路径",
					"from 篇章元数据1002  where 资源类型 like '%"+searchWord+"%' "
							+ "or 资源体裁 like '%"+searchWord+"%' "
							+ "or 标题 like '%"+searchWord+"%' "
							+ "or 篇关键词 like '%"+searchWord+"%' "
							+ "or 来源 like '%"+searchWord+"%' "
							+ "or 作者 like '%"+searchWord+"%'"
							+ "or 更新时间 like '%"+searchWord+"%'"
							+ "or 摘要 like '%"+searchWord+"%' order by 资源ID asc  ");
		}
		return paginate(pageNumber, pageSize, "select 资源ID,更新时间,标题,摘要,作者,资源类型,来源,篇关键词,存放路径",
				"from 篇章元数据1002  where 资源类型 = '"+mediaType+"' "
						+ "and (资源体裁	 	like '%"+searchWord+"%' "
							+ "or 标题 		like '%"+searchWord+"%' "
				 			+ "or 篇关键词	like '%"+searchWord+"%' "
							+ "or 来源 		like '%"+searchWord+"%' "
							+ "or 作者 		like '%"+searchWord+"%'	"
							+ "or 更新时间 	like '%"+searchWord+"%'	"
							+ "or 摘要 		like '%"+searchWord+"%'	) order by 资源ID asc  ");
	}
	
	public Record content(String id){
		String sql = "select 标题, 作者, 存放路径,篇关键词 from 篇章元数据1002 where 资源ID = '"+id+"'";
		Record res = Db.findFirst(sql);
		return res; 
	}

}
