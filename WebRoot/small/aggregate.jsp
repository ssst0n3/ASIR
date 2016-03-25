<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>
</head>
<body>
		<c:forEach items="${objectlist.list}" var="obj">
			
			<div class="the_result">
			
				<!-- 标题 -->
				<div class="titletitle">
						<a data-is-main-url="true" target="_blank" href="/content/con?id=${obj.资源ID}">
							[${obj.资源类型}]
							${obj.标题}
							
						</a>

				</div>
				
				<div class="zhaiyao" align="left">
						<span style="color:#164988;font-weight:bold;width:40px;'">
						</span>
						<c:if test="${fn:length(obj.摘要)>0}">${obj.摘要}</c:if>
						<c:if test="${fn:length(obj.摘要)<1}">
								<c:if test="${fn:length(obj.存放路径)<=270}">
										${obj.存放路径}
								</c:if>
								<c:if test="${fn:length(obj.存放路径)>270}">
						 				${fn:substring(obj.存放路径, 0, 270)}
								</c:if>
						</c:if>
						......
				</div>
				
				<!-- 其他信息 -->
				<div class="op" align="left" >
					<span style="display:inline-block; width:230px;"><span style="color:#164988; font-weight:bold;">作者：</span>${obj.作者}</span>  
					<span style="display:inline-block; width:160px;"><span style="color:#164988; font-weight:bold;">更新时间：</span>${obj.更新时间}</span> 
					<span style="color:#164988; font-weight:bold;">来源：</span>${obj.来源}
				</div>

<%-- 				
				<div class="op" align="left" >
					<a title="作者" target="_blank" href="index.html">${obj.作者}</span>
					<a title="更新时间" target="_blank" href="index.html">${obj.更新时间}</a>
					<a title="来源" target="_blank" href="index.html">${obj.来源}</a>
				</div>
 --%>			
			</div>

			
		</c:forEach>

<p>总共: ${objectlist.totalRow}条</p>

<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/small/chapter/?searchWord=${(searchWord)}&page=" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>


</body>
</html>