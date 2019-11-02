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
					<h2>비밀번호 찾기</h2>
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
				<div class="col-md-4"></div>

				<div class="col-md-4">
					<form role="form" class="contactform">
						<div class="form-group">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="학번을 입력해주세요" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="이메일을 입력해주세요" required>
						</div>
						<a class="btn btn-transparent"
							onclick="location='userpassword2.up2'">다음</a>
					</form>
				</div>
				<!-- end col -->

				<div class="col-md-4"></div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>