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
	<c:set var="start_flag" value="1"/>
	<c:forEach items="${objectlist.list}" var="obj">
		<c:if test="${start_flag==1}">
			<c:set var="id" value="${obj.id}"/>
			<div class="the_result">
					<!-- 标题 -->
					<div class="titletitle">
						<a data-is-main-url="true" target="_blank" href="index.html">
							[${obj.resourceType}]${obj.title}
						</a>
					</div>
			<c:set var="start_flag" value="0"/>
		</c:if>
		<c:if test="${id==obj.id}">
			<div class="zhaiyao" align="left">
				<span style="color:#164988;font-weight:bold;float:left;width:40px;'">${obj.component}：</span>
				<div class="longTextBox" contenteditable="true">${obj.abstract}</div>
			</div>			
		</c:if>
		<c:if test="${id!=obj.id}">
			<c:set var="id" value="${obj.id}"/>
			</div>
			<div class="the_result">
				<!-- 标题 -->
				<div class="titletitle">
					<a data-is-main-url="true" target="_blank" href="index.html">
						[${obj.resourceType}]${obj.title}
					</a>
				</div>
		</c:if>
	</c:forEach>

<span id="total">共计: ${objectlist.totalRow}条结果</span>

<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/small/inf/?searchWord=${(searchWord)}&searchType=${(searchType)}&page=" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>

</body>
</html>