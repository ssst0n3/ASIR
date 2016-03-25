<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>SYSU - 深度聚合学术搜索网站</title>
<link href="/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/SearchResult.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/SearchPage.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/item-content-page.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/paginate.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>
<link href="/ui/css/chartStyle.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/d3.js" type="text/javascript"></script>
<script src="/ui/js/d3.min.js" type="text/javascript"></script>
</head>

<body>
<form action="${contextPath}/asir/clusterSearchResult" method="post" >
<div class="top">
	<div class="top_top">
		<ul>
        	<li><a href="#">联系我们</a></li>
            <li><a href="#" onClick="AddFavorite(window.location,document.title)">加入收藏</a></li>
        	<li><a href="#" onClick="SetHome(window.location)">设为首页</a></li>
        </ul>
    </div>
</div>	<!--top end-->


<div class="item_content">
<!-- 	
	<div style="right:2%; position:absolute; top:10px;">
			<button class="button button--style02"  onclick="javascrtpt:window.location.href='/asir/basicSearchResult'">返回</button>
	</div>
-->
	<div class="item_content_title">
		${obj.标题}
	</div>
	<div class="item_content_keywords">
		作者： <span>${obj.作者}</span>
	<br><br>
		关键词： <span>${obj.篇关键词}</span>
	</div>
	<div class="item_content_abstract" id="content_none" style="display:none">${obj.存放路径}</div>
	<div class="item_content_abstract" id="content_display" style="text-align:left"></div>
	<script>
	 	str1 = document.getElementById("content_none").innerHTML;
	 	str2 = str1.replace(new RegExp("  ",'gm'),"&nbsp;")
	 			   .replace(new RegExp("<",'gm'),"&lt;")
	 			   .replace(new RegExp(">",'gm'),"&gt;")
	 			   .replace(new RegExp("\n",'gm'),"<br><br>");
	 	console.log(str2);
	 	document.getElementById("content_display").innerHTML = str2;
	</script>
</div>

		
</body>
</html>
