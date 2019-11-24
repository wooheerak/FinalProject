<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 완료</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Site Meta -->
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
</style>
</head>
<body>
	<div id="rsInfo">
		<h3 style="margin-top:100px"><b>예약 정보를 확인하세요</b></h3>
	<br>
		<h3>${info}</h3>
	<br>
		<h4>게시판에서도 확인할 수 있습니다</h4>
	<input type="button" class="btn" id="close" value="확인" />
	</div>
	
<script>
$("#close").on("click" , function(){
	opener.document.location.reload();
	self.close();
});
</script>
</body>
</html>