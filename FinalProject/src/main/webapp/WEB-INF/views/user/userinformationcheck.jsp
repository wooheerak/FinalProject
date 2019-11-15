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
					<h2>회원 정보 조회</h2>
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
					<form role="form" class="contactform" action="userUpdate.ul">
						<div class="form-group">
							<p>학번</p>
							<input type="text" class="form-control" name="member_number" readonly value="${ loginUser.member_Id }" style="background: rightgray;">
						</div>
						<div class="form-group">
							<p>이름</p>
							<input type="text" class="form-control" name="member_name" readonly value="${ loginUser.member_Name }" style="background: rightgray;">
						</div>
						<div class="form-group">
							<p>비밀번호</p>
							<input type="text" class="form-control" name="mamber_password" readonly value="${ loginUser.member_Password }" style="background: rightgray;">
						</div>
						<div class="form-group">
							<p>핸드폰 번호</p>
							<input type="text" class="form-control" name="Phone" readonly value="${ loginUser.phone }" style="background: rightgray;">
						</div>
						<div class="form-group">
							<p>이메일</p>
							<input type="text" class="form-control" name="member_Email" readonly value="${ loginUser.member_Email }" style="background: rightgray;">
						</div>
						<div class="form-group">
							<p>주소</p>
							<input type="text" class="form-control"	name="address" readonly value="${ loginUser.address }" style="background: rightgray;"/>
						</div>
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