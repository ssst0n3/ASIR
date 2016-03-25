<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>SYSU - 深度聚合学术搜索网站</title>
<link href="/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/SearchFunction.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/Main_Page_Search.js" type="text/javascript"></script>
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>
<script src="/ui/js/d3.js" type="text/javascript"></script>
 
</head> 


<body>
    <div class="top_top" >
    	<p id="txt" style="float:left"></p>
        <ul>
            <li><a href="#">联系我们</a></li>
            <li><a href="#" onClick="AddFavorite(window.location,document.title)">加入收藏</a></li>
            <li><a href="#" onClick="SetHome(window.location)">设为首页</a></li>
        </ul>
    </div>
    
    <div class = "div-bubble">
	        <script src="/ui/js/collision_detection_canvas.js" type="text/javascript"></script>
	    
    	<div id = "logo">
		    <canvas id="canvas" style="height:100%">
		        当前浏览器不支持Canvas，请更换浏览器后再试
		    </canvas>
		    <script src="/ui/js/drawLogo.js" type="text/javascript"></script>
		</div>
		
		<div class = "div-logo" onclick="javascrtpt:window.location.href='/basicSearch'">
	        <br><p>  欢迎来到中山大学<br>资讯管理学院学术搜索系统！</p><br>
	        <p style="font-size:15px;">Sysu Scholar by School of Information Management</p>
	    </div>
		
		<div class = "selectZone">
				<div class="select" style="float:left;">
						<button class="button button--style01"  onClick="javascrtpt:window.location.href='/asir/basicSearch'">普通检索</button>
				</div>
				<div class="select"style="float:right;">
						<button class="button button--style01"  onClick="javascrtpt:window.location.href='/small/sentence'">细粒度检索</button>
				</div>
		</div>
    

    </div>
    
    
        
        
    <div style="position:absolute;left:25%;top:90%;width:50%;">
	    <TABLE cellSpacing=6 cellPadding=0 width=100% border=0 class=border>
	      	<TBODY>
		      	<TR><TD><TABLE cellSpacing=12 cellPadding=0 width="100%" border=0 class=footer>
			    	<TBODY>
			    		<TR>
			        		<TD align="center"><font color=white>Copyright © 2011 中山大学资讯管理学院. All Rights Reserved.</font></TD>
			       		</TR>
			            <TR>
			             	<TD><a href=http://im.sysu.edu.cn/ target=_blank><b><font color=white>中山大学资讯管理学院</font></b></a><br>
			               		<font color=white>
			                                                            广州市广州大学城外环东路132号
						                           电话：39332658
						                           传真：39332658
						                           邮件：imim@mail.sysu.edu.cn 
			               		</font>
			        		</TD>
				    </TR></TBODY>
				</TABLE></TD></TR>
		    </TBODY>
	    </TABLE>
    </div>    
        
        
</body>
</html>

<!-- 20150921 by devil 直接去掉了首页的点击进入按钮  -->