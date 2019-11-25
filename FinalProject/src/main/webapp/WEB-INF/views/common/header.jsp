<%@page import="com.kh.FinalProject.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


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

</head>
<body>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<header class="header site-header">
		<div class="container">
			<nav class="navbar navbar-default yamm">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp"><img
							src="resources/images/logo.png" style="width: 120px;" /></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse"
						style="float: left; margin-left: 150px;">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="borrowBookList.bk">대출/연장</a></li>
							<li><a href="selectList.bk?searchOption="
								+'title'+"&search="+' '">도서검색</a></li>
							<li><a href="">도서관 서비스</a></li>
							<li><a href="">도서관 안내</a></li>
							<li><a href="">마이라이브러리</a></li>
							
							<li class="dropdown yamm-fw hasmenu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
								aria-haspopup="true" aria-expanded="false">더보기
								<span class="fa fa-angle-down"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">
												<div class="col-md-3">
													<ul>
														<li><a href="#" onclick="checkLogin3()">신청 목록</a></li>
														<li><a href="#" onclick="checkLogin4()">도서 신청하기</a></li>
														<%
															if (loginUser != null) {
																if (loginUser.getMember_Sep().equals("A")) {
														%>
														<li><a href="masterPage.bk">관리자 페이지</a></li>
														<%
															}
															}
														%>
													</ul>
												</div>
												<div class="col-md-3">
													<ul>
														<li><a href="srDay.sr">스터디룸 조회</a></li>
														<li><a href="myseatList.ss">나의 열람실</a></li>
														<li><a href="bList.bo">스터디룸 게시판</a></li>
													</ul>
												</div>
												<div class="col-md-3">
													<ul>
														<li><a href="bslist.bs">중고서적</a></li>
														<li><a href="bsinsertView.bs">중고서적 등록</a></li>
													</ul>
												</div>
												<div class="col-md-3">
													<ul>
														<li><a href="nlist.no">공지사항</a></li>
														<%
															if (loginUser != null) {
																if (loginUser.getMember_Name().equals("관리자")) {
														%>
														<li><a href="ninsertView.no">공지사항 작성</a></li>
														<%
															}
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</ul></li>
							<li>
								<div class="loginArea" align="right" style="margin-top: 12px;">
									<c:if test="${ empty sessionScope.loginUser }">
										<td colspan="2"><a style="cursor: pointer"
											onclick="location.href='loginForm.ul'">로그인</a></td>
									</c:if>
									<c:if test="${ !empty sessionScope.loginUser }">
										<tr>
											<td></td>
											<c:url var="myinfo" value="userinformationcheck.ul" />
											<c:url var="logout" value="logout.ul" />

											<td><a style="cursor: pointer"
												onclick="location.href='${myinfo}'"><b>${ loginUser.member_Name }</b>님&nbsp;정보보기/</a> <a
												style="cursor: pointer" onclick="location.href='${logout}'">로그아웃</a>
											</td>
										<tr>
									</c:if>

								</div>
							</li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
			</nav>
			<!-- end nav -->
		</div>
		<!-- end container -->
	</header>
	<!-- end header -->

	<!-- 수진쓰 추가부분 -->
	<script>
		function checkCookie() {
			/* location.href="cancelRC.ss?cancelId=" ;
			location.href="outSeatCoo.ss?outNo=" ; */
			$.ajax({
				url : "checkCookie.ss",
				success : function(data) {
					console.log(data);
					if (data.cName == "No") {
						if (data.sNo != 0) {
							if (data.cStatus == "cert") {
								location.href = "cancelRC.ss?cancelId="
										+ data.sNo;

							} else if (data.cStatus == "out") {
								location.href = "outSeatCoo.ss?outNo="
										+ data.sNo;

							}
						}
					}

				},
				error : function(data) {
					console.log(data);
				}
			});
		}

		$(function() {
			checkCookie();
			setInterval(function() {
				checkCookie();
			}, 5000);
		})
	</script>
	<!-- 요기까지 -->

	<!-- 동수파트 -->
	<script>
		window.onload = setInterval(function() {

			$.ajax({
				url : "checkBook.bk",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		}, 60000);
		
		// 신청 목록
		function checkLogin3(){
			var id = '${ loginUser.member_Name }';
				 
			if(id != ""){
				location.href="selectRequestBook.bk";
			}
			else{
				alert('로그인이 필요한 기능입니다.');
				location.href="loginForm.ul";
			}
		}
		
		// 신청 목록
		function checkLogin4(){
			var id = '${ loginUser.member_Name }';
				 
			if(id != ""){
				location.href="requestBook.bk";
			}
			else{
				alert('로그인이 필요한 기능입니다.');
				location.href="loginForm.ul";
			}
		}			
	</script>
	<!-- 요기까지 -->
</body>
</html>