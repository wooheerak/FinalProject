<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.studyroom_title {
	text-align: left;
	color: #3ac5c8;
}

.studyroom_option {
	width:100%;
	text-align: center;
	text-align-last:center;
}
.studyroom_option.option{
	text-align-last:center;
}
.studyroom_option2 {
	width:32%;
	text-align: center;
	text-align-last:center;
}

#studyroom_Calenderbox {
	
}

.btn {
	background-color:white;
	text-align:center;
	width:80px;
	height: 30px;
	 
}
.btn-transparent{
	padding : 0px;
}
.floor_th{
	border-left: 1px solid #000000;
/* 	border-right: 1px solid #000000; */
	border-bottm: 1px solid #000000;
}
.studyroom_main {
	border: 1px solid #000000;
}

.studyroom_main tr td {
	border: 1px solid #000000;
	width: 45px;
	height: 40px;
	text-align: center;
}

.studyroom_main th {
	width: 45px;
	height: 40px;
	background-color: lightblue;
	font-size: 1.3px;
	color: white;
	text-align: center;
}

.studyroom_main th.studyroom_time {
	width: 5px;
}

.btnEnd{
	margin-top:10px;
	margin-bottm:10px;
	margin-right:10px;
	text-align:right;
}
</style>
</head>
<body>
<%
//현재 날짜 정보 
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);
System.out.println(date);
%>
	<c:import url="../common/header.jsp" />

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>스터디룸 예약조회</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>

	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<table class="studyroom_main">
						<!-- rowspan을 사용하기 위해 예약시간 없으면 없는 수만큼 for문에서 차감 하는 식의 2중포문 제작-->
						<!-- 방갯수만큼 for문 -->
						<tr>
							<th class="studyroom_time" rowspan="2">Time</th>
								<%int a=0; int b=0; int c=0;%>
								<c:forEach var="i" items="${list}" begin="0" end="${roomCount}">
									<c:if test="${i.sr_floor==1}">
										<%a++;%>
									</c:if>
									<c:if test="${i.sr_floor==2}">
										<%b++;%>
									</c:if>
									<c:if test="${i.sr_floor==3}">
										<%c++;%>
									</c:if>
								</c:forEach>
								<th class="floor_th" colspan="<%=a%>" >1</th>				
								<th class="floor_th" colspan="<%=b%>">2</th>
								<th class="floor_th" colspan="<%=c%>">3</th>
						</tr>
						
						<tr>
							<!-- end는 층의 방 갯수 -->
							<c:forEach var="i" items="${list}" varStatus="s" begin="0" end="${roomCount}">
								<c:choose>
									<c:when test="${s.index == 4}">
										<th class="floor_th">${i.sr_name}(${i.sr_maxPeople})</th>
									</c:when>
									<c:when test="${s.index == 7}">
										<th class="floor_th">${i.sr_name}(${i.sr_maxPeople})</th>
									</c:when>
									<c:otherwise>
										<th>${i.sr_name}(${i.sr_maxPeople})</th>
									</c:otherwise>
								</c:choose>
								
