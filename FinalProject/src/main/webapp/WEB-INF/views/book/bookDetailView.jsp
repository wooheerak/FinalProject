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
      
      <div class="container">
				<div class="row case-single">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="pitem">
							<div class="case-box">
								<img src="resources/upload/case_03.png" alt="" class="img-responsive">
							</div><!-- end case-box -->
						</div><!-- end pitem -->
					</div><!-- end col -->

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="case-details">
							<h3>WP Servis <small>SEO / SEM</small></h3>
							<p> Integer nec velit pellentesque justo ornare tempus eleifend non velit. Aenean est justo, auctor in tincidunt non, mattis a urna. Phasellus ligula justo, posuere vitae dignissim et, porta nec dui. Proin vel dignissim dui. Etiam quis urna odio. Nunc dignissim rutrum condimentum. Praesent volutpat magna risus, in molestie orci tempor eget. Morbi eleifend commodo odio feugiat malesuada. </p>
							<p>Etiam quis urna odio. Nunc dignissim rutrum condimentum. Praesent volutpat magna risus, in molestie orci tempor eget. Morbi eleifend commodo odio feugiat malesuada. </p>
							<a href="#" class="btn btn-transparent btn-lg"><i class="fa fa-file-pdf-o"></i> Download PDF</a>
						</div><!-- end details -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
   </section>
   
   <section class="section lb">
			<div class="container">
				<div class="row case-single">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="pitem">
							<div class="case-box">
								<img src="resources/upload/case_03.png" alt="" class="img-responsive">
							</div><!-- end case-box -->
						</div><!-- end pitem -->
					</div><!-- end col -->

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="case-details">
							<h3>WP Servis <small>SEO / SEM</small></h3>
							<p> Integer nec velit pellentesque justo ornare tempus eleifend non velit. Aenean est justo, auctor in tincidunt non, mattis a urna. Phasellus ligula justo, posuere vitae dignissim et, porta nec dui. Proin vel dignissim dui. Etiam quis urna odio. Nunc dignissim rutrum condimentum. Praesent volutpat magna risus, in molestie orci tempor eget. Morbi eleifend commodo odio feugiat malesuada. </p>
							<p>Etiam quis urna odio. Nunc dignissim rutrum condimentum. Praesent volutpat magna risus, in molestie orci tempor eget. Morbi eleifend commodo odio feugiat malesuada. </p>
							<a href="#" class="btn btn-transparent btn-lg"><i class="fa fa-file-pdf-o"></i> Download PDF</a>
						</div><!-- end details -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
   <!-- end section -->

   <jsp:include page="../common/footer.jsp" />

</body>

</html>