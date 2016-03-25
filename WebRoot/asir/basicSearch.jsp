<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>SYSU - 深度聚合学术搜索网站</title>
<link href="/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/Button.css" rel="stylesheet" type="text/css" />
<link href="/ui/css/SearchPage.css" rel="stylesheet" type="text/css" />
<script src="/ui/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/ui/js/setHomeSetFav.js" type="text/javascript" charset="gb2312"></script>

</head>

<body>

	<div class="top">
		<div class="top_top" >
		<p id="txt" style="float:left"></p>
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
	        
	    </div>	<!--wrap end-->    
	</div>	<!--top end-->


	<div id="BackGround">
		<div id="SearchBox">
			<div id="SelectWay" style="margin-left:12%;">
					<button class="button button--style01" style="font-size:25px;" >基本检索</button>
			</div>
			<div id="SelectWay" style="margin-left:6%;">
					<button class="button button--style01" style="font-size:25px;" onClick="javascrtpt:window.location.href='/asir/advancedSearch'">高级检索</button>
			</div>
			
			<div id="InputBox">
				<form action="${contextPath}/asir/basicSearchResult" method="post">
				<div id="textframe">
					<input name="searchWord"  type="text" class="TextBox" />
					<input type="submit" value="基本检索" class="SearchButton" style="left:12%"  onClick="search();" />
				</div>
				</form>
			</div>
		</div>
	</div>
			
<!-- 
				<input name="searchWord"  type="text" class="TextBox1"/>
				<input style="margin-left:95%;margin-top:-5.5%;" type="submit" value="基本检索" class="SearchButton" onClick="search();" />
-->


			
			
			
			
			<!-- <form action="submit" method="get" class="search_radio">
				<input type="radio" name="sex" 
					value="male" /> Aggregate in Results&nbsp;&nbsp;
				<input type="radio" name="sex" 
					value="female" /> Re-Aggregate
			</form> -->
		
		




		
		
		
		
		
		
		
		
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
