<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
.lButton {
	background-color: #00529c;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 400px;
	margin-top : 40px;
}

</style>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>

		<c:import url="../common/header.jsp"></c:import>
		
		<section class="section">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-12 notfound">
						<p class="lead" style = "font-size : 60px;">Error</p>
						<p class="lead" style = "color : black; font-size : 30px;">${ message }</p>
						
						
						<button class="lButton" type="button" onclick = 'location.href="index.do"'>메인으로</button>
					</div><!-- end notfound -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
		
		<jsp:include page="../common/footer.jsp" />
</body>
</html>