package com.asir.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.test.ListSort;
import com.test.Student;

public class Test extends Model<Test> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Test dao = new Test();
	
	
/*	public List<Test> senpaginate(int pageNumber, int pageSize, String searchWord, String searchType){
		String sqlExceptSelect = "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
				+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
				+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
				+ "ORDER BY `功能单元ID` ASC";
		List<Test> result = Db.query("select *" + DbKit.replaceFormatSqlOrderBy(sqlExceptSelect));
		
		for(Test s:result){
			System.out.println(s);
		}
		return result;
	}*/
	
	//senpaginate1同一字段会重复出现
	public Page<Record> senpaginate1(int pageNumber, int pageSize, String searchWord, String searchType){
		//检索
		String sql = "select `功能单元ID` as `fid`, `构成单元1002`.`构成ID` as cid, `来源文献` as `id`,`功能单元名` as `func`,`功能单元1002`.`构成` as `component`,`标题` as `title`,`功能单元1002`.`存储位置` as `abstract`,`构成单元1002`.`存储位置` as `com_content`,`摘要` as `content`,`资源类型` as `resourceType`,`跟进了解构成`,`参考事实构成`,`参考论断构成`,`学习背景构成`,`学习具体问题构成`,`学习具体如何做构成`,`跟进了解`,`参考事实`,`参考论断`,`学习背景`,`学习具体问题`,`学习具体如何做`,`学习背景体裁`,`学习具体如何做体裁`,`体裁`"
				+ "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
				+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
				+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
				+ "where 标题 like '%"+searchWord+"%'"
					+ "or 篇关键词 like '%"+searchWord+"%' "
				+ "ORDER BY `功能单元ID` ASC";		
		List<Record> list = Db.find(sql);

		//添加相关性数据
		//相关性数据为double类型并保留两位小数（mysql中为double）
		double weight = 1;
		int id_last;
		int id_last1 = -1;
		int cid_last;
		int cid_last1 = -1;
		int count = 0;
		Record s;
		for (int i = 0; i < list.size(); i++) {
			s = list.get(i);
			//初始化id,cid
			int id = Integer.parseInt(s.get("id").toString());
			int cid = Integer.parseInt(s.get("cid").toString());
			id_last = id_last1;
			cid_last = cid_last1;
			
			//id 判断是否是同一篇文章，以重置weight,count
			if (id != id_last){
				weight = 1;
				count = 0;
			}
			Double a = (double) 1;
			Double b = (double) 1;
			if (s.get("跟进了解") != null)
				a = s.get("跟进了解");
			if (s.get("跟进了解构成") != null)
				b = s.get("跟进了解构成");
			
			//cid 判断是否是同一个构成，以免重复计算
			if (cid == cid_last){
				b = (double)1;
			}else{
				count++;
			}
			weight = weight*a*b;
			weight = Math.round(weight*100)/100.0;			
			s.set("weight", weight);
			id_last1 = id;
			cid_last1 = cid;
		}
		
		//下面实现按照weight倒序排列
		ListSort<Record> listSort = new ListSort<Record>();
		listSort.Sort(list, "get", "weight", "desc");
		//pageinate
		return new Page<Record>(list, pageNumber, pageSize, 6, (int)1255);
	}
	
	public Page<Record> senpaginate2(int pageNumber, int pageSize, String searchWord, String searchType){
		//检索
		String sql = "select `功能单元ID` as `fid`, `构成单元1002`.`构成ID` as cid, `来源文献` as `id`,`功能单元名` as `func`,`功能单元1002`.`构成` as `component`,`标题` as `title`,`功能单元1002`.`存储位置` as `abstract`,`构成单元1002`.`存储位置` as `com_content`,`摘要` as `content`,`资源类型` as `resourceType`,`跟进了解构成`,`参考事实构成`,`参考论断构成`,`学习背景构成`,`学习具体问题构成`,`学习具体如何做构成`,`跟进了解`,`参考事实`,`参考论断`,`学习背景`,`学习具体问题`,`学习具体如何做`,`学习背景体裁`,`学习具体如何做体裁`,`体裁`"
				+ "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
				+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
				+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
				+ "where 标题 like '%"+searchWord+"%'"
					+ "or 篇关键词 like '%"+searchWord+"%' "
				+ "ORDER BY `功能单元ID` ASC";		
		List<Record> list = Db.find(sql);

		//添加相关性数据
		//相关性数据为double类型并保留两位小数（mysql中为double）
		
		//初始化
		Record s, slast, snext, mark;
		int count = 0;
		double weight = 1;
		
		for(int i = 0; i < list.size(); i++){
			count++;
			slast = i>0 ? list.get(i-1):list.get(0);
			s = list.get(i);
			snext = i < list.size()-1 ? list.get(i+1) : list.get(i);
			int id = Integer.parseInt(s.get("id").toString());
			int id_next = Integer.parseInt(snext.get("id").toString());
			int cid = Integer.parseInt(s.get("cid").toString());
			int cid_last = Integer.parseInt(slast.get("cid").toString());


			Double a = (double) 1;
			Double b = (double) 1;
			if (s.get("跟进了解") != null)
				a = s.get("跟进了解");
			if (s.get("跟进了解构成") != null)
				b = s.get("跟进了解构成");			
			//如果是同一个构成，则b应该重置为1
			if (i>0){
				if (cid == cid_last)
					b = (double) 1;
			}
			
			weight = weight*a*b;
			weight = Math.round(weight*100)/100.0;
	
			
			
			//当下一篇为新篇章时，同id的篇章全部赋相同权重，并重置weight,count
			if (id != id_next || i == list.size()-1){
				for (int j = i; j > i-count; j--){
					mark = list.get(j);
					mark.set("weight", weight);
				}
				weight = 1;
				count = 0;
			}
		}		
/*		for(Record s1:list){
			System.out.println(s1.get("id") + " " + s1.get("cid") + " " + s1.get("weight"));
		}*/
	
		//下面实现按照weight倒序排列
		ListSort<Record> listSort = new ListSort<Record>();
		listSort.Sort(list, "get", "weight", "desc");
		
		//pageinate
		long totalRow = 0;
		int totalPage = 0;
		int size = list.size();
		if (size > 1)
			totalRow = list.size();
		totalPage = (int) (totalRow / pageSize);
		return new Page<Record>(list, pageNumber, pageSize, totalPage, (int)totalRow);
	}
}
