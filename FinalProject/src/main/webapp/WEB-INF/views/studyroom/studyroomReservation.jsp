<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 예약</title>

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

.btn {
/* 	background-color:white; */
	background-color:white;
	text-align:center;
	width:80px;
	height: 30px;
	 
}
.btn-transparent{
	padding : 0px;
}

.btnbox{
	text-align:center;
}

.studyroomReservation{
	magin-left:auto;
	magin-right:auto;
	text-align:center;
}

</style>
</head>
<body>
	<div>
		<div>
			<div >
				<h3>스터디룸 예약</h3>
			</div>
			<br>
			<form>
				<div class="studyroomReservation">
					<table>
						<tr>
							<td><b>선택한 방</b></td>
							<td><input type="text" /></td>
							<td></td>
						</tr>
						<tr>
							<td><b>예약자 정보(학번)</b></td>
							<td><input type="text" /></td>
							<td></td>
						</tr>
						<tr>
							<td><b>참여자</b></td>
							<td><input type="text"></td> 
							<td><button class="btn btn-transparent" style="width:25px; height:25px;">+</button></td>
						</tr>
						<tr>
							<td><b>예약 시작시간</b></td>
							<td><input type="text" id="startTime" /></td>
							<td></td>
						</tr>
						<tr>
							<td><b>예약 종료 시간</b></td>
							<td><input type="text" /></td>
							<td></td>
						</tr>
					</table>
				</div>
				<br>
				<div class="btnbox">
					<input class="btn btn-transparent" style="padding:0px"  type="submit" value="예약"/>
					<input class="btn btn-transparent" style="padding:0px"  type="button" onclick="window.close()" value="취소"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>