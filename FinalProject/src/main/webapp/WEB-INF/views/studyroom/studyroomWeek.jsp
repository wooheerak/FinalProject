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
// 나중에 
String [] list = {"a","b","c","d"};
%>
<%
//현재 날짜 정보 
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);
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
						<!-- ajax로 모든 층의 스터디룸을 띄워두고 해당층만 display:show 하고 나머지값은 none처리 -->
						<tr>
							
							<th class="studyroom_time">Time</th>
							<!-- end는 층의 방 갯수 -->
							<c:set var="date" value="<%= date %>" />
							<c:forEach var="i" begin="0" end="6">
							
								<!-- 방이름 -->
								<th><%= month+1 %> /   ${i + date} </th>
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
									
									<c:forEach var="i"  begin="1" end="7">
										<td>
											<!--  버튼 클릭시 팝업이 뜨고 팝업에 클릭한 버튼의 시작시간 및 마감 시간을 select할 값으로 전달 -->
											<a href="#" onclick="srReservation()">+</a>
											<!-- 클릭한 버튼의 시간대 값 전달 용 hidden input -->
											<input name="time" type="hidden" value="${i}"/>
										</td>
									</c:forEach>
								</tr>				
							</c:forEach>													
					</table>
				</div>


				<div class="col-md-3">
					<div class="studyroom_title">
						<h3>floor</h3>
					</div>
					<div>
						<form>
							<select class="studyroom_option">
								<!-- 층수 만큼 option-->
								<option style="text-align-last:center;">1</option>
								<option>2</option>
								<option>3</option>
							</select>
							<select class="studyroom_option">
		                        <!-- 층수 만큼 option-->
		                        <%
		                        int count=0;
		                        // 4 = 방 갯수 로 이후 바꿀것 
		                        for(int i=0; i<list.length;i++){
		                                 String selected = (i == 1)?"selected":""; 
		                                 	// i 는 방의 이름으로 바꿀것
		                                   out.print("<option value="+list[count]+" "+selected+" >"+list[count]+"</option>");
		                        		count++;
		                        	}
		                        %>
		                        
		                    </select>
							<div>
								<div class="btnEnd">
									<input class="btn btn-transparent" style="padding:0px" type="submit" value="change" />
								</div>
							</div>
						</form>
					</div>


					<!-- 날짜 직접 입력하여 날짜 값 변경 -->
					<div id="studyroom_DateInfobox">
						<div class="studyroom_title">
							<h3>Date</h3>
						</div>
						<div>
							<form>
								<div>
									<select name="year"  class="studyroom_option2">
										<!-- 오늘 년도 기본 선택-->
										<%
									      for(int i=year;i<year+3;i++){
									       String selected = (i == year)?"selected":"";
									       String color = (i == year)?"#CCCCCC":"#FFFFFF";
									         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
									      }
									      %>
									</select> 
									<select name="month"  class="studyroom_option2" onchange="daycheck(this)">
										<!--  -->
										<!-- 오늘 달 기본 선택-->
										 <%
									      for(int i=1;i<=12;i++){
									       String selected = (i == month+1)?"selected":"";
									       String color = (i == month+1)?"#CCCCCC":"#FFFFFF";
									         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
									      }
									      %>
									</select> 
									<select id="day"  class="studyroom_option2">
										<!-- 선택된 달의 숫자만큼 일수 반복-->
										<!-- 오늘 날짜 기본 선택-->
										<%
											if(date == 1 || date == 3 || date == 5 || date == 7 || date == 8 || date == 10 || date == 12){
										      for(int i=1; i<=31; i++){
										      	String selected = (i == date)?"selected":"";
										     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
										    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
										      }
											}
											else if(date == 4 || date == 6 || date == 9 || date == 11){
												for(int i=1; i<=30; i++){
													String selected = (i == date)?"selected":"";
											     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
											    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");      
												}
											}
											else if(date == 2 && (year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
												for(int i=1; i<=29; i++){
													String selected = (i == date)?"selected":"";
											     	String color = (i == date)?"#CCCCCC":"#FFFFFF";
											    	out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>"); 
												}
											}
											else if(date == 2){
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
	function srReservation(){
		url = "srReservation.sr";
		name="_black"
		specs="width=350, height=300, left=100, top=100, location=no"
		window.open(url,'srReservation',specs)
		var startTime = document.getElementById("time"); 
		var endTime = document.getElementById("time")+1; 
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