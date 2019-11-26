<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 판매</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table td {
	padding: 20px;
}

table th {
	padding: 20px;
}
</style>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>중고 서적 판매</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->



	<section class="section overfree" style="padding: 30px 0px;">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">

			<div class="col-md-12 text-center" style="padding-top: 30px;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<hr>
					<table
						style="height: 200px; width: 100%; border: 1px solid lightgray;">
						<tr>
							<td><b>결제완료</b></td>
						</tr>
						<tr>
							<td>결제가 완료되었습니다.</td>
						</tr>
					</table>
					<hr>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-12 text-center">
					<!-- Large modal -->
					<a href="bslist.bs" class="btn btn-transparent">목록</a>
				</div>
			</div>
		</div>

	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>
</html>