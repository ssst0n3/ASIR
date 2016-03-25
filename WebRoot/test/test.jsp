<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataList</title>

<script  type="text/javascript">
	function fun(){
		var s = document.getElementById(1).innerHTML;
		document.getElementById(2).innerHTML = s;
	}
	
	function ADD(fid1,fid2){
		document.getElementById(fid1).innerHTML += document.getElementById(fid2).innerHTML;
	}
</script>

</head>
<body>
	<div id="1"></div>
	<div id="2"></div>
	<script>ADD(1,2)</script>
</body>
</html>