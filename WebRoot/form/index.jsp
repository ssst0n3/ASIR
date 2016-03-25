<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>
</head>
<body>
<p><a href="${contextPath}/form/add">添加数据</a></p>
<table>
	<tr>
		<td>标题</td>
		<td>作者</td>
		<td>资源类型</td>
		<td>来源</td>
		<td>关键词</td>
	</tr>
	
	<c:forEach items="${objectlist.list}" var="obj">
		<tr>
			<td>${obj.title}</td>
			<td>${obj.author}</td>
			<td>${obj.resourceType}</td>
			<td>${obj.source}</td>
			<td>${obj.keyword}</td>
			<td>
				<a href="${contextPath}/form/queryById/${obj.id}">编辑</a>
				<a href="${contextPath}/form/deleteById/${obj.id}">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
<p>总共: ${objectlist.totalRow}条</p>
<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/form/" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>
</body>
</html>