<%-- 								<c:if test="${s.inedx == 4 }"> --%>
<%-- 									<th class="floor_th">${i.sr_name}(${i.sr_maxPeople})</th> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${s.inedx == 7 }"> --%>
<%-- 									<th class="floor_th">${i.sr_name}(${i.sr_maxPeople})</th> --%>
<%-- 								</c:if > --%>
<%-- 								<c:if test="${s.inedx != 4 }"> --%>
<%-- 									<th>${i.sr_name}(${i.sr_maxPeople})</th> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${s.inedx != 7 }"> --%>
<%-- 									<th>${i.sr_name}(${i.sr_maxPeople})</th> --%>
<%-- 								</c:if> --%>
								
							</c:forEach>
						</tr>
						<!-- 시간대만큼 for문 -->
							<c:forEach var="i"  begin="9" end="22">
								<tr>
									<c:if test="${i<10}">
										<th class="studyroom_time">0${i}:00</th>				
									</c:if>
									<c:if test="${i>=10}">
										<th class="studyroom_time">${i}:00</th>				
									</c:if>
									
									<c:forEach var="j"  begin="0" end="${roomCount}" items="${list}">
										<td>
										<!--  버튼 클릭시 팝업이 뜨고 팝업에 클릭한 버튼의 시작시간 및 마감 시간을 select할 값으로 전달 -->
										    
											<button id="startTime${i}" name="startTime${i}" type="submit" value="${i},${ j.sr_name},${j.sr_floor}" class="btn" onclick="srReservation(this);" style="padding:0px;width:73px;height:38px;">+</button>
										</td>
									</c:forEach>
								</tr>				
							</c:forEach>
					</table>
				</div>
				<input id="userIdCheck" name="userIdCheck" type="hidden" value="${loginUser.member_Id}">
				
				<div class="col-md-3">
					<!-- 날짜 직접 입력하여 날짜 값 변경 -->
					<div id="studyroom_DateInfobox">
						<div class="studyroom_title">
							<h3>Date</h3>
						</div>
						<div>
							<form>
								<div>
									<select id="year" name="year"  class="studyroom_option2">
										<!-- 오늘 년도 기본 선택-->
										<%
									      for(int i=year-1; i<year+3; i++){
									       String selected = (i == year)?"selected":"";
									       String color = (i == year)?"#CCCCCC":"#FFFFFF";
									         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
									      }
									      %>
									</select> 
									<select id="month" name="month"  class="studyroom_option2" onchange="daycheck(this)">
										<!--  -->
										<!-- 오늘 달 기본 선택-->
										 <%
									      for(int i=1; i<=12; i++){
									       String selected = (i == month+1)?"selected":"";
									       String color = (i == month+1)?"#CCCCCC":"#FFFFFF";
									         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
									      }
									      %>
									</select> 
									<select id="day" name="day"  class="studyroom_option2">
										<!-- 선택된 달의 숫자만큼 일수 반복-->
										<%
											if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
										      for(int i=1; i<=31; i++){
										      	String selected = (i == date)?"selected":"";
										     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
										    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
										      }
											}
											else if(month == 4 || month == 6 || month == 9 || month == 11){
												for(int i=1; i<=30; i++){
													String selected = (i == date)?"selected":"";
											     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
											    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");      
												}
											}
											else if(month == 2 && (year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
												for(int i=1; i<=29; i++){
													String selected = (i == date)?"selected":"";
											     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
											    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>"); 
												}
											}
											else if(month == 2){
												for(int i=1; i<=28; i++){
													String selected = (i == date)?"selected":"";
											     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
											    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");
												}
											}
									      %>
									</select>
								</div>
								<div>
									<div class="btnEnd">
										<input class="btn btn-transparent" style="padding:0px" type="submit" value="change" />
									</div>
								</div>
							</form>
						</div>
					</div>
					<br><br>
					<div id="studyroom_Calenderbox">
						<!-- 달력을 보고 클릭하여 날짜 값 변경-->
						<!-- 현재 월 달력 -->
						<div>
							<jsp:include page="../common/calender.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
	function srReservation(e){
		// 예약자 정보(로그인 체크) 
 		var so_organizer = $("#userIdCheck").val();
		console.log(so_organizer);
		
		if(so_organizer==""){
			alert("로그인 후 이용해 주세요.");
		}
		else{
			
			var studyroomValue = $(e).attr("value").split(',');
			//console.log(studyroomValue);
			
			//스터디룸 이름 
			var sr_name = studyroomValue[1];
			//console.log(studyroomValue[1])
			
			// 스터디룸 층
			var sr_floor = studyroomValue[2];
			// console.log(sr_floor);
			
	 		// 예약일 
			var so_date = $("#year option:selected").attr("value")
							+'-'+$("#month option:selected").attr("value")
							+'-'+$("#day option:selected").attr("value");
			//console.log(so_date);
	 		
	 		// 예약시작 시간 
			var so_startTime = studyroomValue[0];
			// console.log(so_startTime)
	 		
	 		
	// 		var so_organizer = "201132081";
			
			var url = "srReservation.sr?sr_name="+sr_name+"&so_date="+so_date+"&so_startTime="+so_startTime+"&so_organizer="+so_organizer+"&sr_floor="+sr_floor;
				
			var srReservation = "srReservation";
			
			var specs="width=420px, height=350px, left=20, top=30, toolbar=no, location=no, directories=no";
			
			window.open(url,srReservation,specs);
		}
	}

	function daycheck(e){
		var target = document.getElementById("day");
		var d = new Date();
		
		target.options.length = 0;
		
		if(e.value == 1 || e.value == 3 || e.value == 5 || e.value == 7 || e.value == 8 || e.value == 10 || e.value == 12){
	      for(var i=1; i<=31; i++){
		       var opt = document.createElement("option");
		       opt.value = i;
		       opt.innerHTML = i;
		       if(d.getDate()==i) opt.selected=true;
		       target.appendChild(opt);
	      }
		}
		else if(e.value == 4 || e.value == 6 || e.value == 9 || e.value == 11){
			for(var i=1; i<=30; i++){
				var opt = document.createElement("option");
			    opt.value = i;
			    opt.innerHTML = i;
			    if(d.getDate()==i) opt.selected=true;
			    target.appendChild(opt);       
			}
		}
		else if(e.value == 2 && (d.getFullYear() % 4 == 0 && d.getFullYear() % 100 != 0) || d.getFullYear() % 400 == 0){
			for(var i=1; i<=29; i++){
				var opt = document.createElement("option");
			    opt.value = i;
			    opt.innerHTML = i;
			    if(d.getDate()==i) opt.selected=true;
			    target.appendChild(opt); 
			}
		}
		else if(e.value == 2){
			for(var i=1; i<=28; i++){
				var opt = document.createElement("option");
			    opt.value = i;
			    opt.innerHTML = i;
			    if(d.getDate()==i) opt.selected=true;
			    target.appendChild(opt);
			}
		}	
	}
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>