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

<body style="overflow-x: hidden">

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>중고서적 판매</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section overfree" style="padding: 30px 0px;" id="section1">
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

			<div class="dropdown portfolio-filter">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					&nbsp;&nbsp;&nbsp;정렬&nbsp;&nbsp;&nbsp; <span
						class="fa fa-angle-down"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a class="" href="#" data-filter="*">최신순</a></li>
					<li><a class="" href="#" data-filter=".cat1">낮은가격순</a></li>
					<li><a class="" href="#" data-filter=".cat2">높은가격순</a></li>
				</ul>
			</div>
			<!-- end dropdown -->

			<div class="row">
				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/수치해석.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>수치해석</h3>
							<p>22,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/FASHION.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[예체능계열]</small>
							<h3>FASHION DESIGN PLANNING</h3>
							<p>30,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/JAVA.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>자바 프로그래밍</h3>
							<p>15,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/기술경영.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[경상계열]</small>
							<h3>기술경영: 인간중심의 기술산업화</h3>
							<p>20,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->
				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/수치해석.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>수치해석</h3>
							<p>22,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/FASHION.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[예체능계열]</small>
							<h3>FASHION DESIGN PLANNING</h3>
							<p>30,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/JAVA.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>자바 프로그래밍</h3>
							<p>15,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/기술경영.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[경상계열]</small>
							<h3>기술경영: 인간중심의 기술산업화</h3>
							<p>20,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->
				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/수치해석.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>수치해석</h3>
							<p>22,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/FASHION.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[예체능계열]</small>
							<h3>FASHION DESIGN PLANNING</h3>
							<p>30,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/JAVA.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[공학계열]</small>
							<h3>자바 프로그래밍</h3>
							<p>15,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

				<div class="col-md-3 text-center">
					<div class="ebook-details">
						<div>
							<a href="booksalesdetail.bs"><img
								src="resources/sale_books/기술경영.PNG" alt="" class="center"></a>
						</div>
						<div style="margin-top: 10px;">
							<small>[경상계열]</small>
							<h3>기술경영: 인간중심의 기술산업화</h3>
							<p>20,000원</p>
							<a href="booksalesdetail.bs" class="btn btn-transparent ">구매</a>
						</div>
						<!-- end col -->
					</div>
					<!-- end ebook-details -->
				</div>
				<!-- end col -->

			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
		<div class="col-md-11 text-right">
			<a href="#section1"><i class="fa fa-sort-asc fa-2x" aria-hidden="true"></i></a>
		</div>
		
		<script>
			$(document).ready(function(){
			  // a 태그를 클릭시
			  $("a").on('click', function(event) {
			
			    // Make sure this.hash has a value before overriding default behavior
			    if (this.hash !== "") {
			      // Prevent default anchor click behavior
			      event.preventDefault();
			
			      // Store hash
			      var hash = this.hash;
			
			      // jQuery animate() 메소드를 사용해서 부드러운 스크롤 효과 만들기
			      // 설정 지역까지 이동하는 속도 설정(milliseconds)
			      $('html, section').animate({
			        scrollTop: $(hash).offset().top
			      }, 900, function(){
			   
			        // Add hash (#) to URL when done scrolling (default click behavior)
			        window.location.hash = hash;
			      });
			    } // End if
			  });
			});
		</script>
		
		<div class="pagination-wrapper row text-center ">
			<ul class="pagination col-md-12 ">
				<li class="active "><a href="# ">1</a></li>
				<li><a href="# ">2</a></li>
				<li><a href="# ">3</a></li>
				<li><a href="# ">4</a></li>
				<li><a href="# ">5</a></li>
			</ul>
		</div>
		<!-- ne dpagi -->


		<!-- 		<div class="pull-right">
			<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>
		</div> -->


		<!-- 		<script type="text/javascript">
			$(function() {
				$(".contentTR").mouseenter(function() {
					$(this).css({
						"color" : "black",
						"font-weight" : "bold",
						"cursor" : "pointer"
					});
				}).mouseout(function() {
					$(this).css({
						"color" : "gray",
						"font-weight" : "normal"
					});
				}).click(function() {
					var nId = $(this).children("td").eq(0).text();

					location.href = "bdetail.bo?nId=" + nId + "&page=" + $
					{
						pi.currentPage
					}
					;
				});
			});
		</script> -->
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>