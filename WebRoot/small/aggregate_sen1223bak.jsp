<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>

<script  type="text/javascript">
	function ABS(id1,abs) {
		document.getElementById(id1+10000).innerHTML = abs;
	}
	function COM(id1,id2){
		document.getElementById(id1+10000).innerHTML = document.getElementById(id2+20000).innerHTML;
	}
	function FUN(id1,id2){
		document.getElementById(id1+10000).innerHTML = document.getElementById(id2+30000).innerHTML;
	}
	function ADD(fid1,fid2){
		
		document.getElementById(fid1+30000).innerHTML +='</br> </br> <div style="BORDER-TOP: #00686b 1px dashed; OVERFLOW: hidden; HEIGHT: 1px"></div></br> ' + document.getElementById(fid2+30000).innerHTML;
	}
</script>

</head>
<body>
	<c:set var="start_flag" value="1"/>
	<c:forEach items="${objectlist.list}" var="obj" vaStatus="status">
		<%-- 第一个结果的title --%>
		<c:if test="${start_flag==1}">
			<c:set var="abstract_last" value="${obj.abstract}"/>
			<c:set var="id" value="${obj.id}"/>
			<div class="the_result">
					<%-- 标题 --%>
<%--
					<div class="titletitle">
						<a id="${obj.id}" href="javascript:void(0)" onclick="ABS(${obj.id},'${obj.content}')">[${obj.resourceType}]${obj.title}[${obj.weight}]</a>
					</div>
--%>
  
 				<div class="titletitle">
						<a id="${obj.id}" href="/content/con?id=${obj.id}">[${obj.resourceType}]${obj.title}[${obj.weight}]</a>
				</div>
	
			<c:set var="start_flag" value="0"/>
			
			<%--  第一个结果的component --%>
			<c:set var="component" value="${obj.component}"/>
			<c:set var="func" value="justForDifference"/>
			<div class="zhaiyao" align="left">
				<div id="${20000+obj.cid}" style="display:none;">${obj.com_content}</div>
				<a class="abstraLink 
					<c:if test="${searchType=='跟进了解'}">
						<c:if test="${obj.跟进了解构成<=1.21}">orangeLink</c:if>
						<c:if test="${obj.跟进了解构成==1.5}">redLink</c:if>
					</c:if>
					<c:if test="${searchType=='参考事实'}">
						<c:if test="${obj.参考事实构成<=1.5}">orangeLink</c:if>
					</c:if>
					<c:if test="${searchType=='参考论断'}">
						<c:if test="${obj.参考论断构成<=1.5}">orangeLink</c:if>
					</c:if>
					<c:if test="${searchType=='学习背景'}">
						<c:if test="${obj.学习背景构成<=1.5}">orangeLink</c:if>
					</c:if>
					<c:if test="${searchType=='学习具体问题'}">
						<c:if test="${obj.学习具体问题构成<=1.5}">orangeLink</c:if>
					</c:if>
					<c:if test="${searchType=='学习具体如何做'}">
						<c:if test="${obj.学习具体如何做构成<=1.5}">orangeLink</c:if>
					</c:if> 
					"id="${obj.id}" href="##${obj.cid}" 
					onclick="COM(${obj.id},${obj.cid})">${obj.component}：&nbsp;
				</a>
				<div style="display:inline-block;width:80%;">
		</c:if>
		
		<%-- 重复的title --%>
		<c:if test="${id==obj.id}">
			<c:set var="abstract_last" value="${obj.abstract}"/>
			<%-- 重复的component --%>
			<c:if test="${component==obj.component}">
					<div id="${30000+obj.fid}" style="display:none;">${obj.abstract}</div>
					<c:if test="${func!=obj.func}">
						<c:set var="same_fid" value="${obj.fid}"/>
						<a 
						class=" 
							<c:if test="${searchType=='跟进了解'}">
								<%-- float不可以设置为==1.2；因为，1.2不可以完全表示成2的次方数之和，因此不可能相等 “--%>
								<%-- 因此数据库中应该修改为定点数存储“--%>
								<c:if test="${obj.跟进了解<=1.21}">orangeLink</c:if>
								<c:if test="${obj.跟进了解==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考事实'}">
								<c:if test="${obj.参考事实<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考事实==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考论断'}">
								<c:if test="${obj.参考论断<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考论断==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习背景'}">    
								<c:if test="${obj.学习背景<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习背景==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体问题'}">
								<c:if test="${obj.学习具体问题<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体问题==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体如何做'}">
								<c:if test="${obj.学习具体如何做<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体如何做==1.5}">redLink</c:if>
							</c:if> 
							"id="${obj.id}" href="##${obj.fid}" onclick="FUN(${obj.id},${obj.fid})">${obj.func}&nbsp;
						</a>
					</c:if>
					<c:if test="${func==obj.func}">
						<script>ADD(${same_fid},${obj.fid})</script>	
					</c:if>
					<c:set var="func" value="${obj.func}"/>
 			</c:if>
			<%-- 新的component --%>
			<c:if test="${component!=obj.component}">
				<c:set var="component" value="${obj.component}"/>
					</div>
				</div>
				<div class="zhaiyao" align="left">
					<div id="${20000+obj.cid}" style="display:none;">${obj.com_content}</div>
					<a class="abstraLink 
						<c:if test="${searchType=='跟进了解'}">
							<c:if test="${obj.跟进了解构成<=1.21}">orangeLink</c:if>
							<c:if test="${obj.跟进了解构成==1.5}">redLink</c:if>
						</c:if>
						<c:if test="${searchType=='参考事实'}">
							<c:if test="${obj.参考事实构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='参考论断'}">
							<c:if test="${obj.参考论断构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习背景'}">
							<c:if test="${obj.学习背景构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习具体问题'}">
							<c:if test="${obj.学习具体问题构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习具体如何做'}">
							<c:if test="${obj.学习具体如何做构成<=1.5}">orangeLink</c:if>
						</c:if> 
						"id="${obj.id}" href="##${obj.cid}" 
						onclick="COM(${obj.id},${obj.cid})">${obj.component}：&nbsp;
					</a>
					<div style="display:inline-block;width:80%;">
					<div id="${30000+obj.fid}" style="display:none;">${obj.abstract}</div>
					<c:if test="${func!=obj.func}">
						<c:set var="same_fid" value="${obj.fid}"/>
						<a style=" 
							<c:if test="${searchType=='跟进了解'}">
								<c:if test="${obj.跟进了解<=1.21}">orangeLink</c:if>
								<c:if test="${obj.跟进了解==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考事实'}">
								<c:if test="${obj.参考事实<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考事实==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考论断'}">
								<c:if test="${obj.参考论断<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考论断==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习背景'}">
								<c:if test="${obj.学习背景<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习背景==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体问题'}">
								<c:if test="${obj.学习具体问题<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体问题==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体如何做'}">
								<c:if test="${obj.学习具体如何做<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体如何做==1.5}">redLink</c:if>
							</c:if> 
							"id="${obj.id}" href="##${obj.fid}" onclick="FUN(${obj.id},${obj.fid})">
								${obj.func}&nbsp;
						</a>
					</c:if>
					<c:if test="${func==obj.func}">
						<script>ADD(${same_fid},${obj.fid})</script>	
					</c:if>
					
					<c:set var="func" value="${obj.func}"/>
			</c:if>
		</c:if>
		
		<%-- 新的title --%>
		<c:if test="${id!=obj.id}">
				</div>
			</div>
				<div class="longTextBox2" ><span id="${10000+id}">${abstract_last}</span></div>
			</div>
			<c:set var="id" value="${obj.id}"/>
			<div class="the_result">
				<%-- 标题 --%>
