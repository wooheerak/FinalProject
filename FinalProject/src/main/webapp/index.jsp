<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyHub.lib</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body style="overflow-X: hidden">

	<c:import url="WEB-INF/views/common/header.jsp"></c:import>

	<!-- 검색바 -->
	<div class="" style="background-color: white;">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
				<form action="selectList.bk" class="calculateform"
					style="height: 120px; padding-top: 33px; background-color: rgb(19, 19, 94);">
					<div class="dorpdown dropdown" style="display: flex;">
               			<SELECT name='searchOption'>
                  			<!-- 검색 컬럼 -->
			                  <OPTION value='title'>제목 검색</OPTION>
			                  <OPTION value='author'>저자 검색</OPTION>
			                  <OPTION value='publisher'>출판사 검색</OPTION>
			                  <OPTION value='ISBN'>ISBN 검색</OPTION>
			               </SELECT>
						&nbsp;&nbsp; 
						<input type="text" class="form-control"
							id="searchbar" name="search" style="height: 49.33px; width: 450px;"
							placeholder="검색어를 입력하세요">
						&nbsp;&nbsp; <input
							type="submit" name="send" value="검색" class="btn btn-default"
							style="height: 49.33px; width: 150px;" />
					</div>
				</form>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- 검색바 -->

	<section class="section nopad">
		<div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-3 col-sm-6 nopad first">
					<div class="home-service c1" style="background-color: #dfe8ea;">
						<i class="flaticon-competition"></i>
						<p>대출/연장</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad">
					<div class="home-service c2" style="background-color: #dfe8ea;">
						<i class="flaticon-chat"></i>
						<p>자료 요청</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad">
					<div class="home-service c3" style="background-color: #dfe8ea;"
						onclick="location.href='studymain.ss'">
						<i class="flaticon-medal"></i>
						<p>열람실/스터디룸</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad last">
					<div class="home-service c4" style="background-color: #dfe8ea;">
						<i class="flaticon-medal"></i>
						<p>시설 안내</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<!-- 신착도서 -->
	<section class="section bt">
		<div class="container  text-center">
			<div style="width: 330px;">
				신착도서
				<div class="owl-carousel owl-theme lightcasestudies withhover">
					<div class="item-carousel">
						<div class="case-box ">
							<img src="resources/sale_books/FASHION.PNG " alt=" "
								class="img-respive">
							<div class="magnifier ">
								<a href="case-studies-single.html "><i class="fa fa-link "></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel ">
						<div class="case-box ">
							<img src="resources/sale_books/JAVA.PNG " alt=" "
								class="img-responsive ">
							<div class="magnifier ">
								<a href="case-studies-single.html "><i class="fa fa-link "></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel ">
						<div class="case-box ">
							<img src="resources/sale_books/기술경영.PNG" alt=" "
								class="img-responsive ">
							<div class="magnifier ">
								<a href="case-studies-single.html "><i class="fa fa-link "></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel ">
						<div class="case-box ">
							<img src="resources/sale_books/수치해석.PNG" alt=" "
								class="img-responsive ">
							<div class="magnifier ">
								<a href="case-studies-single.html "><i class="fa fa-link "></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel ">
						<div class="case-box ">
							<img src="resources/sale_books/FASHION.PNG" alt=" "
								class="img-responsive ">
							<div class="magnifier ">
								<a href="case-studies-single.html "><i class="fa fa-link "></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->

	<c:import url="WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>