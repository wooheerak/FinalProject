<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 판매</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
			<div class="col-md-12" style="padding-top: 30px;">
				<div>
					<b style="font-size: 30px; margin-left: 60px;">수치해석</b>
				</div>
				<hr>
				<div class="col-md-3 text-center">
					<img alt="" src="resources/sale_books/수치해석.PNG">
				</div>
				<div class="col-md-9">
					<div style="display:flex;">
						<b>저자 |</b>&nbsp;<p>이수진</p>&nbsp;&nbsp;<b>출판사 |</b>&nbsp;<p>KH도서</p>&nbsp;&nbsp;
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->

	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>
</html>