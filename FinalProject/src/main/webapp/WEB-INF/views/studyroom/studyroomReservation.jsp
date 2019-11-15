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


#reservationTable {
	margin: auto;
}
#reservationTable2 {
	margin: auto;
}

#reservationTable td{
	padding: 5px;
}

#reservationTable2 td{
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

.studyroomReservation {

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
			<form action="reservationStudyroom.sr" onsubmit="return reservationCheck()">
 				
					<table class="text-center" id="reservationTable" name="reservationTable">
						<tr>
							<td colspan="2"><b>층</b></td>
							<td colspan="5">
								<select id="so_floor" name="so_floor" onchange="studyroomNameChange(this.value)" style="width:100%;">
									<!-- 유저가 클린한 방의 층 selected -->
									<c:forEach var="i" begin="1" end="3">
										<c:if test="${i==sr_floor}">
											<option value="${i}" selected="selected" >${i}</option>
										</c:if>
										<c:if test="${i!=sr_floor}">
											<option value="${i}" >${i}</option>
										</c:if>
									</c:forEach>
								</select>							
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>스터디룸 이름</b></td>
							<td colspan="5">
								<select id="so_name" name="so_name" style="width:100%;" onchange="organizerNumChange(this.value)">
								</select>
							</td>
							<td></td> 
						</tr>
						<tr>
							<td colspan="2"><b>예약 일</b></td>
							<td colspan="5"><input type="text" readonly id="so_date" name="so_date" value="${so_date}" style="background: lightgrey;"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약 시간</b></td>
							<td colspan="2">
								<select id="so_start_time" name="so_start_time" onchange="endTimeChange(this)" style="width:100%">
									<!-- i값이 사용자가 클릭한 값이랑 일치하면 selected -->
									<c:forEach var="i" begin="9" end="21">
										<c:if test="${i<10}">
											<c:if test="${i == so_startTime}">
												<option value="0${i}" selected="selected">0${i}:00</option>				
											</c:if>
											<c:if test="${i != so_startTime}">
												<option value="0${i}">0${i}:00</option>				
											</c:if>  
										</c:if>
										<c:if test="${i>=10}">
											<c:if test="${i == so_startTime}">
												<option value="${i}" selected="selected">${i}:00</option>				
											</c:if>
											<c:if test="${i != so_startTime}">
												<option value="${i}">${i}:00</option>				
											</c:if>                                                          
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td>~</td>
							<td colspan="2">
								<select id="so_end_time" name="so_end_time" style="width:100%">
									<c:if test="${so_startTime<21}">
										<c:forEach var="i" begin="${so_startTime+1}" end="${so_startTime+2}">										
											<c:if test="${i == so_startTime+1}">
												<option value="${i}" selected="selected">${i}:00</option>				
											</c:if>
											<c:if test="${i != so_startTime+1}">
												<option value="${i}">${i}:00</option>				
											</c:if>										
										</c:forEach>
									</c:if>
									<c:if test="${so_startTime == 21}">
										<option value="${so_startTime+1}">${so_startTime+1}:00</option>	
									</c:if>
								</select>
							</td>
							<td></td>
						</tr>
					</table>
					<table  class="text-center" id="reservationTable2" name="reservationTable2">
						<tr>
							<td colspan="2"><b>예약자 정보(학번)</b></td>
							<td colspan="5"><input name="so_organizer" id="so_organizer" type="text" readonly style="height:24px; background:lightgrey;" value="${so_organizer}"/></td>
							<td></td>
						</tr>
					</table>
				
				<br>
				<div class="btnbox">
					<!-- 예약 완료시 이 창은 꺼지고 부모창 refresh -->
					<input class="btn btn-transparent" style="padding:0px" onclick="reservationCheck()" type="button" value="예약"/>
					<input class="btn btn-transparent" style="padding:0px"  type="button" onclick="window.close()" value="취소"/>
				</div>
			</form>
		</div>
	</div>
	
<script>
	var count = 0;
	$(document).on("click","#addParticipant",function (){
// 		if(count>9){
			$('#reservationTable > tbody:last').append(
					'<tr id = "t'+ count +'"><td colspan="2"></td><td colspan="5"><input id="so_participant" name="so_participant" type="text" style="height:24px;"></td><td><button type="button" onclick="deleteParticipant(this);" class="btn btn-transparent addPar" style="width:25px; height:25px;" id = "b'+ count +'">-</button></td></tr>');
			count++;
// 		}eles{
// 			alert("최대 인원수 입니다.");
// 		}
					
	});
	
	function deleteParticipant(obj){
		var tId = "#" + $(obj).parent('td').parent('tr').attr('id');
		$(tId).remove();
		count--;
	}
	
	function reservationCheck(){
		console.log(123);
		console.log(document.getElementsByName("so_participant"));
		console.log("#so_organizer" + $('#so_organizer').val());
		
		var organizer = $('#so_organizer');
		var participants = document.getElementsByName("so_participant");
		// 스터디룸 예약 게시판에서의 입력 체크 는 day에서 체크
		
		// 예약 시간 중복 검사
		
		// 참여자 실제 학생인지 검사
// 		$.ajax({
// 			type 	: "POST",
// 			url		: "checkId.sr",
// 			async	: false,
// 			data	: {idList:participants},
// 			success	: function(data){
// // 				$(data).each(function(i){
// // 					console.log(data);
// // 					//if(idList[i])
// // 				});
// 				console.log(data);
// 			},
// 			error:{
				
// 			}
// 		});	
		
		for(var i=0; i<participants.length; i++){
			// 참여자에 같은 학번 입력 방지(중복 입력방지)
			for(var j=0; j<i; j++){
		 		if(participants[i].value == participants[j].value){
		 			alert("참여자가 중복 되었습니다.")
		 			return false;
		 		}
			}
			// 빈값 입력 방지
			if(participants[i].value==""||participants[i].value==null){
				alert("참여자를 모두 입력해 주세요");
				return false;
			}
			// 참여자와 예약자 같은 학번 입력 방지
			if(participants[i].value == organizer.val()){
				alert("주최자와 참여자는 같을 수 없습니다.");
				return false;
			}
		}
		
		// 정상 예약
		return true;
		
		
	}
	
	// 최초 작동 - 예약 정보 불러오기
	window.onload=function(){
		var $target = $("select[name='so_name']");
		var $target2 = $("table[name='reservationTable2']");
		
		$target.empty();
		if(${sr_floor} == ""){
			$target.append('<option value="">선택</option>');
			return;
		}
		
		$.ajax({
			type: "POST",
			url : "getSrInfo.sr",
			async: false,
			data : {so_floor : ${sr_floor} },
			success: function(jdata){
				if(jdata.length == 0){
					$target.append('<option value="">선택</option>');
				}else{
					var num=0;
					selectRoomInfo = jdata;
					$(jdata).each(function(i){
						if(jdata[i].sr_name == "${sr_name}"){
							$target.append("<option value="+ jdata[i].sr_name+"selected>"+jdata[i].sr_name+"</option>");
							num = i;
						}else{
							$target.append("<option value="+ jdata[i].sr_name+">"+jdata[i].sr_name+"</option>");
						}
					});
					$("#so_name option:contains('${sr_name}')").prop("selected","selected");
					
					// 선택한 select의 value값(스터디룸 이름)을 받고 그 값 의 최대 인원수를 뽑아야 함
					var studyroom = Math.ceil(jdata[num].sr_maxPeople/2);
					// console.log(studyroom);
					
					
					for(var i=0; i<studyroom; i++){
						if(i == 0){
							$target2.append("<tr><td colspan='2'><b>참여자</b></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
						}else if(i == (studyroom-1)){
							$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td><button id='addParticipant' name='addParticipant' type='button' class='btn btn-transparent so_participant' style='width:25px; height:25px;'>+</button></td></tr>");
						}else{
							$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
						}	
						
					}
				}
			},
			error:function(xhr){
				console.log(xhr.responseText);
				alert("자식 창 값 보내기 실패");
				return;
			}
		});
 	}

	var selectRoomInfo ="";
	// 층 변환 시 작동
	function studyroomNameChange(so_floor){
		console.log(so_floor);
		var $target = $("select[name='so_name']");
		var $target2 = $("table[name='reservationTable2']");
		
		$target.empty();
		if(so_floor == ""){
			$target.append('<option value="">선택</option>');
			return;
		}
		
		$.ajax({
			type: "POST",
			url : "getSrInfo.sr",
			async: false,
			data : {so_floor : so_floor },
			success: function(jdata){
				if(jdata.length == 0){
					$target.append('<option value="">선택</option>');
				}else{
					var num=0;
					selectRoomInfo = jdata;
					console.log(selectRoomInfo);
					$(jdata).each(function(i){
						if(jdata[i].sr_name == "${sr_name}"){
							$target.append("<option value="+ jdata[i].sr_name+"selected>"+jdata[i].sr_name+"</option>");
							num = i;
						}else{
							$target.append("<option value="+ jdata[i].sr_name+">"+jdata[i].sr_name+"</option>");
						}
					});
					
					var studyroom = Math.ceil(jdata[num].sr_maxPeople/2);
					
					$('#reservationTable2 tr:not(:first)' ).remove();
					
					for(var i=0; i<studyroom; i++){
							if(i == 0){
								$target2.append("<tr><td colspan='2'><b>참여자</b></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
							}else if(i == (studyroom-1)){
								$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td><button id='addParticipant' name='addParticipant' type='button' class='btn btn-transparent so_participant' style='width:25px; height:25px;'>+</button></td></tr>");
							}else{
								$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
							}	
						}
				}
			},
			error:function(xhr){
				console.log(xhr.responseText);
				alert("ㅁㄴㅇㄹ");
				return;
			}
		});
	}
	
	// 스터디룸 변환 시 작동
	function organizerNumChange(so_name){
		console.log(so_name);
		console.log(selectRoomInfo);
		var $target2 = $("table[name='reservationTable2']");

		// 선택한 select의 value값(스터디룸 이름)을 받고 그 값 의 최대 인원수를 뽑아야 함
		for(var i=0; i<selectRoomInfo.length;i++){
			if(selectRoomInfo[i].sr_name == so_name){
				var studyroom = Math.ceil(selectRoomInfo[i].sr_maxPeople/2);
			} 
		}
		// console.log(studyroom);
		// 기존의 생성된 tr,td,input 태그들 삭제
		// $target2.options.length = 0;
		$('#reservationTable2 tr:not(:first)' ).remove();
		
		for(var i=0; i<studyroom; i++){
				if(i == 0){
					$target2.append("<tr><td colspan='2'><b>참여자</b></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
				}else if(i == (studyroom-1)){
					$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td><button id='addParticipant' name='addParticipant' type='button' class='btn btn-transparent so_participant' style='width:25px; height:25px;'>+</button></td></tr>");
				}else{
					$target2.append("<tr><td colspan='2'></td><td colspan='5'><input id='so_participant'"+i+" name='so_participant'  type='text' style='height:24px;'></td><td></td></tr>");
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