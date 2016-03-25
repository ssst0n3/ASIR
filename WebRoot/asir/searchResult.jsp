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
<div class="main">
	<div class="main_left">
        <div class="main_nav">
            <div class="title">
                <h2 class="title_left">细粒度大小</h2>
            </div>
            <div class="content">
                    <input type="checkbox" value="" />&nbsp;全部 <br>
                    <input type="checkbox" 
                        value="" />&nbsp;知识单元 <br>
                    <input type="checkbox" value="" />&nbsp;段落<br>
                    <input type="checkbox" value="" />&nbsp;篇章<br>
                    <input type="checkbox" value="" />&nbsp;论文<br>
                    <input style="float:right; margin-right:7%;  margin-top:1%;width:75px;height:25px;" type="submit" value="确定" class="SearchButton" onClick="search();" />
            </div>
        </div><!--main_nav end--> 

    </div><!--main_left end-->
    
    <div class="main_middle">
    
   		 <div class="keywords" id="pie">
    		<div style="position:absolute; right:5%; top:5px;">
    			<label class="button button--style02"onclick="javascrtpt:window.location.href='/asir/visual'" >可视化分析</label>
            <script src="/ui/js/PieChart.js" type="text/javascript"></script>
        	</div>
        </div> <!--keywords end-->
        
    	<div class="results">

<!--         	<div class="a_result"><p>结果如下</p>
            </div> -->
<!--  20150924 by shouz 删除了[结果如下]框因为觉得好像没啥用。。  -->
            
            <div class="search_result" >
					<%@ include file="aggregate.jsp"%>
            </div><!--search_result--> 
        </div> <!--results end-->
        
    </div><!--main_middle-->
	<div class="main_right">
        <div class="main_nav">
            <div class="title">
                <h2 class="title_left">Media Type</h2>	
            </div>
            <div  class="content">
				<input name="mediaType" type="checkbox" value="all" checked="checked"/>&nbsp;所有<br>
				<input name="mediaType" type="checkbox" value="百科" />&nbsp;百度百科<br>
				<input name="mediaType" type="checkbox" value="博客" />&nbsp;博客<br>
				<input name="mediaType" type="checkbox" value="精品课程" />&nbsp;精品课程<br>
				<input name="mediaType" type="checkbox" value="中图学会" />&nbsp;中国图书馆学会<br>
				<input name="mediaType" type="checkbox" value="现代图书情报技术" />&nbsp;现代图书情报技术<br>
				<input style="float:right; margin-right:7%;  margin-top:1%;width:75px;height:25px;" type="submit" value="确定" class="SearchButton" onClick="search();" />
            </div>
        </div><!--main_nav end--> 
    </div><!--main_right end-->
</div><!--main end-->
	
</form>	
</body>
</html>

<!-- 20150921 by devil删除了聚类的title_right -->