<%--
				<div class="titletitle">
					<a id="${obj.id}" href="javascript:void(0)" onclick="ABS(${obj.id},'${obj.content}')">[${obj.resourceType}]${obj.title}[${obj.weight}]</a>
				</div>
--%>
				<div class="titletitle">
						<a id="${obj.id}" href="/content/con?id=${obj.id}">[${obj.resourceType}]${obj.title}[${obj.weight}]</a>
				</div>
				<c:set var="component" value="${obj.component}"/>
				<div class="zhaiyao" align="left">
					<div id="${20000+obj.cid}" style="display:none;">${obj.com_content}</div>
					<a class="abstraLink  
						<c:if test="${searchType=='跟进了解'}">
							<c:if test="${obj.跟进了解构成<=1.21}">orangeLink</c:if>
							<c:if test="${obj.跟进了解构成==1.5}">redLink</c:if>
						</c:if>
						<c:if test="${searchType=='参考事实'}">
							<c:if test="${obj.参考事实构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='参考论断'}">
							<c:if test="${obj.参考论断构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习背景'}">
							<c:if test="${obj.学习背景构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习具体问题'}">
							<c:if test="${obj.学习具体问题构成<=1.5}">orangeLink</c:if>
						</c:if>
						<c:if test="${searchType=='学习具体如何做'}">
							<c:if test="${obj.学习具体如何做构成<=1.5}">orangeLink</c:if>
						</c:if> 
						"id="${obj.id}" href="##${obj.cid}" 
						onclick="COM(${obj.id},${obj.cid})">${obj.component}：&nbsp;
					</a>
					<div style="display:inline-block;width:80%;">
					<div id="${30000+obj.fid}" style="display:none;">${obj.abstract}</div>
					<c:if test="${func!=obj.func}">
						<c:set var="same_fid" value="${obj.fid}"/>
						<a style=" 
							<c:if test="${searchType=='跟进了解'}">
								<c:if test="${obj.跟进了解<=1.21}">orangeLink</c:if>
								<c:if test="${obj.跟进了解==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考事实'}">
								<c:if test="${obj.参考事实<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考事实==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='参考论断'}">
								<c:if test="${obj.参考论断<=1.5}">orangeLink</c:if>
								<c:if test="${obj.参考论断==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习背景'}">
								<c:if test="${obj.学习背景<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习背景==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体问题'}">
								<c:if test="${obj.学习具体问题<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体问题==1.5}">redLink</c:if>
							</c:if>
							<c:if test="${searchType=='学习具体如何做'}">
								<c:if test="${obj.学习具体如何做<=1.5}">orangeLink</c:if>
								<c:if test="${obj.学习具体如何做==1.5}">redLink</c:if>
							</c:if> 
							"id="${obj.id}" href="##${obj.fid}" onclick="FUN(${obj.id},${obj.fid})">
								${obj.func}&nbsp;
							<c:set var="func" value="${obj.func}"/>
							<c:set var="same_fid" value="${obj.fid}"/>	
						</a>
					</c:if>
					<c:if test="${func==obj.func}">
						<script>ADD(${same_fid},${obj.fid})</script>	
					</c:if>
					<c:set var="func" value="${obj.func}"/>
		</c:if>
		<--% 最后一个元素 --%>
		<c:if test="${status.last}">
							</div>
			</div>
				<div class="longTextBox2" ><span id="${10000+id}">${abstract_last}</span></div>
			</div>
		</c:if>
	</c:forEach>
	
	
	
<%--	
<p>总共: ${objectlist.totalRow}条</p>
<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/small/sentence/?searchWord=${(searchWord)}&searchType=${(searchType)}&page=" />
<c:set var="urlParas" value="" />
--%>

<%@ include file="/common/_paginate.jsp"%>
</body>
</html>