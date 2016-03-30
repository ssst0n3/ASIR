package com.asir.model;

import java.awt.PageAttributes.MediaType;
import java.util.List;

import javax.print.attribute.standard.Media;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.test.ListSort;

public class Sentence extends Model<Sentence> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Sentence dao = new Sentence();
	
	public Page<Sentence> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from t_form order by id asc");
	}

	//senpaginate2 相关性直接相乘
	public Page<Record> senpaginate2(int pageNumber, int pageSize, String searchWord, String searchType){
		//检索
		String sql = "select `功能单元ID` as `fid`, `构成单元1002`.`构成ID` as cid, `来源文献` as `id`,`功能单元名` as `func`,`功能单元1002`.`构成` as `component`,`标题` as `title`,`篇章元数据1002`.`存放路径`,`功能单元1002`.`存储位置` as `abstract`,`构成单元1002`.`存储位置` as `com_content`,`摘要` as `content`,`资源类型` as `resourceType`,`跟进了解构成`,`参考事实构成`,`参考论断构成`,`学习背景构成`,`学习具体问题构成`,`学习具体如何做构成`,`跟进了解`,`参考事实`,`参考论断`,`学习背景`,`学习具体问题`,`学习具体如何做`,`学习背景体裁`,`学习具体如何做体裁`,`体裁`"
				+ "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
				+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
				+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
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
	
	//senpaginate3 乘完之后开n次方，n为构成数目
	public Page<Record> senpaginate3(int pageNumber, int pageSize, String mediaType, String searchWord, String searchType){
		//检索
		List<Record> list;
		if (mediaType.equals("all")){
			String sql = "select `功能单元ID` as `fid`, `构成单元1002`.`构成ID` as cid, `来源文献` as `id`,`功能单元名` as `func`,`信息单元和任务集合`.`func` as `任务说明`"
							+ ",`功能单元1002`.`构成` as `component`,`标题` as `title`,`功能单元1002`.`存储位置` as `abstract`"
							+ ",`篇章元数据1002`.`存放路径`,`构成单元1002`.`存储位置` as `com_content`,`摘要` as `content`,`资源类型` as `resourceType`,`跟进了解构成`"
							+ ",`参考事实构成`,`参考论断构成`,`学习背景构成`,`学习具体问题构成`,`学习具体如何做构成`,`跟进了解`,`参考事实`,`参考论断`,`学习背景`"
							+ ",`学习具体问题`,`学习具体如何做`,`学习背景体裁`,`学习具体如何做体裁`,`体裁`,`篇章元数据1002`.`作者`,`篇章元数据1002`.`来源`,`篇章元数据1002`.`更新时间`"
						+ "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
						+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
						+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
						+ "LEFT JOIN `信息单元和任务集合` ON (`信息单元和任务集合`.`type` = `聚合单元相关性`.`聚合单元`)"
						+ "where 标题 like '%"+searchWord+"%'"
							+ "or 篇关键词 like '%"+searchWord+"%' "
						+ "ORDER BY `功能单元ID` ASC";		
			list = Db.find(sql);
		}else {
			String sql = "select `功能单元ID` as `fid`, `构成单元1002`.`构成ID` as cid, `来源文献` as `id`,`功能单元名` as `func`,`信息单元和任务集合`.`func` as `任务说明`"
					+ ",`功能单元1002`.`构成` as `component`,`标题` as `title`,`功能单元1002`.`存储位置` as `abstract`"
					+ ",`篇章元数据1002`.`存放路径`,`构成单元1002`.`存储位置` as `com_content`,`摘要` as `content`,`资源类型` as `resourceType`,`跟进了解构成`"
					+ ",`参考事实构成`,`参考论断构成`,`学习背景构成`,`学习具体问题构成`,`学习具体如何做构成`,`跟进了解`,`参考事实`,`参考论断`,`学习背景`"
					+ ",`学习具体问题`,`学习具体如何做`,`学习背景体裁`,`学习具体如何做体裁`,`体裁`,`篇章元数据1002`.`作者`,`篇章元数据1002`.`来源`,`篇章元数据1002`.`更新时间`"
				+ "from ((`篇章元数据1002` RIGHT JOIN `构成单元1002` ON `篇章元数据1002`.`资源ID` = `构成单元1002`.`来源文献ID`) "
				+ "RIGHT JOIN `功能单元1002` ON `构成单元1002`.`构成ID`=`功能单元1002`.`构成ID`)"
				+ "LEFT JOIN `聚合单元相关性` ON (`聚合单元相关性`.`聚合单元`= `功能单元1002`.`功能单元名` AND `体裁`=`资源类型`)"
				+ "LEFT JOIN `信息单元和任务集合` ON (`信息单元和任务集合`.`type` = `聚合单元相关性`.`聚合单元`)"
				+ "where 资源类型 = '"+mediaType+"'"
					+ "and (标题 like '%"+searchWord+"%'"
						+ "or 篇关键词 like '%"+searchWord+"%' )"
				+ "ORDER BY `功能单元ID` ASC";	
			list = Db.find(sql);
		}
		//添加相关性数据
		//相关性数据为double类型并保留两位小数（mysql中为double）
		
		//初始化
		Record s, slast, snext, mark;
		int count = 0, num_component = 1, size = 1;
		double weight = 1,pow;
		
		for(int i = 0; i < list.size(); i++){
			count++;
			slast = i>0 ? list.get(i-1):list.get(0);
			s = list.get(i);
			snext = i < list.size()-1 ? list.get(i+1) : list.get(i);
			int id = Integer.parseInt(s.get("id").toString());
			int id_next = Integer.parseInt(snext.get("id").toString());
			int id_last = Integer.parseInt(slast.get("id").toString());
			//使用cid计算开方数，如果cid有错则开放次数会有误差
			int cid = Integer.parseInt(s.get("cid").toString());
			int cid_last = Integer.parseInt(slast.get("cid").toString());
			//这里使用component计算开方数
			String component = s.get("component");
			String component_last = slast.get("component");
			/*System.out.println(component+" "+component_last + " " + component.equals(component_last));*/
			Double a = (double) 1;
			Double b = (double) 1;
			Double c = (double) 1;
			if (searchType.equals("跟进了解")){
				if (s.get("跟进了解") != null)
					a = s.get("跟进了解");
				if (s.get("跟进了解构成") != null)
					b = s.get("跟进了解构成");			
			}else if (searchType.equals("参考事实")){
				if (s.get("参考事实") != null)
					a = s.get("参考事实");
				if (s.get("参考事实构成") != null)
					b = s.get("参考事实构成");	
			}else if (searchType.equals("参考论断")){
				if (s.get("参考论断") != null)
					a = s.get("参考论断");
				if (s.get("参考论断构成") != null)
					b = s.get("参考论断构成");	
			}else if (searchType.equals("学习背景")){
				if (s.get("学习背景") != null)
					a = s.get("学习背景");
				if (s.get("学习背景构成") != null)
					b = s.get("学习背景构成");
				if (s.get("学习背景体裁") != null)
					c = s.get("学习背景体裁");
			}else if (searchType.equals("学习具体问题")){
				if (s.get("学习具体问题") != null)
					a = s.get("学习具体问题");
				if (s.get("学习具体问题构成") != null)
					b = s.get("学习具体问题构成");	
			}else if (searchType.equals("学习具体如何做")){
				if (s.get("学习具体如何做") != null)
					a = s.get("学习具体如何做");
				if (s.get("学习具体如何做构成") != null)
					b = s.get("学习具体如何做构成");	
				if (s.get("学习具体如何做体裁") != null)
					c = s.get("学习具体如何做体裁");	
			}
			
			//如果是同一个篇章，则c应该重置为1
			if (i>0){
				if (id == id_last)
					c = (double) 1;
				else{ 
					num_component = 0;
					size++;
				}
			}	
			
			//如果是同一个构成，则b应该重置为1
			if (i>0){
				if (component.equals(component_last))
					b = (double) 1;
				else
					num_component++;
			}
			
			weight = weight*a*b*c;
			weight = Math.round(weight*100)/100.0;
			
			//当下一篇为新篇章时，同id的篇章全部赋相同权重，并重置weight,count,num_component
			if (id != id_next || i == list.size()-1){
				/*System.out.print(s.get("id") + " " + weight + " ");*/
				
				//开方
				if (num_component == 0) pow = 1;
				else pow = 1.0/num_component;
				weight = StrictMath.pow(weight, pow);
				weight = Math.round(weight*100)/100.0;
				
				/*System.out.println(num_component + " " + weight);*/
				
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
		if (size > 1)
			totalRow = size;
		totalPage = (int) (totalRow / pageSize);
		if (totalRow % pageSize != 0) {
			totalPage++;
		}
		return new Page<Record>(list, pageNumber, pageSize, totalPage, (int)totalRow);
	}
}
