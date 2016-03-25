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
				<div class="search_result_item">
					<div id="checkbox">
						<input name="mediaType" type="checkbox" value="" />
					</div>
					<!-- 标题 -->
					<div id="title">
						<a target="_blank" href="/content/con?id=${obj.id}">
							<span>${obj.title}<span>
						</a>
					</div>
					<br>
					
					<!-- 摘要 -->
					<div id="abstract">
						<font>&nbsp;${obj.abstract}</font>
					</div>
					<!-- 其他信息 -->
					<div id="otherinfo">
							<a title="作者" target="_blank" href="index.html">${obj.author}</a>&nbsp;</li>
							<a title="资源类型" target="_blank" href="index.html">${obj.resourceType}</a>&nbsp;</li>
							<a title="来源" target="_blank" href="index.html">${obj.source}</a>&nbsp;</li>
							<a title="关键词" target="_blank" href="index.html">${obj.keyword}</a>&nbsp;</li>
					</div>
				</div>
			
		</c:forEach>


<span id="total">共计: ${objectlist.totalRow}条结果</span>

<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/asir/basicSearchResult/?searchWord=${(searchWord)}&page=" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>
</body>
</html>