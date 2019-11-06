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


#reservationTable{
	margin: auto;
}

#reservationTable td{
	padding: 5px;
}


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

	text-align:center;
}

#studyroomReservation_title {
	margin-left:15px;
}

</style>
</head>
<body>
	<div>
		<div>
			<div id="studyroomReservation_title">
				<h3>스터디룸 예약</h3>
			</div>
			<br>
			<form action="reservation()">
 				
					<table class="text-center" id="reservationTable">
						<tr>
							<td colspan="2"><b>층</b></td>
							<td colspan="5">
								<select id="studyroomFloor" onchange="studyroomNameChange(this)" style="width:100%;">
									<!-- 유저가 클린한 방의 층 selected -->
									<option selected="selected" value="1" >1</option> 
									<option value="2">2</option>
									<option value="3">3</option>
								</select>							
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>스터디룸 이름</b></td>
							<td colspan="5">
								<select id="studyroom" style="width:100%;">
									<option>사용자가 클릭한 방의 이름</option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약 시간</b></td>
							<td colspan="2">
								<select id="startTime" onchange="endTimeChange(this)" style="width:100%">
									<c:forEach var="i" begin="9" end="20">
										<c:if test="${i<10}">
											<!-- i값이 사용자가 클릭한 값이랑 일치하면 selected -->
											<option value="${i}">0${i}:00</option>				
										</c:if>
										<c:if test="${i>=10}">
											<!-- i값이 사용자가 클릭한 값이랑 일치하면 selected -->
											<option value="${i}">${i}:00</option>				
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td>~</td>
							<td colspan="2">
								<select id="endTime" style="width:100%">
									<c:forEach var="i" begin="10" end="11">										
										<c:if test="${i>=10}">
											<!-- i값이 사용자가 클릭한 값이랑 일치하면 selected -->
											<option value="${i}">${i}:00</option>				
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약자 정보(학번)</b></td>
							<td colspan="5"><input type="text" style="height:24px;" /></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>참여자</b></td>
							<td colspan="5"><input type="text" style="height:24px;"></td> 
							<td>
								<button type="button" class="btn btn-transparent" style="width:25px; height:25px;" id="addParticipant">+</button>
							</td>
						</tr>
					</table>
				
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
	var count = 0 ;
	$('#addParticipant').click(
		function (){
			$('#reservationTable > tbody:last').append(
					'<tr id = "t'+ count +'"><td colspan="2"></td><td colspan="5"><input type="text" style="height:24px;"></td><td><button type="button" onclick="deleteParticipant(this);" class="btn btn-transparent" style="width:25px; height:25px;" id = "b'+ count +'">-</button></td></tr>');
			count++;
					
	});
	
	function deleteParticipant(obj){
		//console.log($(obj).parent('td').parent('tr').attr('id'));
		var tId = "#" + $(obj).parent('td').parent('tr').attr('id');
		$(tId).remove();
	}
	
function reservation(){
	InsertStudyroom.sr
}

function studyroomNameChange(e){
	var target = document.getElementById("studyroom");
	target.options.length = 0;
	var a = ["글고운","난길","마루","우솔"]
	var b = ["꽃채운","우리별","나루"]
	var c = ["미리내","우주","가온","다솜"]
	
	
	if(e.value==1){
		for(var i in a){			
			var opt = document.createElement("option");
		    opt.value = a[i];
		    opt.innerHTML = a[i];
		    //if(i==1) opt.selected=true;
		    target.appendChild(opt);
		}
	}
	else if(e.value==2){
		for(var i in b){			
			var opt = document.createElement("option");
		    opt.value = b[i];
		    opt.innerHTML = b[i];
		    //if(i==1) opt.selected=true;
		    target.appendChild(opt);
		}
	}
	else if(e.value==3){
		for(var i in c){			
			var opt = document.createElement("option");
		    opt.value = c[i];
		    opt.innerHTML = c[i];
		    //if(i==1) opt.selected=true;
		    target.appendChild(opt);
		}
	}
	
}

function endTimeChange(e){
	var target = document.getElementById("endTime");
	
	target.options.length = 0;
	
	if((e.value)<20){
		for(var i=1; i<3; i++){			
			var opt = document.createElement("option");
		    opt.value = Number(e.value)+Number(i)+":00";
		    opt.innerHTML = Number(e.value)+Number(i)+":00";
		    if(i==1) opt.selected=true;
		    target.appendChild(opt);
		}
	}else{
		var opt = document.createElement("option");
	    opt.value = Number(e.value)+1+":00";
	    opt.innerHTML = Number(e.value)+1+":00";
	    target.appendChild(opt);
	}
	
}

</script>
</body>
</html>