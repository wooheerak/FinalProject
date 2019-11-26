<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Site Meta -->
<title>StudyHub.lib</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="resources/images/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="resources/images/apple-touch-icon.png">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,600,700"
	rel="stylesheet">

<!-- Custom & Default Styles -->
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/carousel.css">
<link rel="stylesheet" href="resources/style.css">

<style>
#rsInfo{
		text-align:center;
		padding:3px;
		margin:auto;
}
.btn {
/* 	background-color:white; */
	background-color:white;
	text-align:center;
	width:80px;
	height: 30px;
	border-color:rgba(0,82,156,0.7) !important;
	color:rgba(0,82,156,0.7) !important;
	 
}
.btn-transparent{
	padding : 0px;
	border-color:rgba(0,82,156,0.7) !important;
	color:rgba(0,82,156,0.7) !important;
}
</style>
</head>
<body>
	<div id="rsInfo">
		<h2 style="margin-top:100px"><b>예약이 완료 되었습니다</b></h2>
	<br>
	
	<c:url var="bComplete" value="bComplete.bo">
		<c:param name="bo_number" value="${ sr.bo_number }"/>
		<c:param name="so_start_time" value="${sr.so_start_time}"/>
		<c:param name="so_end_time" value="${sr.so_end_time}"/>
		<c:param name="so_date" value="${sr.so_date}"/>
		<c:param name="so_name" value="${sr.so_name}"/>
	</c:url>
	<c:if test="${sr.bo_number != 0 }">
		<input type="button" class="btn btn-transparent" id="close" onclick="location.href='${ bComplete }'" value="확인" />
	</c:if>
	<c:if test="${sr.bo_number == 0 }">
		<input type="button" class="btn btn-transparent" id="close" onclick="wclose()" value="확인" />
	</c:if>
	</div>
	
<script>
function wclose(){
	opener.parent.location.reload();
	self.close();
}
</script>
</body>
</html>