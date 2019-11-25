<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
#so_participant{
	background:lightgrey;
}

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
	border-color:rgba(0,82,156,0.7) !important;
	color:rgba(0,82,156,0.7) !important;
	 
}
.btn-transparent{
	padding : 0px;
	border-color:rgba(0,82,156,0.7) !important;
	color:rgba(0,82,156,0.7) !important;
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
										<option value="${i}" >${i}</option>
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
							<td colspan="5">
								<div>
									<jsp:useBean id="now" class="java.util.Date"/>
									<fmt:formatDate value="${now}" pattern="yyyy" var="year"/>
									<fmt:formatDate value="${now}" pattern="MM" var="month"/>
									<fmt:formatDate value="${now}" pattern="dd" var="date"/>
								
									<select id="year" name="year"  class="studyroom_option2">
										<!-- 오늘 년도 기본 선택-->
										<c:forEach var="i" begin="${year-1}" end="${year+2}">
											<c:if test="${i == year}">
												<option value="${i}" selected>${i}</option>
											</c:if>
											<c:if test="${i != year}">
												<option value="${i}">${i}</option>
											</c:if>
										</c:forEach>
									</select> 
									
									<select id="month" name="month"  class="studyroom_option2" onchange="daycheck(this)">
										<!--  -->
										<!-- 오늘 달 기본 선택-->
										<c:forEach var="i" begin="1" end="12">
											<c:if test="${i == month}">
												<c:if test="${i<=9}">
													<option value="0${i}" selected>${i}</option>
												</c:if>
												<c:if test="${i>9}">
													<option value="${i}" selected>${i}</option>
												</c:if>
											</c:if>
											<c:if test="${i != month}">
												<c:if test="${i<=9}">
													<option value="0${i}">${i}</option>
												</c:if>
												<c:if test="${i>9}">
													<option value="${i}">${i}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</select> 
									
									<select id="day" name="day"  class="studyroom_option2">
										<!-- 선택된 달의 숫자만큼 일수 반복-->
										<c:choose>
											<c:when test="${month==1 or month ==3 or month==5 or month == 7 or month == 8 or month == 10 or month == 12}">
												<c:forEach var="i" begin="1" end="31">
													<c:if test="${i == date}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${i != date}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:when>
											<c:when test="${month==4 or month ==6 or month==9 or month == 11}">
												<c:forEach var="i" begin="1" end="30">
													<c:if test="${i == date}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${i != date}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:when>
											<c:when test="${month==2 and (year % 4 ==0 and year%100 !=0) or year %400==0}">
												<c:forEach var="i" begin="1" end="31">
													<c:if test="${i == date}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${i != date}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:when>
											<c:when test="${month==2}">
												<c:forEach var="i" begin="1" end="28">
													<c:if test="${i == date}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${i != date}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:when>
										</c:choose>
									</select>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>예약 시간</b></td>
							<td colspan="2">
								<select id="so_start_time" name="so_start_time" onchange="endTimeChange(this.value)" style="width:100%">
								</select>
							</td>
							<td>~</td>
							<td colspan="2">
								<select id="so_end_time" name="so_end_time" style="width:100%">
								</select>
							</td>
							<td></td>
						</tr>
					</table>
					<input type="hidden" id="so_bColor" name="so_bColor"/>
					<input type="hidden" id="so_date" name="so_date"/>
					<input type="hidden" id="bo_number" name="bo_number" value="${bo_number}"/>
					<table  class="text-center" id="reservationTable2" name="reservationTable2">
						<tr>
							<td colspan="2"><b>예약자 정보(학번)</b></td>
							<td colspan="5"><input name="so_organizer" id="so_organizer" type="text" readonly style="height:24px; background:lightgrey;" value="${member_Name}"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><b>참여 인원</b></td>
							<td colspan="5">
							<input name="memberCount" id="memberCount" type="text" readonly style="height:24px; background:lightgrey;" value="${bo_member}"/>
							<input name="so_participant" id="so_participant" type="hidden" readonly style="height:24px; background:lightgrey;" value="${bo_join}"/></td>
							<td></td>
						</tr>
					</table>
				
				<br>
				<div class="btnbox">
					<!-- 예약 완료시 이 창은 꺼지고 부모창 refresh -->
					<input id="rButton" class="btn btn-transparent" style="padding:0px" type="submit" value="예약"/>
					<input class="btn btn-transparent" style="padding:0px"  type="button" onclick="window.close()" value="취소"/>
				</div>
			</form>
		</div>
	</div>
	
<script>
	var count=0;
	var num=0;
	// 인원수 추가
	
	// 랜덤 배경색상 지정
	var color='#';
	var letters = ['f6c9cc','a8c0c0','FEBF36','FF7838','6478A0','acc7bf','5e5f67','c37070','eae160','bf7aa3','d7d967'];
	color += letters[Math.floor(Math.random() * letters.length)];
	document.getElementById('so_bColor').value = color;
	
	// 예약 전 체크 사항들
	function reservationCheck(){
		// 결과 값을 담을 returnCheck 변수
		var returnCheck = true;
		// 예약자
		var organizer = $('#so_organizer');
		// console.log("#so_organizer" + $('#so_organizer').val());
		
		// 참여자 또는 예약자가 동일 시간대에 다른곳에 예약 되었는지 체크
		
		// 참여자 배열 String 으로 변환
		var participant =$('#so_participant').val();
		console.log(participant);
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		var so_date = year+'-'+month+'-'+day;
		document.getElementById("so_date").value = so_date;
		
		
		$.ajax({
			type 	: "POST",
			url		: "checkTime.sr",
			async	: false,
			data	: {
				so_organizer: organizer.val(),
				so_participant: participant,
				so_date: $('#so_date').val()
			},
			success	: function(tdata){
				for(var i=0; i<tdata.length; i++){
					console.log(tdata[i].so_start_time);
					console.log(tdata[i].so_end_time);
					console.log($('#so_start_time').val());
					console.log($('#so_end_time').val());
					
					if(tdata[i].so_start_time == $('#so_start_time').val()
							&& tdata[i].so_end_time == $('#so_end_time').val()
							&& tdata[i].so_status=='Y' ){
						alert("동일시각 중복 예약은 불가능 합니다.");
						returnCheck =  false;
						break;
					}else if( (Number(tdata[i].so_end_time)-Number(tdata[i].so_start_time))==2){
						if( Number(tdata[i].so_start_time)+1 == Number($('#so_end_time').val())
								&& tdata[i].so_status=='Y' ){
							alert("동일시각 중복 예약은 불가능 합니다!");
							returnCheck =  false;
							break;
						}else if( Number(tdata[i].so_end_time)-1 == Number($('#so_start_time').val())
								&& tdata[i].so_status=='Y' ){
							alert("동일시각 중복 예약은 불가능 합니다!!");
							returnCheck = false;
							break;
						}
					}
				}
			},
			error:function(){
				alert("중복 예약 조회 실패");
				returnCheck = false;
			}
		});
		
		// 정상 예약
		return returnCheck;
	}                                                         
	var orderData="";
	// 최초 작동 - 예약 정보 불러오기
	var bo_member = $("#memberCount").val();
	window.onload=function(){
		var $target = $("select[name='so_name']");
		var name ="";
		//console.log(bo_member);
		
		$.ajax({
			type: "POST",
			url : "spoidSrInfo.sr",
			async: false,
			data : {so_floor : 1,
					bo_member: bo_member},
			success: function(jdata){
				orderData=jdata;
				if(jdata.length == 0){
					$target.append('<option value="">선택</option>');
				}else{
					num=0;
					selectRoomInfo = jdata;
					$(jdata).each(function(i){
						if(i == 0){
							$target.append("<option value="+ jdata[i].sr_name+">"+jdata[i].sr_name+"</option>");
							name = jdata[i].sr_name;
						}else{
							$target.append("<option value="+ jdata[i].sr_name+">"+jdata[i].sr_name+"</option>");
						}
					});
					
				}
			},
			error:function(xhr){
				console.log(xhr.responseText);
				alert("최초 작동 - 예약 정보 불러오기 실패");
				return;
			}
		});
		
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		var so_date = year+'-'+month+'-'+day;
		
		console.log(name);
		console.log(so_date);
		var $target = $("#so_start_time");
		var $target2 = $("#so_end_time");

		$.ajax({
			type:"POST",
			url:"orderList.sr",
			data:{so_name:name,
				so_date: so_date},
			success:function(data){
				console.log(data);
				var ic=0;
				if(data == "" || data == null || data == undefined || ( data != null && typeof data == "object" && !Object.keys(data).length)){
					for(var i=9;i<22;i++){
							if(i==9){
								$target.append("<option value=09 >09:00</option>");
							}else{
								$target.append("<option value="+i+">"+i+":00"+"</option>");
							}
							//num = i;
					}
					var st = Number($("#so_start_time").val());
					console.log(st);
					for(var i=st+1; i<=st+2;i++){
						$target2.append("<option value="+i+" selected>"+i+":00"+"</option>");
					}
					
				}else{
					var sum = 0;
					for(var j=0; j<data.length; j++){
						sum += (Number(data[j].so_end_time) - Number(data[j].so_start_time));	
					}
					if(sum != 13){
					//console.log(data[ic].so_start_time);
					for(var i=9;i<22;i++){
						var check=0;
						for(var j=0; j<data.length; j++){
							if(Number(data[j].so_start_time) == i ){
								// 겹침
								check++;
							}else{
								// 안겹침
								if(Number(data[j].so_end_time)-Number(data[j].so_start_time) == 2){
									if(i == Number(data[j].so_end_time)-1){
										check++;
									}
								}
							}
							
							}
						if(check==0){
							if(i==9){
								$target.append("<option value=09 selected>09:00</option>");
							}else{
								$target.append("<option value="+i+">"+i+":00"+"</option>");
							}
						}
					}
					var st = Number($("#so_start_time").val());
					//console.log(st);
					for(var i=st+1; i<=st+2; i++){
						var end=0;
						if (i ==23){
							end++;
						}
						for(var j=0; j<data.length; j++){
							if(Number(data[j].so_end_time)==i){
								end++;
							}else if(i==st+2&&Number(data[j].so_start_time)==i-1){
								end++;
							}
							
						}
						if(end==0)
							$target2.append("<option value="+i+">"+i+":00"+"</option>");
					}
				}else{
					$target.append("<option value='해당없음'>해당없음</option>");
					$target2.append("<option value='해당없음'>해당없음</option>");
					$("#rButton").hide();
					
				}
				}
				
			},error:function(){
				alert("aksbdjabjksd");
			}
		});
		
 	}

	var selectRoomInfo ="";
	// 층 변환 시 작동
	function studyroomNameChange(so_floor){
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		var so_date = year+'-'+month+'-'+day;
		
		count =0;
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
			url : "spoidSrInfo.sr",
			async: false,
			data : {so_floor : so_floor,
					bo_member: bo_member},
			success: function(jdata){
				orderData=jdata;
				if(jdata.length == 0){
					$target.append('<option value="">선택</option>');
				}else{
					num=0;
					selectRoomInfo = jdata;
					console.log(selectRoomInfo);
					$(jdata).each(function(i){
						name=jdata[0].sr_name;
						num = i;
						$target.append("<option value="+ jdata[i].sr_name+">"+jdata[i].sr_name+"</option>");
					});
					
					var studyroom = Math.floor((jdata[num].sr_maxPeople-1)/2);
					console.log(studyroom);
				}
			},
			error:function(xhr){
				console.log(xhr.responseText);
				alert("층 변경 실패");
				return;
			}
		});
		
		// 예약 가능 시간 표시
		var $target3 = $("#so_start_time");
		var $target4 = $("#so_end_time");
		$("select#so_start_time option").remove();
		$("select#so_end_time option").remove();
		
		$.ajax({
			type:"POST",
			url:"orderList.sr",
			data:{so_name:name,
				so_date: so_date},
			success:function(data){
				orderData=data;
				//console.log(data);
				var ic=0;
				if(data == "" || data == null || data == undefined || ( data != null && typeof data == "object" && !Object.keys(data).length)){
					for(var i=9;i<22;i++){
							if(i==9){
								$target3.append("<option value=09 >09:00</option>");
							}else{
								$target3.append("<option value="+i+">"+i+":00"+"</option>");
							}
							//num = i;
					}
					var st = Number($("#so_start_time").val());
					//console.log(st);
					for(var i=st+1; i<=st+2;i++){
						$target4.append("<option value="+i+">"+i+":00"+"</option>");
					}
					
				}else{
					var sum = 0;
					for(var j=0; j<data.length; j++){
						sum += (Number(data[j].so_end_time) - Number(data[j].so_start_time));	
					}
					//console.log(sum);
					if(sum != 13){
						//console.log(data[ic].so_start_time);
						for(var i=9;i<22;i++){
							var check=0;
							for(var j=0; j<data.length; j++){
								if(Number(data[j].so_start_time) == i ){
									// 겹침
									check++;
								}else{
									// 안겹침
									if(Number(data[j].so_end_time)-Number(data[j].so_start_time) == 2){
										if(i == Number(data[j].so_end_time)-1){
											check++;
										}
									}
								}
								
								}
							if(check==0){
								if(i==9){
									$target3.append("<option value=09 selected>09:00</option>");
								}else{
									$target3.append("<option value="+i+">"+i+":00"+"</option>");
								}
							}
						}
						var st = Number($("#so_start_time").val());
						//console.log(st);
						for(var i=st+1; i<=st+2; i++){
							var end=0;
							if(i ==23){
								end++;
							}
							for(var j=0; j<data.length; j++){
								if(Number(data[j].so_end_time)==i){
									end++;
								}else if(i==st+2&&Number(data[j].so_start_time)==i-1){
									end++;
								}
								
							}
							if(end==0)
								$target4.append("<option value="+i+">"+i+":00"+"</option>");
						}
					}else{
						$target3.append("<option value='해당없음'>해당없음</option>");
						$target4.append("<option value='해당없음'>해당없음</option>");
						$("#rButton").hide();
					}
				}
				
			},error:function(){
				alert("aksbdjabjksd");
			}
		});
	}
	
	
	
	// 스터디룸 변환 시 작동
	
	function organizerNumChange(so_name){
		// 날짜, 스터디룸 이름
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		count=0;
		var so_date = year+'-'+month+'-'+day;
		
		//console.log(so_name);
		//console.log(so_date);
		var $target = $("#so_start_time");
		var $target2 = $("#so_end_time");

		$.ajax({
			type:"POST",
			url:"orderList.sr",
			data:{so_name:so_name,
				so_date: so_date},
			success:function(data){
				//console.log(data);
				orderData=data;
				var ic=0;
				$("select#so_start_time option").remove();
				$("select#so_end_time option").remove();
				if(data == "" || data == null || data == undefined || ( data != null && typeof data == "object" && !Object.keys(data).length)){
					for(var i=9;i<22;i++){
							if(i==9){
								$target.append("<option value=09 selected>09:00</option>");
							}else{
								$target.append("<option value="+i+">"+i+":00"+"</option>");
							}
							//num = i;
					}
					var st = Number($("#so_start_time").val());
					//console.log(st);
					for(var i=st+1; i<=st+2;i++){
						$target2.append("<option value="+i+" selected>"+i+":00"+"</option>");
					}
				}else{
					
					var sum = 0;
					var sName = "";
					for(var j=0; j<data.length; j++){
						sum += (Number(data[j].so_end_time) - Number(data[j].so_start_time));	
					}
					if(sum != 13){
						for(var i=9;i<22;i++){
							var check=0;
							for(var j=0; j<data.length; j++){
								if(Number(data[j].so_start_time) == i ){
									// 겹침
									check++;
								}else{
									// 안겹침
									if(Number(data[j].so_end_time)-Number(data[j].so_start_time) == 2){
										if(i == Number(data[j].so_end_time)-1){
											check++;
										}
									}
								}
								
								}
							if(check==0){
								if(i==9){
									$target.append("<option value=09 selected>09:00</option>");
								}else{
									$target.append("<option value="+i+">"+i+":00"+"</option>");
								}
							}
						}
						var st = Number($("#so_start_time").val());
						//console.log(st);
						for(var i=st+1; i<=st+2; i++){
							var end=0;
							if(i==23){
								end++;
							}
							for(var j=0; j<data.length; j++){
								if(Number(data[j].so_end_time)==i){
									end++;
								}else if(i==st+2&&Number(data[j].so_start_time)==i-1){
									end++;
								}
								
							}
							if(end==0)
								$target2.append("<option value="+i+">"+i+":00"+"</option>");
						}
					}
					else{
						$target.append("<option value='해당없음'>해당없음</option>");
						$target2.append("<option value='해당없음'>해당없음</option>");
						$("#rButton").hide();
						
					}
					
					
				}
			},error:function(){
				alert("aksbdjabjksd");
			}
		});
		
		// 선택한 select의 value값(스터디룸 이름)을 받고 그 값 의 최대 인원수를 뽑아야 함
		for(var i=0; i<selectRoomInfo.length;i++){
			if(selectRoomInfo[i].sr_name == so_name){
				var studyroom = Math.ceil(selectRoomInfo[i].sr_maxPeople/2);
			} 
		}
		// console.log(studyroom);
		// 기존의 생성된 tr,td,input 태그들 삭제
		
		
	}
	
	function endTimeChange(e){
		var $target = document.getElementById("so_end_time");
		$("select#so_end_time option").remove();
		//$target.options.length = 0;
		var st = Number(e);
		//console.log(st);
		for(var i=st+1; i<=st+2; i++){
			var end=0;
			if(i==23){
				end++;
			}
			for(var j=0; j<orderData.length; j++){
				if(Number(orderData[j].so_end_time)==i){
					end++;
				}else if(i==st+2&&Number(orderData[j].so_start_time)==i-1){
					end++;
				}
			}
			if(end==0)
				$("#so_end_time").append("<option value="+i+">"+i+":00"+"</option>");
		}
	}

</script>
</body>
</html>