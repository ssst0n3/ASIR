<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>
<script  type="text/javascript">
	function ABS(id1,abs) {
		document.getElementById(id1+100000).innerHTML = abs;
	}
	function COM(id1,id2){
		document.getElementById(id1+10000).innerHTML = document.getElementById(id2+20000).innerHTML;
	}
	function CONTENT(id){
		var contentId = id+100000;
	 	var str1 = $("#"+contentId);
	 	var content1 = $("#the_result_" +id+ " .component .func_content1:hidden");
	 	var content2 = $("#the_result_" +id+ " .component .func_content2:hidden");
	 	
	 	content1.each(function(){
		 	var trim = $.trim($(this).html());
		 	str1.html(str1.html().replace(trim, '<span class="func_content1">'+trim+'</span>'));	 		
	 	});

	 	content2.each(function(){
		 	var trim = $.trim($(this).html());
		 	str1.html(str1.html().replace(trim, '<span class="func_content2">'+trim+'</span>'));	 		
	 	});
	 	
	 	
	 	str2 = str1.html().replace(new RegExp("  ",'gm'),"&nbsp;")
/* 	 			   .replace(new RegExp("<",'gm'),"&lt;")
	 			   .replace(new RegExp(">",'gm'),"&gt;") */
	 			   .replace(new RegExp("\n",'gm'),"<br><br>");
	 	document.getElementById(id+10000).innerHTML = str2;
	}
	function ADD(fid1,fid2){
		document.getElementById(fid1+30000).innerHTML +='</br> </br> <div style="BORDER-TOP: #00686b 1px dashed; OVERFLOW: hidden; HEIGHT: 1px"></div></br> ' + document.getElementById(fid2+30000).innerHTML;
	}
	function fidAddToCid(cid,fid){
		document.getElementById(cid+20000).innerHTML += document.getElementById(fid+30000).innerHTML + '</br>';
	}
	function addTitle(fid,str1,str2){
		str = str1 + ":   " + str2;
		document.getElementById(30000+fid).getElementsByTagName("p")[0].setAttribute("title",str);
	}
</script>
</head>

