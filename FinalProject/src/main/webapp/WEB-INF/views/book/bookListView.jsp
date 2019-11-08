<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#book').DataTable( {
    });
   });
</script>
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
         <form action="selectList.bk" class="calculateform"
            style="padding-bottom: 35px; background-color: lightblue;">

            <div class="dorpdown dropdown portfolio-filter"
               style="display: flex;">
               <SELECT name='searchOption'>
                  <!-- 검색 컬럼 -->
                  <OPTION value='title'>제목 검색</OPTION>
                  <OPTION value='author'>저자 검색</OPTION>
                  <OPTION value='publisher'>출판사 검색</OPTION>
                  <OPTION value='ISBN'>ISBN 검색</OPTION>
               </SELECT>&nbsp;&nbsp; 
               <input type="text" class="form-control" id="searchbar"
                  name="search" style="height: 49.33px;" placeholder="검색어를 입력하세요">&nbsp;&nbsp;
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
      
   <section class="section" style="padding:0px;">
         <div class="container" id="bookList">
            <div class="row" style = " margin-left : -160px;">
            
			<c:forEach var="b" items="${ list }">
               <div class="col-md-6" >
                  <div class="ebook-details row" >
                     <div class="col-md-3">
                        <img src="resources/upload/${b.bIMG }" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>${b.bMainCTG }</small>
                           <h3>${b.bName }</h3>
                           <p>저자 : ${b.bWriter } &nbsp;&nbsp;&nbsp; 출판 : ${b.bPublisher }&nbsp;&nbsp;&nbsp; <br>
                           	언어 : ${b.bLanguage } </p>
                           <a href="detailView.bk" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->             
			</c:forEach>
               <div class="col-md-6" >
                  <div class="ebook-details row" >
                     <div class="col-md-3">
                        <img src="resources/upload/book_01.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>자연 과학</small>
                           <h3>아저씨</h3>
                           <p>이거 방탄유리야 이 개XX야~ / 아직한발 남았따...</p>
                           <a href="detailView.bk" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_02.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>WordPress SEO</h3>
                           <p>Learn more about WordPress search engine optimization (tips, tricks and plugins)</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_03.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>Google Tricks</h3>
                           <p>Would you like to go up in a week on Google search engine? This book is for your website.</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_04.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>Search Engine Marketing</h3>
                           <p>SEM was once was used as an umbrella term to encompass both SEO and paid search activities. </p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_05.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>SEO for Beginners</h3>
                           <p>Are you new to search engine? In this book I have given you some tips. This is useful ebook.</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_06.png" alt="" class="img-responsive">
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
                        <img src="resources/upload/book_02.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>Why WordPress Best</h3>
                           <p>In this ebook, you can learn why WordPress is one of the best SEO friendly content management system.</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_01.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>High Rank SEO</h3>
                           <p>This ebook ideal for professionals. You can make more powerful website SEO with our tips and tricks.</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->


               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_04.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>Blogger SEO</h3>
                           <p>Blogger is a most popular free blog source on the web. In the ebook we teach you blog seo.</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
               </div><!-- end col -->

               <div class="col-md-6">
                  <div class="ebook-details row">
                     <div class="col-md-3">
                        <img src="resources/upload/book_03.png" alt="" class="img-responsive">
                     </div>
                     <div class="col-md-9">
                        <div class="book-details">
                           <small>Free</small>
                           <h3>Affiliate Marketing</h3>
                           <p>If you are an affiliate marketer this ebook ideal for you. With SEO plus affiliate make more..</p>
                           <a href="#" class="btn btn-transparent">상세 보기</a>
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
   
   <script>
   		function 
   </script>
   


</body>

</html>