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
<style>
	#tb{margin: auto; width: 700px; border-collapse: collapse;}
	#tb tr td{padding: 5px;}
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body style="background-color: white;">
   <c:import url="../common/header.jsp"></c:import>
   
   <section class="section normalhead lb">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
               <h2>도서 검색</h2>
            </div><!-- end col -->
         </div><!-- end row -->
      </div><!-- end container -->
   </section><!-- end section -->

   <section class="section overfree" style="padding: 30px 0px;">
      <div class="icon-center">
         <i class="fa fa-code"></i>
      </div>
      <div class="container">
         <form action="selectList.bk" class="calculateform"
            style="padding-bottom: 35px; background-color: lightblue; background-color: rgba(0,82,156);" >
            <div class="dorpdown dropdown portfolio-filter"
               style="display: flex;">
               <SELECT name='searchOption'> <!-- 검색 컬럼 -->
                  <OPTION value='title'>제목 검색</OPTION>
                  <OPTION value='author'>저자 검색</OPTION>
                  <OPTION value='publisher'>출판사 검색</OPTION>
                  <OPTION value='ISBN'>ISBN 검색</OPTION>
               </SELECT>&nbsp;&nbsp; 
               <input type="text" class="form-control" id="search"
                  name="search" style="height: 49.33px;" placeholder="검색어를 입력하세요">&nbsp;&nbsp;
               <input type="submit" name="send" value="검색" class="btn btn-default" />
            </div>
         </form>
      </div>
   </section>

     
   <section class="section" style="padding:0px;">
         <div class="container" id="bookList">
            <div class="col-md-12" style="margin-left: 90px;">
            
			<c:forEach var="b" items="${ list }" varStatus="status" >
				<input type="hidden" name="bNo" value="${b.bNo }">
                  <div class="ebook-details row col-md-6">
                     <div class="col-md-3">
                        <img src="resources/BOOK_IMG/${b.bIMG }" alt="이미지 준비중" class="img-responsive">
                     </div>
                     <div class="col-md-8">
                        <div class="book-details">
                           <small>${b.bMainCTG }</small>
                           <h3>${b.bName}</h3>
                           <p>저자 : ${b.bWriter } &nbsp;&nbsp;&nbsp;/&nbsp; 출판 : ${b.bPublisher }&nbsp;&nbsp;&nbsp; <br>
                           	언어 : ${b.bLanguage } </p>
                           <a class="btn btn-transparent bClick">상세 보기
                           	<input type="hidden" name="bNo" value="${b.bNo }">
                           </a>
                        </div><!-- end details -->
                     </div><!-- end col -->
                  </div><!-- end ebook-details -->
				<c:if test="${status.count / 2 == 0}">
					<br>
				</c:if>
			</c:forEach>
			
            </div><!-- end row -->
         </div><!-- end container -->
      </section><!-- end section -->
      <br><br>
 		<!-- 페이징 처리 -->
		<table style="margin-left:43%; background-color: white;">
		<tr style="align:center; height:20px;" id="buttonTab;">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="selectList.bk">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="searchOption" value="${ searchOption }"/>						
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="selectList.bk">
							<c:param name="page" value="${ p }"/>
							<c:param name="search" value="${ search }"/>
							<c:param name="searchOption" value="${ searchOption }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="selectList.bk">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="searchOption" value="${ searchOption }"/>						
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>   

     <br><br><br><br>
     <br><br><br><br>
     <br><br><br><br>

   <!-- end section -->
	
   <jsp:include page="../common/footer.jsp" />
   
	<script type="text/javascript">
			$(".bClick").click(function(){
				var bNo=$(this).children("input").val();
				location.href="bookdetail.bk?bNo="+bNo+"&page="+${pi.currentPage};
			});
	</script>
</body>

</html>