<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<script  type="text/javascript">
	function ABS(id1) {
		document.getElementById(id1+10000).innerHTML = document.getElementById("div1").innerHTML;
		/* document.getElementById(id1+10000).value = abs; */
	}
</script>

</head>
<body>   
        <a style="color:#164988;" id="1" href="javascript:void(0)" onclick="ABS(1)">1：&nbsp;</a>
        <span id="10001" >aaa</span>
        <div id="div1" style="display:none">数据</div>
        
</body>
</html>