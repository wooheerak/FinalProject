<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardDetail</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>

<style type="text/css">
* { font-family: 'Spoqa Han Sans'; }
#boardtable {
	margin: auto;
	width: 70% !important;
	min-height: 600px;
	text-align: center;
}

.replyTable {
	margin: auto;
	width: 800px;
}

.col-sm-7 {
	width: 55.333333% !important;
	margin-top: 10px !important;
}

.rContent {
	margin: auto;
}
#rContent {
	width: 400px !important;
}

th{
 text-align: center !important;
 background: rgba(0,82,156,0.7);
 color: white;
 width: 150px;
 height: 50px;
}
td{
	font-weight:600; 
   font-size:18px;
}
.aa{background: #e3ebf9;}
.bb{background: #;}
.cc{background: #e3ebf9;}
.dd{background: #;}
.ee{background: #e3ebf9;}
.ff{background: #;}

.swal2-popup {
  font-size: 20px !important;
}
/* 버튼 */
* {
	box-sizing: border-box;
}
body {
	margin: 0;
	background: #eaedf1;
	font-family: 'Lato', sans-serif;
}
.header {
	background: white;
	padding: 30px;
	text-align: center;
}
.header h1 {
	font-weight: 300;
	display: inline;
}
h2 {
	color: #89867e;
	text-align: center;
	font-weight: 300;
}
.color {
	width: 350px;
	margin: 0 auto;
}
.color li {
	margin: 0 15px 0 0;
	width: 30px;
	height: 30px;
	display: inline-block;
	border-radius: 100%;
}
.color .red    {background: #fa5a5a;}
.color .yellow {background: #f0d264;}
.color .green  {background: #82c8a0;}
.color .cyan   {background: #7fccde;}
.color .blue   {background: #6698cb;}
.color .purple {background: #cb99c5;}

.content, 
.content-gradient, 
.content-3d {
  margin: 40px auto;
}
.content {
  width: 80%;
  max-width: 700px;
}
.content-3d {
  width: 50%;
  max-width: 300px;
}
pre {
	width: 100%;
	padding: 30px;
	background-color: rgba(0, 0, 0, 0.72);
	color: #f8f8f2;
	border-radius: 0 0 4px 4px;
	margin-top: 20px;
  white-space: pre-wrap; /* css-3 */
  white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
  white-space: -pre-wrap; /* Opera 4-6 */
  white-space: -o-pre-wrap; /* Opera 7 */
  word-wrap: break-word; /* Internet Explorer 5.5+ */
}
pre .bt  {color: #f8f8f2;} /* <> */
pre .anc {color: #f92672;} /* anchor tag */
pre .att {color: #a6a926;} /* attribute */
pre .val {color: #e6db74;} /* value */

.btn-container, .container {
	border-radius: 4px;
	text-align: center;
	margin-bottom: 40px;
}
.container h2 {
	padding-top: 30px;
	font-weight: 300;
}
.btn, .btn-two {
	margin: 9px;
}
.btn-gradient {
	margin: 5px;
}
a[class*="btn"] {text-decoration: none;}
input[class*="btn"], 
button[class*="btn"] {border: 0;}

/* Here you can change the button sizes */
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}

/* Colors for .btn and .btn-two */
.btn.blue, .btn-two.blue     {background-color: #7fb1bf;}
.btn.green, .btn-two.green   {background-color: #9abf7f;}
.btn.red, .btn-two.red       {background-color: #fa5a5a;}
.btn.purple, .btn-two.purple {background-color: #cb99c5;}
.btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
.btn.yellow, .btn-two.yellow {background-color: #f0d264;}

.rounded {
  border-radius: 10px;
}

/* default button style */
.btn {
	position: relative;
	border: 0;
	padding: 15px 25px;
	display: inline-block;
	text-align: center;
	color: white;
}
.btn:active {
	top: 4px;	
}

/* color classes for .btn */
.btn.blue {box-shadow: 0px 4px #74a3b0;}
.btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}

.btn.green {box-shadow: 0px 4px 0px #87a86f;}
.btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}

.btn.red {box-shadow:0px 4px 0px #E04342;}
.btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}

.btn.purple {box-shadow:0px 4px 0px #AD83A8;}
.btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}

.btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
.btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}

.btn.yellow {box-shadow:0px 4px 0px #D1B757;}
.btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}

/* Button two - I have no creativity for names */
.btn-two {
	color: white;	
	padding: 15px 25px;
	display: inline-block;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
				      0 2px 0 -1px rgba(0,0,0,0.13), 
				      0 3px 0 -1px rgba(0,0,0,0.08), 
				      0 3px 13px -1px rgba(0,0,0,0.21);
}
.btn-two:active {
	top: 1px;
	border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
	box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
	position: relative;
}
/* 3D Button */
.btn-3d {
	position: relative;
	display: inline-block;
	font-size: 22px;
	padding: 20px 60px;
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.red:hover    {background-color: #e74c3c;}
.btn-3d.blue:hover   {background-color: #699DD1;}
.btn-3d.green:hover  {background-color: #80C49D;}
.btn-3d.purple:hover {background-color: #D19ECB;}
.btn-3d.yellow:hover {background-color: #F0D264;}
.btn-3d.cyan:hover   {background-color: #82D1E3;}

.btn-3d:active {
	top: 9px;
}

/* 3D button colors */
.btn-3d.red {
	background-color: #e74c3c;
	box-shadow: 0 0 0 1px #c63702 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 #C24032,
        0 8px 0 1px rgba(0,0,0,0.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.red:active {
	box-shadow: 0 0 0 1px #c63702 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(110, 164, 219, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.green {
	background-color: #82c8a0;
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(126, 194, 155, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.green:active {
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.purple {
	background-color: #cb99c5;
	box-shadow: 0 0 0 1px #cb99c5 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(189, 142, 183, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.purple:active {
	box-shadow: 0 0 0 1px #cb99c5 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.cyan {
	background-color: #7fccde;
	box-shadow: 0 0 0 1px #7fccde inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(102, 164, 178, .6),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.cyan:active {
	box-shadow: 0 0 0 1px #7fccde inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.yellow {
	background-color: #F0D264;
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(196, 172, 83, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.yellow:active {
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

/* Gradient buttons */
.btn-gradient {
	text-decoration: none;
	color: white;
	padding: 10px 30px;
	display: inline-block;
	position: relative;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom: 4px solid rgba(0,0,0,0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
	background: rgba(27,188,194,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
	background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.red{ 
	background: rgba(250,90,90,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
	background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}
.btn-gradient.orange {
	background: rgba(255,105,30,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255,105,30,1)), to(rgba(230,95,28,1)));
	background: -webkit-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: -moz-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: -o-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
}
.btn-gradient.blue {
	background: rgba(102,152,203,1);
	background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
	background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
}
.btn-gradient.purple { 
	background: rgba(203,153,197,1);
	background: -moz-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(203,153,197,1)), color-stop(100%, rgba(181,134,176,1)));
	background: -webkit-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -o-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -ms-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: linear-gradient(to bottom, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb99c5', endColorstr='#b586b0', GradientType=0 );
}
.btn-gradient.yellow {
	background: rgba(240,210,100,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(240,210,100,1)), to(rgba(229,201,96,1)));
	background: -webkit-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: -moz-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: -o-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f0d264', endColorstr='#e5c960', GradientType=0 );
}
.btn-gradient.green {
	background: rgba(130,200,160,1);
	background: -moz-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(130,200,160,1)), color-stop(100%, rgba(130,199,158,1)));
	background: -webkit-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -o-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -ms-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: linear-gradient(to bottom, rgba(130,200,160,1) 0%, rgba(124, 185, 149, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#82c8a0', endColorstr='#82c79e', GradientType=0 );
}

.btn-gradient.red:active 	  {background: #E35252;}
.btn-gradient.orange:active {background: #E8601B;}
.btn-gradient.cyan:active 	{background: #169499;}
.btn-gradient.blue:active 	{background: #608FBF;}
.btn-gradient.purple:active {background: #BD8EB7;}
.btn-gradient.yellow:active {background: #DBC05B;}
.btn-gradient.green:active  {background: #72B08E;}

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="../common/header.jsp" />

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>게시글 보기</h2>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
	</section>
	<!-- end section -->
	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		
		<table border="1" id="boardtable">
		<tr>
			<th width="80px" align="center">번호</th>
			<td class="aa">${ board.bo_number }</td>
		
			<th>제목</th>
			<td class="aa">${ board.bo_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3" class="bb">${ board.bo_name }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td colspan="3" class="cc">
				${ board.bo_date }
			</td>
		</tr>
		<tr>
			<th>상태</th>
			<td class="dd">
				<c:set var="com" value="${ board.bo_complete }" />
				<c:choose>
				    <c:when test="${com eq 'N'}">
				        	모집중
				    </c:when>
				    <c:when test="${com eq 'Y'}">
				       		마감!!
				    </c:when>
				</c:choose>
			</td>
			<th>모집유형</th>
			<td class="dd">
				<c:set var="rei" value="${ board.bo_reinfo }" />
				<c:choose>
				    <c:when test="${rei eq 'N'}">
				        	바로
				    </c:when>
				    <c:when test="${rei eq 'Y'}">
				       		예약
				    </c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<!-- 
				이렇게만 두면 엔터가 먹지 않음. 
				DB에는 엔터가 \r\n으로 들어가서 이를 치환해주는 작업 필요
			-->
			<% pageContext.setAttribute("newLineChar", "\r\n"); %> <!-- \r\n 말고 그냥 \n도, \r도 가능하다 -->
			<td colspan="3" style="height: 400px; text-align: left;" class="ee">${ fn:replace(board.bo_detail, newLineChar, "<br>") }<br></td>
		</tr>
		<tr>
			<th>현재 인윈 / 모집 인원</th>
				<c:url var="bJoin" value="bJoin.bo">
					<c:param name="bo_number" value="${ board.bo_number }"/>
					<c:param name="Member_Name" value="${ loginUser.member_Name }"/>
					<c:param name="Member_Id" value="${ loginUser.member_Id }"/>
					<c:param name="bo_member" value="${ board.bo_member }"/>
					<c:param name="bo_maxmember" value="${ board.bo_maxmember }"/>
				</c:url>
				<c:url var="bUnjoin" value="bUnjoin.bo">
					<c:param name="bo_number" value="${ board.bo_number }"/>
					<c:param name="Member_Name" value="${ loginUser.member_Name }"/>
					<c:param name="Member_Id" value="${ loginUser.member_Id }"/>
				</c:url>
				<td style="width: 150px;" class="ff">${ board.bo_member } / ${ board.bo_maxmember }</td>
			<th>참여자 아이디</th>
			<td class="ff">
				<c:set var="join" value="${ board.bo_join }" />
					<c:choose>
					    <c:when test="${join eq NULL}">
					        	참여자가 없어요
					    </c:when>
					    <c:when test="${join != 'NULL'}">
					       		${ board.bo_join}
					    </c:when>
					</c:choose>
				<br>
			<c:if test="${ board.bo_complete == 'N' }">
				<c:set var="joinmember" value="${ board.bo_join }"/>
				<c:if test="${ !empty sessionScope.loginUser }">
					<c:if test="${ board.bo_member < board.bo_maxmember}">
						<c:if test="${ loginUser.member_Name != board.bo_name }">
							<c:if test="${ fn:contains(joinmember,loginUser.member_Id) }">
							<script>
								$(function() {
									$('#join').hide();
									$('#cancel').show();
								})
							</script>
							</c:if>
							<c:if test="${ !fn:contains(joinmember,loginUser.member_Id) }">
							<script>
								$(function() {
									$('#join').show();
									$('#cancel').hide();
								})
							</script>
							</c:if>
								<button class="btn-gradient blue" id="join">참여</button>
								<button class="btn-gradient red" id="cancel">탈퇴</button>
								<script type="text/javascript">
									$('#cancel').click(function(){
										Swal.fire({
											width: 600,
											padding: 100,
										  title: '탈퇴 하시겠습니까?',
										  text: "다시한번 확인해주세요",
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  cancelButtonText: '취소',
										  confirmButtonText: '탈퇴할래요!!',
										}).then((result) => {
										if (result.value) {
										    location.href='${ bUnjoin }'
									    	 swalWithBootstrapButtons.fire(
									    		      '탈퇴 되었습니다',
									    		      '탈퇴 완료.',
									    		      'success'
									    		    )
										  } else {
										  }
									})
								});
								</script>
								<script type="text/javascript">
								 $('#join').click(function(){
									Swal.fire({
										width: 600,
										padding: 100,
									  title: '참여 하시겠습니까?',
									  text: "다시한번 확인해주세요",
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonColor: '#3085d6',
									  cancelButtonColor: '#d33',
									  cancelButtonText: '취소',
									  confirmButtonText: '참여할래요!'
									}).then((result) => {
										if (result.value) {
										    location.href='${ bJoin }'
									    	 swalWithBootstrapButtons.fire(
									    		      '참여 완료!',
									    		      '열심히 공부해요',
									    		      'success'
									    		    )
										  } else {
										  }
									})
								});  
								</script>
							</c:if>
						</c:if>
							<c:if test="${ board.bo_member == board.bo_maxmember}">
							</c:if>
							<c:if test="${ board.bo_complete == 'N' }">
								<c:if test="${ loginUser.member_Name eq board.bo_name }">
									<c:if test="${ board.bo_member == board.bo_maxmember }">
											<script>
											$(function() {
												$('#complete').show();
											})
											</script>
									</c:if>
									<c:if test="${ board.bo_member < board.bo_maxmember }">
										<script>
										$(function() {
											$('#complete').hide();
										})
										</script>
									</c:if>
									<c:url var="bComplete" value="bComplete.bo">
									<!-- 작성자, 참여인원, 참여자id,  -->
									
										<c:param name="member_Name" value="${ loginUser.member_Name }"/>
										<c:param name="bo_number" value="${ board.bo_number }"/>
										<c:param name="bo_join" value="${ board.bo_join }"/>
										
									</c:url>
									<button id="complete" class="btn-gradient green">마감하기</button>
									<script type="text/javascript">
											$('#complete').click(function(){
												Swal.fire({
													width: 600,
													padding: 100,
												  title: '마감 하시겠습니까?',
												  text: "다시한번 확인해주세요",
												  icon: 'warning',
												  showCancelButton: true,
												  confirmButtonColor: '#3085d6',
												  cancelButtonColor: '#d33',
												  cancelButtonText: '취소',
												  confirmButtonText: '마감 할래요!!',
												}).then((result) => {
												if (result.value) {
													var url = "srAppointment.sr?bo_number=${board.bo_number}&bo_member=${board.bo_member}&member_Name=${ loginUser.member_Id }&bo_join=${ board.bo_join }";
													var srReservation2 = "srReservation2";
													var specs="width=420px, height=350px, left=20, top=30, toolbar=no, location=no, directories=no";
													window.open(url,srReservation2,specs);
												  } else {
												  }
											})
										});
										</script>
								</c:if>
							</c:if>
						</c:if>
					</c:if>
			<c:if test="${ board.bo_complete == 'Y' }">
				<c:if test="${ loginUser.member_Name == board.bo_name }">
					${ board.bo_reservation } 
					<c:url var="bUnComplete" value="bUnComplete.bo">
						<c:param name="bo_number" value="${ board.bo_number }"/>
					</c:url>
					<button id="uncomplete" class="btn-gradient red">마감취소</button>
					<script type="text/javascript">
							$('#uncomplete').click(function(){
								Swal.fire({
									width: 600,
									padding: 100,
								  title: '마감 취소 하시겠습니까?',
								  text: "다시한번 확인해주세요",
								  icon: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  cancelButtonText: '취소',
								  confirmButtonText: '마감 취소할래요!!',
								}).then((result) => {
									var pass=0;
									$.ajax({
										type:"POST",
										url : "cancelOrder.sr",
										async	: false,
										data:{bo_number:${board.bo_number}},
										success :{
										},error:{
										}
									});
									if (result.value) {
									    location.href='${ bUnComplete }';
								  }
							})
						});
						</script>
					</c:if>
				</c:if>
			</td>
		</tr>
	</table>
	
		<c:url var="bUpView" value="bUpView.bo">
			<c:param name="bo_number" value="${ board.bo_number }"/>
		</c:url>
		
		<c:url var="bdelete" value="bdelete.bo">
			<c:param name="bo_number" value="${ board.bo_number }"/>
		</c:url>
		
		<c:url var="blist" value="bList.bo">
		</c:url>
		
		<br><br>
		<!--  -->
		<p align="center">
		<c:if test="${ loginUser.member_Name eq board.bo_name }">
			<tr>
				<td colspan="2" align="center">
					<button class="btn-gradient blue" onclick="location.href='${ bUpView }'">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn-gradient red" onclick="location.href='${ bdelete }'">삭제하기</button>
				</td>
			</tr>
		</c:if> 
		</p>
	
	
	<br><br>
	 <!-- 댓글 -->
 	 
	<c:if test="${ !empty sessionScope.loginUser }">
		<table class = "replyTable">
		   <tr>
		      <td>
		         <textarea  style='margin-left: 30%;' rows = "3" cols = "55" id ="rContent"></textarea>
		      </td>
		      <td>
		         <button id = "rSubmit" class="btn-gradient blue">등록하기</button>    
		      </td>
		   </tr>
		</table>
	</c:if>
	
   <table class = "replyTable" id = "rtb">
      <thead>
         <tr>
            <td colspan = "2"><b id = "rCount"></b>
            </td>
         </tr>
      </thead>
      <tbody></tbody>
      
   </table>
	<script>
      $(function(){
    	 getReplyList();
         
         /* setInterval(function(){
            getReplyList();
         } , 10000); */
      });
      
      // 댓글 리스트
      function getReplyList(){
         var bId = ${ board.bo_number } ;
       	 var id = ${ loginUser.member_Id };
         
         
         $.ajax({
            url : "rList.bo" ,
            data : {bo_number : bId},
            dataType : "json" ,
            success : function(data){
               $tableBody = $("#rtb tbody");
               $tableBody.html("");
               
               var $tr;
               var $rWriter;
               var $rContent;
               var $rCreateDate;
               var $rUpbutton;
               var $rDebutton;
               
               $("#rCount").text("Comment (" + data.length + ")");
               
               if(data.length > 0){
            	   var num = 0;
                  for(var i in data){
                     $tr = $("<tr>");
                     $rWriter = $("<td>").text(data[i].rWriter);
                     $rContent = $("<td class='rin' id='listContent" + num + "'>").text(decodeURIComponent(data[i].rContent.replace(/\+/g , " ")));
                     $rCreateDate = $("<td>").text(data[i].rCreateDate);
                     $rUpbutton = $('<a href="javascript:void(0)" class="btn-gradient mini yellow" onclick="fn_editReplyView(listContent' + num + ',' + data[i].rId + ')">수정</a>');
                     $rDebutton = $("<a href='javascript:void(0)' class='btn-gradient mini red' onclick='fn_deleteReply(" + data[i].rId + ")'>삭제</a>'"); 

                     $tr.append($rWriter);
                     $tr.append($rContent);
                     $tr.append($rCreateDate);
                     if( id == data[i].rWriter){
                     	$tr.append($rUpbutton);
                     	$tr.append($rDebutton);
                     	}
                     $tableBody.append($tr);
                     num++;
                  }
               }else{
                  $tr = $("<tr id='re'>");
                  $rContent = $("<td colspan = '3'>").text("등록된 댓글이 없습니다.");
                  $tr.append($rContent);
                  $tableBody.append($tr);
               }
            }
            
         });
      }
      
      // 댓글 등록
      $("#rSubmit").on("click" , function(){
          var rContent = $("#rContent").val();
          var refBid = ${ board.bo_number };
          
          $.ajax({
             url : "addReply.bo" ,
             data : {rContent : rContent , refBid : refBid} ,
             type : "post" ,
             success : function(data){
                if(data == "success"){
                   getReplyList();
                   $("#rContent").val("");
                }
             }
          });
       })
       
       // 댓글 삭제
       function fn_deleteReply(rId){
		var rId = {"rId": rId};

		$.ajax({
			url: "rDelete.bo",
			data : rId ,
			type : 'POST' ,
			success: function(result){
				getReplyList();
				} 
			});
		}
      
        // 댓글 수정 창
       function fn_editReplyView(contentId, rId){
    	   
    	   var htmls = "";                                                                                                         
		   htmls +='<td>'
		   htmls +='   <textarea rows = "2" cols = "20" id ="rUpContent"></textarea>'
		   htmls +='</td>'
		   htmls +='<td>'
		   htmls +='<a href="javascript:void(0)" class="btn-gradient mini blue" onclick="fn_updateReply(' + rId + ')">저장</a>';
		   htmls +='</td>'
           
		   var $rUpinput = htmls;
    	   
    	   $('#' + contentId.id).html($rUpinput);
       }

       // 댓글 수정
      function fn_updateReply(rId){
          var rContent = $("#rUpContent").val();
          
          $.ajax({
             url : "rUpdate.bo" ,
             data : {rContent : rContent , rId : rId} ,
             type : "post" ,
             success : function(data){
                if(data == "success"){
                   getReplyList();
                }
             }
          });
       }
       
   </script>
	<br><br>
	
	<p align="center">
		<button class="btn-gradient purple" onclick="location.href='index.jsp'">시작 페이지로 이동</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="btn-gradient purple" onclick="location.href='${ blist }'">게시판으로 가기</button>
	</p>
	
	</section>
	<!-- footer -->
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>