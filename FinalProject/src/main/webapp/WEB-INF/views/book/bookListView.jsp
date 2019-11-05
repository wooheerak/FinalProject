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

	<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_01.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Learning SEO</h3>
									<p>You are not late to learn SEO. Here is the simplest and most practical way for you!</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_02.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>WordPress SEO</h3>
									<p>Learn more about WordPress search engine optimization (tips, tricks and plugins)</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_03.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Google Tricks</h3>
									<p>Would you like to go up in a week on Google search engine? This book is for your website.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_04.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Search Engine Marketing</h3>
									<p>SEM was once was used as an umbrella term to encompass both SEO and paid search activities. </p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_05.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>SEO for Beginners</h3>
									<p>Are you new to search engine? In this book I have given you some tips. This is useful ebook.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_06.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>ECommerce SEO</h3>
									<p>Take advantage of seo to earn higher revenue from your e-commerce sites and make more money.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_02.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Why WordPress Best</h3>
									<p>In this ebook, you can learn why WordPress is one of the best SEO friendly content management system.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_01.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>High Rank SEO</h3>
									<p>This ebook ideal for professionals. You can make more powerful website SEO with our tips and tricks.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->


					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_04.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Blogger SEO</h3>
									<p>Blogger is a most popular free blog source on the web. In the ebook we teach you blog seo.</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->

					<div class="col-md-6">
						<div class="ebook-details row">
							<div class="col-md-3">
								<img src="upload/book_03.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-9">
								<div class="book-details">
									<small>Free</small>
									<h3>Affiliate Marketing</h3>
									<p>If you are an affiliate marketer this ebook ideal for you. With SEO plus affiliate make more..</p>
									<a href="#" class="btn btn-transparent">Download</a>
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->	

		
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>