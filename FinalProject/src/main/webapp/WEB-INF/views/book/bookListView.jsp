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
	
	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>도서 검색</h2>
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
			<form class="calculateform"
				style="padding-bottom: 35px; background-color: lightblue;">

				<div class="dorpdown dropdown portfolio-filter"
					style="display: flex;">
					<SELECT name='col'>
						<!-- 검색 컬럼 -->
						<OPTION value='0'>카테고리 선택</OPTION>
						<OPTION value='1'>경상계열</OPTION>
						<OPTION value='2'>인문/사회계열</OPTION>
						<OPTION value='3'>공학계열</OPTION>
						<OPTION value='4'>어학계열</OPTION>
						<OPTION value='5'>법학계열</OPTION>
						<OPTION value='6'>의학/약학계열</OPTION>
						<OPTION value='7'>사법계열</OPTION>
						<OPTION value='8'>예체능계열</OPTION>
						<OPTION value='9'>기타</OPTION>
					</SELECT>&nbsp;&nbsp; <input type="text" class="form-control" id="searchbar"
						name="url" style="height: 49.33px;" placeholder="검색어를 입력하세요">&nbsp;&nbsp;
					<input type="submit" name="send" value="검색" class="btn btn-default" />
				</div>
			</form>
		</div>
	</section>

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


		<div class="row">
			<div class="col-md-6">
				<div class="ebook-details copybox row">
					<div class="col-md-4" style="heigt: 200px; width: 150px;">
						<img src="resources/upload/copy_01.png" alt=""
							class="img-responsive">
					</div>
					<div class="col-md-8">
						<div class="book-details">
							<small>Premium Articles</small>
							<h3>Recent Blog Articles</h3>
							<p>Proin finibus nisi nibh, ac tempus ligula aliquet in. Nam
								sed elit facilisis, tempus erat et, dictum orci. Fusce vehicula
								arcu eget cursus orci aliquam.</p>
							<a href="#" class="btn btn-transparent">View All</a>
						</div>
						<!-- end details -->
					</div>
					<!-- end col -->
				</div>
				<!-- end ebook-details -->
			</div>
			<!-- end col -->

			<div class="col-md-6">
				<div class="ebook-details copybox row">
					<div class="col-md-4" style="heigt: 200px; width: 150px;">
						<img src="resources/upload/copy_02.png" alt=""
							class="img-responsive">
					</div>
					<div class="col-md-8">
						<div class="book-details">
							<small>Free Sources</small>
							<h3>Download Example Papers</h3>
							<p>Vestibulum massa dolor, laoreet quis laoreet sit amet,
								ornare vitae odio. Nullam vulputate suscipit sem sed tristique.
								Ut auctor vel nunc ac congue.</p>
							<a href="#" class="btn btn-transparent">Download</a>
						</div>
						<!-- end details -->
					</div>
					<!-- end col -->
				</div>
				<!-- end ebook-details -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>