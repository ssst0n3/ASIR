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
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>




<link href="/ui/css/chartStyle.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/d3.js" type="text/javascript"></script>
<script src="/ui/js/d3.min.js" type="text/javascript"></script>

</head>

<body>
<div class="top">
	<div class="top_top">
		<ul>
        	<li><a href="#">联系我们</a></li>
            <li><a href="#" onClick="AddFavorite(window.location,document.title)">加入收藏</a></li>
        	<li><a href="#" onClick="SetHome(window.location)">设为首页</a></li>
        </ul>
    </div>
    <div class="wrap">
        <div class="logo">
            <img src="/ui/images/logo.png" alt="ASIR" onclick="javascrtpt:window.location.href='/basicSearch'"/>
        </div>	<!--logo end-->
    </div>	<!--wrap end-->    
</div>	<!--top end-->


<div class="main">
	<div class="main_left">
        <div class="main_nav">
            <div class="title">
                <h2 class="title_left">Granularity</h2>
                <span class="title_right">
                    <a href="#">Cancel</a>
                </span>
            </div>
            <div class="content">
                <form action="" method="get" class="checkbox">
                    <input type="checkbox" value="" />&nbsp;ALL <br>
                    <input type="checkbox" 
                        value="" />&nbsp;Knowledge Unit <br>
                    <input type="checkbox" value="" />&nbsp;Paragraph<br>
                    <input type="checkbox" value="" />&nbsp;Chapter<br>
                    <input type="checkbox" value="" />&nbsp;Paper
                </form> 
            </div>
        </div><!--main_nav end--> 
        <div class="main_nav">
            <div class="title">
                <h2 class="title_left">Content</h2>
                <span class="title_right">
                    <a href="#">Cancel</a>
                </span>
            </div>
            <div class="content">
                <form action="" method="get" class="checkbox">
                    <input type="checkbox" value="" />&nbsp;ALL <br>
                    <input type="checkbox" 
                        value="" />&nbsp;Define<br>
                    <input type="checkbox" value="" />&nbsp;Chart<br>
                    <input type="checkbox" value="" />&nbsp;Method<br>
                    <input type="checkbox" value="" />&nbsp;Problem<br>
                    <input type="checkbox" value="" />&nbsp;Deficiency<br>
                    <input type="checkbox" value="" />&nbsp;Summary<br>
                    <input type="checkbox" value="" />&nbsp;Opinion<br>
                </form> 
            </div>
        </div><!--main_nav end--> 
    </div><!--main_left end-->
    
    
		<div class = "visual">
			<div style="right:10%; position:absolute; top:10px;">
			<button class="button button--style02"  onclick="javascrtpt:window.location.href='/asir/basicSearchResult'">返回检索结果</button>
			</div>

 			<div class = "chart" id="canvaslinear">
				<p>时间-数目分布图</p>
				<script src="/ui/js/canvas_bar_chart.js" type="text/javascript"></script>
			</div> 

	 
			<div class = "chart" id="multilinear">
				<p>时间-数目对比分析分布图</p>
				<script src="/ui/js/linear.js" type="text/javascript"></script>
			</div>

		
			<div class = "chart" id="starchart">
				<p>力矩图</p>
				<script src="/ui/js/starchart.js" type="text/javascript"></script>
			</div>
			
			
			<div class = "chart" id="barchart">
				<p>柱状图</p>
					<div id="tooltip" class="hidden">
						<p><span id="time"></span></p>
						<p><span id="value"></span></p>
					</div>
				<script src="/ui/js/barchart.js" type="text/javascript"></script>
			</div>
		
		
		
		
		</div>


</div>


</body>
</html>