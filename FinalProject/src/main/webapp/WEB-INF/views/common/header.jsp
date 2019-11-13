<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


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
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<header class="header site-header">
		<div class="container">
			<nav class="navbar navbar-default yamm">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp"><img
							src="resources/images/logo.png" alt="Linda"></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="index.jsp">Home</a></li>
                           	<li><a href="selectList.bk?searchOption="+'title'+"&search="+' '">자료검색</a></li>
                           	<li><a href="">도서관 서비스</a></li>
                           	<li><a href="">도서관 안내</a></li>
                           	<li><a href="">마이라이브러리</a></li>
							<li class="dropdown yamm-fw hasmenu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">더보기 <span
									class="fa fa-angle-down"></span></a>
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">
												<div class="col-md-4">
													<ul>
														<li><a href="service-01.html">SEO Consultants</a></li>
														<li><a href="service-02.html">SEO Audits</a></li>
														<li><a href="service-03.html">SEO Packages & Plans</a></li>
														<li><a href="service-04.html">Web Copywriting</a></li>
														<li><a href="service-05.html">SEO Copywriting</a></li>
														<li><a href="service-06.html">Keyword Research</a></li>
														<li><a href="service-07.html">SEO Strategy</a></li>
														<li><a href="service-08.html">Website Design</a></li>
														<li><a href="requestBook.bk">도서 신청하기</a></li>
													</ul>
												</div>
												<div class="col-md-4">
													<ul>
														<li><a href="srDay.sr">스터디룸 조회</a></li>
		                                                <li><a href="">Pricing & Plans</a></li>
		                                                <li><a href="">Our Clients</a></li>
		                                                <li><a href="">Testimonials</a></li>
		                                                <li><a href="bslist.bs">중고서적 판매</a></li>
		                                                <li><a href="bList.bo">스터디룸 게시판</a></li>
		                                                <li><a href="bInsertView.bo">스터디룸 게시글 쓰기</a></li>
													</ul>
												</div>
												<div class="col-md-4">
													<ul>
														<li><a href="">Blog & News</a></li>
		                                                <li><a href="">Blog Alternative</a></li>
		                                                <li><a href="">Single Blog</a></li>
		                                                <li><a href="ninsertView.no">공지사항 작성</a></li>
		                                                <li><a href="nlist.no">공지사항</a></li>
		                                                <li><a href="myseatList.ss">나의 열람실</a></li>
		                                                <li><a href="">Contact Alternative</a></li>
		                                                <li><a href="">FAQ's Page</a></li>
		                                                <li><a href="">404 Not Found</a></li>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</li>
							<li>
								<div class="loginArea" align="right">
									<c:if test="${ empty sessionScope.loginUser }">
										<form action="userlogin.ul" method="post">
											<table id="loginTable" style="text-align:center;">
												<tr>
													<td>아이디</td>
													<td><input type="text" name="member_Id" style="background-color: lightblue; color: black"></td>
													<td rowspan="2">
														<button id="loginBtn" style="color: black;">로그인</button>
													</td>
												</tr>
												<tr>
													<td>비밀번호</td>
													<td><input type="password" name="member_Password" style="background-color: lightblue; color: black"></td>
												</tr>
												<tr>
													<td colspan="3">
														<button type="button" style="color: black;">아이디/비밀번호 찾기</button>
													</td>
													
													<td>
														<a href="login.ul">로그인</a>
														<a>/</a>
														<a href="userinformation.ui">회원정보수정</a>	
													</td>
												</tr>
											</table>
										</form>
									</c:if>
									<c:if test="${ !empty sessionScope.loginUser }"> 
										<tr>
											<td>
												<font color="black"> ${ loginUser.member_Name }님 환영합니다.</font>
											</td>
											<c:url var="myinfo" value="myinfo.me"/>
											<c:url var="logout" value="logout.me"/>
											<button style="color: black;" onclick="location.href='${myinfo}'">정보보기</button>
											<button style="color: black;" onclick="location.href='${logout}'">로그아웃</button>
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





</body>
</html>