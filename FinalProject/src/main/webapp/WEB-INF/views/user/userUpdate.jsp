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
					<h2>회원 정보 수정</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
				</div>

				<div class="col-md-5 text-left">
					<form role="form" class="contactform">
						<div class="form-group">
							<p>학번</p>
							<input type="text" class="form-control" id="student_number"
								name="student_number" placeholder="student_number" required>
						</div>
						<div class="form-group">
							<p>비밀번호</p>
							<input type="text" class="form-control" id="password"
								name="password" placeholder="password" required>
						</div>
						<div class="form-group">
							<p>핸드폰 번호</p>
							<input type="text" class="form-control" id="phone" name="phone"
								placeholder="Phone" required>
						</div>
						<div class="form-group">
							<p>주민등록번호</p>
							<input type="text" class="form-control" id="Personal_Number"
								name="Personal_Number" placeholder="Personal_Number" required>
						</div>
						<div class="form-group">
							<p>이메일</p>
							<input type="text" class="form-control" id="email" name="email"
								placeholder="email" required>
						</div>
						<div class="form-group">
							<p>주소</p>
							<input type="text" class="form-control" id="address"
								name="address" placeholder="address" required>
						</div>
						<a class="btn btn-transparent">회원 정보 수정</a> &nbsp;&nbsp;
						<a class="btn btn-transparent" onclick="location='userinformationcheck.ui'">회원 정보 조회</a>
					</form>
				</div>
				<!-- end col -->

				<div class="col-md-4">
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>