<body>
<c:forEach items="${objectlist.list}" var="obj" varStatus="status">
	<!-- 第一个结果 -->
	<c:if test="${status.count == 1}">
		<div id="the_result_${obj.id}" class="the_result">
			<!-- 新的title -->
			<div class="titletitle">
				<a id="${obj.id}" href="##${obj.id}" onclick="CONTENT(${obj.id});">[${obj.resourceType}]${obj.title}</a>
			</div>
			<div id="${100000+obj.id}" style="display:none;">${obj.存放路径}</div>
			<c:set var="id" value="${obj.id}"/>
			<c:set var="abstract_last" value="${obj.abstract}"/>
			<c:set var="cid" value="66666"/>
			<div class="zhaiyao">
			<!-- div zhaiyao 结束在div the_result 结束前 -->
		<!-- div the_result 的结束在新结果之前 -->
   	</c:if><!-- 判断是否是第一个结果 -->

	<!-- 新的结果 -->
	<c:if test="${obj.id != id}">
		</div><!-- div zhaiyao end -->
		<div class="longTextBox2" ><span id="${10000+id}">${abstract_last}</span></div>
		<c:set var="abstract_last" value="${obj.abstract}"/>
		<!-- 其他信息 -->
		<div class="op" align="left" >
			<span style="display:inline-block; width:230px;"><span style="color:#164988; font-weight:bold;">作者：</span>${obj.作者}</span>
			<span style="display:inline-block; width:160px;"><span style="color:#164988; font-weight:bold;">更新时间：</span>${obj.更新时间}</span>
			<span style="color:#164988; font-weight:bold;">来源：</span>${obj.来源}
		</div> <!-- div op end -->
		</div><!-- div the_result end -->
		<div id="the_result_${obj.id}" class="the_result">
			<div class="titletitle">
				<a id="${obj.id}" href="##${obj.id}" onclick="CONTENT(${obj.id});">[${obj.resourceType}]${obj.title}[${obj.weight}]</a>
			</div>
			<div id="${100000+obj.id}" style="display:none;">${obj.存放路径}</div>
			<c:set var="id" value="${obj.id}"/>
			<div class="zhaiyao">
			<!-- div zhaiyao 结束在div the_result 结束前 -->
		<!-- div the_result的结束在新结果之前 -->
		
   	</c:if>



   	<!-- 重复的title -->
	<c:if test="${id==obj.id}">
		<!-- 新的构成单元 -->
		<c:if test="${cid!=obj.cid}">
			<c:set var="cid" value="${obj.cid}"/>
			<div id="${20000+obj.cid}" style="display:none;" class="component"></div>
			<!-- component的超链接 -->
			<a class="abstraLink <c:if test="${searchType=='跟进了解'}"> <c:if test="${obj.跟进了解构成<=1.21}">orangeLink</c:if> <c:if test="${obj.跟进了解构成==1.5}">redLink</c:if> </c:if> <c:if test="${searchType=='参考事实'}"> <c:if test="${obj.参考事实构成<=1.5}">orangeLink</c:if> </c:if> <c:if test="${searchType=='参考论断'}"> <c:if test="${obj.参考论断构成<=1.5}">orangeLink</c:if> </c:if> <c:if test="${searchType=='学习背景'}"> <c:if test="${obj.学习背景构成<=1.5}">orangeLink</c:if> </c:if> <c:if test="${searchType=='学习具体问题'}"> <c:if test="${obj.学习具体问题构成<=1.5}">orangeLink</c:if> </c:if> <c:if test="${searchType=='学习具体如何做'}"> <c:if test="${obj.学习具体如何做构成<=1.5}">orangeLink</c:if> </c:if>
				"id="${obj.id}" href="##${obj.cid}"
				onclick="COM(${obj.id},${obj.cid});this.href += new Date().getTime();">${obj.component}&nbsp;
			</a> <!-- obj.component -->
		</c:if><!-- 判断是否是第一个component-->

		<!-- 重复的构成单元 -->
		<c:if test="${cid==obj.cid}">
			<div id="${30000+obj.fid}" style="display:none;">
				<p class="<c:if test="${searchType=='跟进了解'}"><%-- float不可以设置为==1.2；因为，1.2不可以完全表示成2的次方数之和，因此不可能相等 “--%><%-- 因此数据库中应该修改为定点数存储“--%><c:if test="${obj.跟进了解<=1.21}">func_content1</c:if><c:if test="${obj.跟进了解==1.5}">func_content2</c:if></c:if><c:if test="${searchType=='参考事实'}"><c:if test="${obj.参考事实<=1.5}">func_content1</c:if><c:if test="${obj.参考事实==1.5}">func_content2</c:if></c:if><c:if test="${searchType=='参考论断'}"><c:if test="${obj.参考论断<=1.5}">func_content1</c:if><c:if test="${obj.参考论断==1.5}">func_content2</c:if></c:if><c:if test="${searchType=='学习背景'}">    <c:if test="${obj.学习背景<=1.5}">func_content1</c:if><c:if test="${obj.学习背景==1.5}">func_content2</c:if></c:if><c:if test="${searchType=='学习具体问题'}"><c:if test="${obj.学习具体问题<=1.5}">func_content1</c:if><c:if test="${obj.学习具体问题==1.5}">func_content2</c:if></c:if><c:if test="${searchType=='学习具体如何做'}"><c:if test="${obj.学习具体如何做<=1.5}">func_content1</c:if><c:if test="${obj.学习具体如何做==1.5}">func_content2</c:if></c:if>">
					${obj.abstract}
				</p>
				<script>addTitle(${obj.fid},'${obj.func}','${obj.任务说明}')</script>
			</div>
			<script>fidAddToCid(${obj.cid},${obj.fid})</script>
		</c:if> <!-- 判断是否是重复的component -->
	</c:if><!-- 判断是否是重复的title -->
	
   	<!-- 判断是否是最后一个结果 -->
	<c:if test="${status.last}">
		</div><!-- div zhaiyao end -->
		<div class="longTextBox2" ><span id="${10000+id}">${abstract_last}</span></div>
		<!-- 其他信息 -->
		<div class="op" align="left" >
			<span style="display:inline-block; width:230px;"><span style="color:#164988; font-weight:bold;">作者：</span>${obj.作者}</span>
			<span style="display:inline-block; width:160px;"><span style="color:#164988; font-weight:bold;">更新时间：</span>${obj.更新时间}</span>
			<span style="color:#164988; font-weight:bold;">来源：</span>${obj.来源}
		</div> <!-- div op end -->
		</div><!-- div the_result end -->
	</c:if>

</c:forEach>
</body>
</html>
