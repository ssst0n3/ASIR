<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>SYSU - 深度聚合学术搜索网站</title>
<!-- ui css -->
<link href="/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/small.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/resultLook.css" rel="stylesheet" type="text/css" />
<!-- 外部css -->
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/paginate.css" rel="stylesheet" type="text/css" />
<!-- js -->
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>
<script src="/ui/js/d3.js" type="text/javascript"></script>
<script src="/ui/js/d3.min.js" type="text/javascript"></script>

</head>

<body>
<form name="form1" action="" method="post" >
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
			<div class="small_tag">
 				<a class="button button--select" href="${contextPath}/small/chapter">普通检索</a>
		        <a class="button button--tag" onClick="form1.action='${contextPath}/small/sentence'; form1.submit();">聚合单元检索</a>
			</div>
			
			<div id="InputBox">
					<div id="textframe">
						<input autofocus="autofocus"  value="${searchWord}" name="searchWord"  type="text" class="TextBox" />
						<select style="display:none;" id="th" class="dropdown" name="searchType">
							<option value="跟进了解" <c:if test="${searchType == '跟进了解'}">selected</c:if> >跟进了解</option>
							<option value="参考事实" <c:if test="${searchType == '参考事实'}">selected</c:if> >参考事实</option>
							<option value="参考论断" <c:if test="${searchType == '参考论断'}">selected</c:if> >参考论断</option>
							<option value="学习背景" <c:if test="${searchType == '学习背景'}">selected</c:if> >学习背景</option>
							<option value="学习具体问题" <c:if test="${searchType == '学习具体问题'}">selected</c:if> >学习具体问题</option>
							<option value="学习具体如何做" <c:if test="${searchType == '学习具体如何做'}">selected</c:if> >学习具体如何做</option>
						</select>
						<input type="submit" value="检索" class="SearchButton" style="left:5%"  
							onClick="form1.action='${contextPath}/small/chapter'; form1.submit();" />
					</div>
			</div>
	    </div>	<!--wrap end--> 
	</div> <!-- top end -->
	
	<div class="small_main">
		<div class="small_main_left">
	        <div class="small_main_nav">
	            <div class="small_title">
	                <h2 class="small_title_left">Media Type</h2>	
	            </div>
	            <div  class="small_content">
									<input name="mediaType" type="checkbox" value="all" checked="checked"/>&nbsp;所有<br>
									<input name="mediaType" type="checkbox" value="百科" />&nbsp;百度百科<br>
									<input name="mediaType" type="checkbox" value="博客" />&nbsp;博客<br>
									<input name="mediaType" type="checkbox" value="OA论文" />&nbsp;OA论文<br>
									<input name="mediaType" type="checkbox" value="题录" />&nbsp;题录<br>
									<input style="float:right; margin-right:7%;  margin-top:1%;width:75px;height:25px;" type="submit" value="确定" class="SearchButton" 
										onClick="form1.action='${contextPath}/small/chapter'; form1.submit();" />
	            </div>
	        </div><!--small_main_nav end--> 
	
	    </div><!--small_main_left end-->
	    
	    <div class="small_main_result">
			<%@ include file="aggregate.jsp"%>
	    </div><!--small_main_result-->
	</div><!--small_main end-->
</form>
</body>
</html>