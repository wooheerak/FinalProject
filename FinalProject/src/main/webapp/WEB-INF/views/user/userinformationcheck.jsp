<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>개인 정보 조회</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<!-- 메뉴바 -->
	<section class="section overfree" style="padding: 30px 0px;">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="col-md-3" style="border-radius: 30px;">
				<div class="pricing-box clearfix">
					<div class="pricing-header firstch">
						<h4>개인 정보 조회</h4>
					</div>
					<!-- end pricing-header -->

					<!-- end pricing-top -->
					<div class="pricing-details" style="text-align: center;">
						<div class="menuContent">내 정보 조회</div>
						<div class="menuContent">대출 내역 조회</div>
						<div class="menuContent">열람실/스터디룸 이용내역 조회</div>
						<div class="menuContent">도서 신청 조회</div>
						<div class="menuContent">BOOKSALES<br>거래 내역</div>
					</div>
					<!-- end pricing-details -->
				</div>
				<!-- end pricing-box -->
			</div>

			<div class="container col-md-7">
				<form id="boardForm" name="boardForm" method="post">
					<h2>회원정보조회</h2>
					<table class="table">
						<thead>
							<tr>
								<td>학번</td>
								<td><input type="text" class="form-control" id="id"
									name="id" placeholder="151113" required></td>
							</tr>
							<tr>
								<td>성명</td>
								<td><input type="text" class="form-control" id="name"
									name="name" placeholder="정우민" required></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" class="form-control" id="number"
									name="number" placeholder="111212" required></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" class="form-control" id="email"
									name="email" placeholder="losix0504@naver.com" required></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" class="form-control" id="phone"
									name="phone" placeholder="01051547252" required></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" class="form-control" id="address"
									name="address" placeholder="경기도 구리시 인창동 건영아파트" required></td>
							</tr>
						</thead>
					</table>
					<a class="btn btn-transparent"
						onclick="location='userpassword2.up2'">회원정보수정</a>
				</form>
			</div>
			<div class="container col-md-2">
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>