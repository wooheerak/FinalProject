<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp를 이용한 달력</title>
<script type="text/javascript">
function selectCheck(form){
	form.submit();
}
function monthDown(form){
 if(form.month.value>1){
	 form.month.value--;
 }else {
	 form.month.value=12;
	 form.year.value--;
 }
 form.submit();
}
function monthUp(form){
 if(form.month.value<12){
	 form.month.value++;
 }else {
	 form.month.value=1;
	 form.year.value++;
 }
 form.submit();
}
</script>

<style>
@charset "utf-8";

.calbtn {
	width:40px;
	border: 2px solid #3ac5c8;
    font-size: 8px;
    padding: 2px 2px;
    background-color: white;
	text-align:center;
	border-radius: 40px;	
}

.studyroomCal {
	margin: 0;
	padding: 0;
	line-height: 1.5;
	font-family: gulim, sans-serif;
	font-size:70%;
	text-align:center;
}
.a2{
	font-size:20px;
	text-decoration: none;
	color: #5c5c5c;
}
.list_over { background-color:#F3F7FD; }
.list_out { background-color:#FFFFFF; }
.list_over2 { background-color:#e5e5e5; }
a {
	text-decoration: none;
	color: #5c5c5c;
}
#today{
	background-color:#CCCCCC;
	color:#000000;
}
.base{
	border:1px solid #8e8e8e;
}
.sun{
	border:1px solid #8e8e8e;
	color:#FF0000;
}

tr{
	height:11%;
	text-align:center;
}
td{
	text-align:center;
}
a:hover {
	text-decoration: underline;
	color: #5c5c5c;
}

.dot {style;
	border-top-style: dashed;
	border-right-style: dashed;
	border-bottom-style: dashed;
	border-left-style: dashed;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-color: rgb(71, 71, 71);
	border-right-color: rgb(71, 71, 71);
	border-bottom-color: rgb(71, 71, 71);
	border-left-color: rgb(71, 71, 71);
	background-color: rgb(232, 232, 232);
	padding-top: 10px;
	padding-right: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	p style:margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
}


table {
	border-collapse: collapse;
	border-cellpadding: cellpadding;
	height:100%;width:100%;
	align:center;border:0;
	margin-bottom: 5px;
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
 
//오늘 날짜
String today = year + ":" +(month+1)+ ":"+date; 
 
//선택한 연도 / 월
String input_year = request.getParameter("year");
String input_month = request.getParameter("month");
 
if(input_month != null){
 month = Integer.parseInt(input_month)-1;
}
if(input_year != null){
 year = Integer.parseInt(input_year);
}
// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
cr.set(year, month, 1);
 
// 셋팅한 날짜로 부터 아래 내용을 구함
 
// 해당 월의 첫날를 구함
int startDate = cr.getMinimum(Calendar.DATE);
 
// 해당 월의 마지막 날을 구함
int endDate = cr.getActualMaximum(Calendar.DATE);
 
// 1일의 요일을 구함
int startDay = cr.get(Calendar.DAY_OF_WEEK);
 
int count = 0;
%>
<form method="post" action="calendar.jsp" name="change">
<table id="studyroomCal" cellpadding="2" cellspacing="0" border="0" align="center">
 <tr>
   <td align="right">
   	<input class="calbtn" type="button" value="◁" onClick="monthDown(this.form)">
   </td>
   <td align="center">
<!--       <select name="year" onchange="selectCheck(this.form)"> -->
<%--       <% --%>
<!--       for(int i=year-10;i<year+10;i++){ -->
<!--         String selected = (i == year)?"selected":""; -->
<!--         String color = (i == year)?"#CCCCCC":"#FFFFFF"; -->
<!--           out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");        -->
<!--        } -->
<%--       %> --%>
<!--       </select> -->
		<%= year%>
      </td>
      <td>
<!--       <select name="month" onchange="selectCheck(this.form)"> -->
<%--       <% --%>
<!--       for(int i=1;i<=12;i++){ -->
<!--        String selected = (i == month+1)?"selected":""; -->
<!--        String color = (i == month+1)?"#CCCCCC":"#FFFFFF"; -->
<!--          out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");        -->
<!--        } -->
<%--       %> --%>
<!--       </select> -->
		<%= month+1 %>
      </td>
      <td><input  class="calbtn"  type="button" value="▷" onClick="monthUp(this.form)"></td>
    </tr>
<!--     <tr> -->
<%--       <td align="right" colspan="3"><a href="calendar.jsp"><font size="2">오늘 :  <%=today %></font></a></td> --%>
<!--     </tr> -->
</table>
</form>        
<table width="400" cellpadding="2" cellspacing="0" border="1" align="center">
 <tr height="30">
  <td><font size="2"></font></td>
  <td><font size="2">일</font></td>
  <td><font size="2">월</font></td>
  <td><font size="2">화</font></td>
  <td><font size="2">수</font></td>
  <td><font size="2">목</font></td>
  <td><font size="2">금</font></td>
  <td><font size="2">토</font></td>
 </tr>
 <tr height="30">
<%
for (int i=1;i<startDay+1;i++){
 count++;
%>
        <td>&nbsp;</td>
<% 
}
for (int i=startDate;i<=endDate;i++){
 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#CCCCCC" : "#FFFFFF";
 String color = (count%8 == 1 || count%8 == 7)? "red" : "black";
 count++;
 
 if(count%8 == 1){
	 %>
	 <td><font size="2"><a href="srWeek.sr">=></a></font></td>
	 <%
	 i--;
 }else{
%> 
  <td><font size="2" color=<%=color %>><a href="srDay.sr" style="color:<%=color %>"><%=i %></a></font></td>
<%}
  if(count%8 == 0 && i < endDate){
%> 
 </tr>
 <tr height="30">
<%
  }
}
while(count%8 != 0){
%>
       <td>&nbsp;</td>
<% 
count++;
 }
%>
</tr>  
</table>
</body>
</html> 
