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
input{
	width:100%;
}

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
			<form action="reservation()">
				<div class="studyroomReservation">
					<table>
						<tr>
							<td colspan="2"><b>층</b></td>
							<td colspan="5">
								<select id="studyroomFloor" onchange="studyroomNameChange(this)">
									<option selected="selected" value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
								</select>							
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>스터디룸 이름</b></td>
							<td colspan="5">
								<select id="studyroom">
									<option></option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약자 정보(학번)</b></td>
							<td colspan="5"><input type="text" /></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>참여자</b></td>
							<td colspan="5"><input type="text"></td> 
							<td><button class="btn btn-transparent" style="width:25px; height:25px;">+</button></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="5"><input type="text"></td> 
							<td><button class="btn btn-transparent" style="width:25px; height:25px;">+</button></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약 시간</b></td>
							<td colspan="2">
								<select id="startTime" onchange="endTimeChange(this)">
									<c:forEach var="i" begin="9" end="20">
										<c:if test="${i<10}">
											<option value="${i}">0${i}:00</option>				
										</c:if>
										<c:if test="${i>=10}">
											<option value="${i}">${i}:00</option>				
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td>~</td>
							<td colspan="2">
								<select id="endTime">
								</select>
							</td>
							<td></td>
						</tr>
					</table>
				</div>
				<br>
				<div class="btnbox">
					<!-- 예약 완료시 이 창은 꺼지고 부모창 refresh -->
					<input class="btn btn-transparent" style="padding:0px"  type="submit" value="예약"/>
					<input class="btn btn-transparent" style="padding:0px"  type="button" onclick="window.close()" value="취소"/>
				</div>
			</form>
		</div>
	</div>
	
<script>
function reservation(){
	InsertStudyroom.sr
}

function studyroomNameChange(e){
	var target = document.getElementById("studyroom");
	
}

function endTimeChange(e){
	var target = document.getElementById("endTime");
	console.log(e.value);
	if(e.value<20){
		for(var i=0;i<2;i++){			
			var opt = document.createElement("option");
		    opt.value = (e.value+i);
		    opt.innerHTML = (e.value+i);
		    if(i=0) opt.selected=true;
		    target.appendChild(opt);
		}
	}else{
		var opt = document.createElement("option");
	    opt.value = (e.value+i);
	    opt.innerHTML = (e.value+i);
	    target.appendChild(opt);
	}
	
}

</script>
</body>
</html>