<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>

	<section class="section" style="padding-top: 10px;">
		<div class="col-md-2" style="margin-left: 135px; border-radius: 30px;">
			<div class="pricing-box clearfix">
				<div class="pricing-header firstch">
					<h4>개인 정보 조회</h4>
				</div>
				<div class="pricing-details" style="text-align: center;">
					<div class="menuContent">내 정보 조회</div>
					<div class="menuContent">대출 내역 조회</div>
					<div class="menuContent">열람실/스터디룸 이용내역 조회</div>
					<div class="menuContent">도서 신청 조회</div>
					<div class="menuContent">BOOKSALES<br>거래 내역</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->
	
	<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<small>We Blend Stellar Copywriting with a </small>
					<h3>Personalized Content Strategy</h3>
					<hr>
					<p class="lead">From headlines to calls to action on your landing pages, compelling copy is necessary across all platforms that your company engages in to convey a brand personality that connects with your target audience.</p>
				</div><!-- end section-title -->

				<div class="row">
					<div class="col-md-6">
						<div class="ebook-details copybox row">
							<div class="col-md-4">
								<img src="upload/copy_01.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-8">
								<div class="book-details">
									<small>Premium Articles</small>
									<h3>Recent Blog Articles</h3>
									<p>Proin finibus nisi nibh, ac tempus ligula aliquet in. Nam sed elit facilisis, tempus erat et, dictum orci. Fusce vehicula arcu eget cursus orci aliquam. </p>
									<a href="#" class="btn btn-transparent">View All</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details copybox row">
							<div class="col-md-4">
								<img src="upload/copy_02.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-8">
								<div class="book-details">
									<small>Free Sources</small>
									<h3>Download Example Papers</h3>
									<p>Vestibulum massa dolor, laoreet quis laoreet sit amet, ornare vitae odio. Nullam vulputate suscipit sem sed tristique. Ut auctor vel nunc ac congue. </p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>