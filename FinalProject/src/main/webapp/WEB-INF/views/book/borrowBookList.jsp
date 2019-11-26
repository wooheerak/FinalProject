<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.FinalProject.book.model.vo.BookReservation, java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 예약현황</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	jQuery(function($) {
		$("#tb").DataTable({
			// 표시 건수기능 숨기기
			"lengthChange" : true,
			// 정보 표시 숨기기
			"info" : true,

			  // 정렬
            "order": [],
            
			// 페이지 넘기는 방식
			pagingType : "full_numbers",

			// n번째 항목 넓이를 300px로 설정
			columnDefs : [ {
				targets : 0,
				width : 40
			}, {
				targets : 1,
				width : 300
			} ],

			"language" : {
				"emptyTable" : "데이터가 없습니다.",
				"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "검색: ",
				"zeroRecords" : "일치하는 데이터가 없습니다.",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			}
		});
	});
</script>
</head>
<style>
.dataTables_wrapper {
	float:left;
	/* margin: auto; */
	width: 100% !important;
	min-height: 600px;
	display:inline;
}
</style>
<body>



	<c:import url="../common/header.jsp"></c:import>

		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>도서 관리 페이지</h2>
						<p class="lead">예약 도서 관리</p>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<!-- 메뉴바 -->
		<section class="section">
				<div class="col-md-2" style="margin-left: 50px; border-radius: 30px; diplay:inline;">
					<div class="pricing-box clearfix">
						<div class="pricing-header firstch">
							<h4>도서 관리</h4>
						</div>
						<!-- end pricing-header -->
	
						<!-- end pricing-top -->
						<div class="pricing-details" style="text-align: center;">
							<ul>
								<div class="menuContent" focusable="true" onclick="location.href='userinformationcheck.ul'">내 정보 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='borrowBookList.bk'">대출 내역 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='selectRequestBook.bk'">도서 신청 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='bsHistory.bs'">BOOKSALES<br>거래 내역</div>
								<div class="menuContent" focusable="true" onclick="location.href='reservationBookView.bk'">도서 예약 내역</div>
							</ul>
						</div>
						<!-- end pricing-details -->
					</div>
					<!-- end pricing-box -->
				</div>
				
				<!-- 테이블 -->
	<!-- 	<section> 도서번호 도서제목 도서 작가, 대출날짜 ,반납 날짜, 대출현황(대출 중, 반납완료), 
대출 중 시 도서 연장버튼 생성-->
	<div class="col-md-9" style="margin-left: 30px; border-radius: 30px; diplay:inline;">
			<table id="tb" class="table" style="clear:none; diplay:inline;">
		        <thead align="center">
		            <tr>
		            	<th>도서 번호</th>
		            	<th>도서 제목</th>
		            	<th>저 자</th>
		            	<th>대출 날짜</th>
		            	<th>반납 날짜</th>
		            	<th>대출 현황</th>
		            	<th></th>
		            	<th></th>
		          	</tr>
		        </thead>
		
		        <tbody>
		            <c:forEach var="r" items="${ list }">
		            	<c:url var="extension" value="extensionBook.bk">
							<c:param name="br_no" value="${ r.br_no }"/>
						</c:url>
						<c:url var="returnBook" value="returnBook.bk">
							<c:param name="br_no" value="${ r.br_no }"/>
							<c:param name="b_no" value="${ r.book.bNo }"/>
						</c:url>
			            <tr>
			            	<td>${ r.br_no }</td>
			            	<td>${ r.book.bName }</td>
			            	<td>${ r.book.bWriter }</td>
			            	<td>${ r.br_date }</td>
			            	<td>${ r.br_return_date }</td>
			            	<td>
			            		<c:if test="${r.br_status eq 'N' }">
				            		<p>대출 중</p>
				            	</c:if>
				            	<c:if test="${r.br_status eq 'E' }">
				            		<p>기간 연장됨</p>
				            	</c:if>
				            	<c:if test="${r.br_status eq 'Y' }">
				            		<p>반납 완료</p>
				            	</c:if>
				            	<c:if test="${r.br_status eq 'O' }">
				            		<p style="color: red;">연체 중</p>
				            	</c:if>
			            	</td>
			            	<td>
			            		<c:if test="${r.br_status eq 'N' }">
				            		<input id="" type="button" onclick="document.getElementById('id01').style.display='block'" value="연장하기" style="background-color: white; color: black; border: 2px solid blue;"/>&nbsp;
				            	</c:if>
			            	</td>
			            	<td>
			            		<c:if test="${r.br_status ne 'Y' }">
			            			<input type="button" onclick="location.href = '${returnBook}'" value="반납하기" style="background-color: white; color: black; border: 2px solid green;"/>
			            		</c:if>
			            	</td>
			            </tr>
		            </c:forEach>
		        </tbody>
		    </table>	
		    </div>	
		</section>
	<!-- </section> -->
		<!-- end section -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content" style="width: 400px; height: 300px;">
			<div class="w3-container"
				style="margin-top: 160px; width: 400px; height: 300px;">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright"
					style="width: 10px; heigth: 10px;">&times;</span> <br>
				<br> <b>&nbsp;&nbsp;연장하기 기능은 현재 시간으로부터 3일의 시간이 연장되며 한 번만 가능합니다.<br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;
				 대출한 도서를 연장하시겠습니까.</b> <br>
				<br>
				<hr>
				<button onclick="location.href = '${extension}'" class="w3-button w3-blue" style="margin-bottom:-45px; margin-left:60px; border-radius: 10px; ">연장하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="w3-button w3-blue" style="margin-bottom:-45px; margin-left:60px; border-radius: 10px;"
				onclick="document.getElementById('id01').style.display='none'">취 소</button>
			</div>
		</div>
	</div>

	
	<jsp:include page="../common/footer.jsp" />	

</body>

</html>
