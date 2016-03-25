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
<table  style="BORDER-COLLAPSE: collapse" borderColor=#000000 height=40 cellPadding=1 width=100% align=center border=1>
	<tr>
		<td>标题</td>
		<td>作者</td>
		<td>资源类型</td>
		<td>来源</td>
		<td>关键词</td>
	</tr>
	
	<c:forEach items="${objectlist.list}" var="obj">
		<tr>
			<td align="left">${obj.title}</td>
			<td align="left">${obj.author}</td>
			<td align="left">${obj.resourceType}</td>
			<td align="left">${obj.source}</td>
			<td align="left">${obj.keyWord}</td>
		</tr>
	</c:forEach>
</table>
<p>总共: ${objectlist.totalRow}条</p>
<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/asir/" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>
</body>
</html>