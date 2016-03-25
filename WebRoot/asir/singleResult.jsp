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
    <div class="wrap">
        <a href="/" class="logo">
            <img src="/ui/images/logo.png" alt="ASIR"/>
        </a>	<!--logo end-->
		
		<div class="TopSearch">	
				<div id="textframe" style="top:10px; height:110px;">
					<input name="searchWord" type="text" value="${searchWord}" class="TextBox" style="width:50%;" />
	                 <div style="position:relative; left:5%; bottom:0;">
	                 	<input type="submit" value="检索" class="SearchButton" onClick="search();" />
	                 </div>
	                <div style="position:absolute; float:left; left:5%; top:70%;">
		                <input type="radio" name="sex" value="male" /> 在结果中查找&nbsp;&nbsp;
		                <input type="radio" name="sex"  value="female" /> 普通查找
		            </div>
	            </div>
        </div>
    </div>	<!--wrap end-->    
</div>	<!--top end-->


<div class="item_content">
	<div style="right:2%; position:absolute; top:10px;">
			<button class="button button--style02"  onclick="javascrtpt:window.location.href='/asir/basicSearchResult'">返回</button>
	</div>
	<div class="item_content_title">
	Oil Spills and Community Resilience: Uneven Impacts and Protection in Historical Perspective
	</div>

	<div class="item_content_author">
	作者:Colten, CE (Colten, Craig E.)[ 1 ] ; Grimsmore, AA (Grimsmore, Audrey A.)[ 1 ] ; Simms, JRZ (Simms, Jessica R. Z.)[ 1 ]
	</div>


	<div class="item_content_public">
		GEOGRAPHICAL REVIEW <br>
		卷: 105  期: 4  页: 391-407 <br>
		DOI: 10.1111/j.1931-0846.2015.12085.x <br>
		出版年: OCT 2015 <br>
		查看期刊信息 <br>
	</div>

	<div class="item_content_abstract">
	摘要：<br>
	Louisiana's coastal residents have endured centuries of hurricanes and decades of oil spills. Locally based, inherent resilient practices have enabled them to persist in place. This paper documents the evolution of actions taken by Louisiana's coastal residents that constitute effective resilient activities in the aftermath of disruptive events. It compares the efforts that arose from coastal communities that were rooted in local environmental knowledge with generic external programs designed to enable hazard mitigation, emergency response, and recovery form damaging hurricanes and oil spills. Additionally, it will identify points of opportunity to fortify resilience by integrating inherent and formal resilience.
	</div>

	<div class="item_content_keywords">
	作者关键词：
	<span>hazards;</span>  <span>resilience;</span> <span>Louisiana;</span> <span>oil spills</span>
	<br><br>KeyWords Plus：
	<span>COASTAL LOUISIANA;</span> <span>CLIMATE-CHANGE;</span> <span>DISASTER; ATTACHMENT</span>
	</div>

</div>
		
		
<div class="help_nav">

</div>




	

		
</body>
</html>
