<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>
</head>
<body>




<table style="BORDER-COLLAPSE: collapse" borderColor=#fff height=40 cellPadding=1 width=100% align=center border=1>
		<c:forEach items="${objectlist.list}" var="obj">
<%-- 
			<tr>
				<td align="left">${obj.title}</td>
				<td align="left">${obj.author}</td>
				<td align="left">${obj.resourceType}</td>
				<td align="left">${obj.source}</td>
				<td align="left">${obj.keyWord}</td>
			</tr>
 --%>
			<tr>
			    <td align="left">
					<div data-click="{"fm":"pp","p1":"3004","p5":"3004""rsv_srcid:49509"}">
						<h3>
							<a data-is-main-url="true" target="_blank" href="index.html">
								<font color="#7EC0EE">${obj.标题}</font>
							</a>
						</h3>
						<div >
							<span>&nbsp;${obj.摘要}</span>
							<div >
								<a title="作者" target="_blank" href="index.html">${obj.作者}</span>
								<a title="资源类型" target="_blank" href="index.html">${obj.资源类型}</a>
								<a title="来源" target="_blank" href="index.html">${obj.来源}</a>
								<a title="关键词" target="_blank" href="index.html">${obj.关键词}</a>
							</div>
						</div>
					</div>
				</td>
			</tr>

			
		</c:forEach>
</table>
<p>总共: ${objectlist.totalRow}条</p>

<c:set var="currentPage" value="${objectlist.pageNumber}" />
<c:set var="totalPage" value="${objectlist.totalPage}" />
<c:set var="actionUrl" value="/asir/basicSearchResult/?searchWord=${(searchWord)}&page=" />
<c:set var="urlParas" value="" />
<%@ include file="/common/_paginate.jsp"%>
</body>
</html>