<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/SearchResult.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>
<link href="/ui/css/chartStyle.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/d3.js" type="text/javascript"></script>
<script src="/ui/js/d3.min.js" type="text/javascript"></script>
<link href="/ui/css/resultLook.css" rel="stylesheet" type="text/css" />
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
	</div>
	<div class="wrap">
        <a href="/" class="logo">
            <img src="/ui/images/logo.png" alt="ASIR"/>
        </a>	<!--logo end-->
        
        <div>
			<button class="button button--tag" onclick="javascrtpt:window.location.href='/small/chapter'">篇章单元检索</button>
			<button class="button button--tag" onclick="javascrtpt:window.location.href='/small/inf'">信息单元检索</button>
	        <button class="button button--tag" onclick="javascrtpt:window.location.href='/small/sentence'">句群单元检索</button>
    	</div>
    	
    	
    </div>	<!--wrap end--> 


</body>
</html>