<%@ page import="java.text.SimpleDateFormat"%>
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
						<p class="lead">대출 도서 관리</p>
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
								<div class="menuContent" focusable="true" onclick="location.href='requestBookMaster.bk'">신청 도서 관리</div>
								<div class="menuContent" focusable="true" onclick="location.href='reservationBookMaster.bk'">대출 예약 도서 관리</div>
								<div class="menuContent" focusable="true" onclick="location.href='loanBookMaster.bk'">대출 도서 관리</div>
								<div class="menuContent" focusable="true" onclick="location.href='bookManagement.bk'">도서 관리</div>
								<div class="menuContent" focusable="true" onclick="location.href=''">...</div>
							</ul>
						</div>
						<!-- end pricing-details -->
					</div>
					<!-- end pricing-box -->
				</div>
	<!-- 테이블 -->
	<div class="col-md-9" style="margin-left: 30px; border-radius: 30px; diplay:inline;">
			<table id="tb" class="table" style="clear:none; diplay:inline;">
		        <thead align="center">
		            <tr>
		            	<th>도서 번호</th>
		            	<th>도서 제목</th>
		            	<th>저 자</th>
		            	<th>출판사</th>
		            	<th>카테고리</th>
		            	<th>입고 날짜</th>
		            	<th>ISBN</th>
		            	<th>위 치</th>
		            	<th>도서 상태</th>
		            	<th></th>
		          	</tr>
		        </thead>
		
		        <tbody>
		            <c:forEach var="b" items="${ list }">
		            <c:url var="detailView" value="bookDetailViewMaster.bk">
						<c:param name="bno" value="${ b.bNo }"/>					
						<c:param name="isbn" value="${ b.bISBN }"/>					
					</c:url>
		            <tr>
		            	<td>${ b.bNo }</td>
		            	<td>${ b.bName }</td>
		            	<td>${ b.bWriter }</td>
		            	<td>${ b.bPublisher }</td>
		            	<td>${ b.bMainCTG }</td>
		            	<td>${ b.bIssueDate }</td>
		            	<td>${ b.bISBN }</td>
		            	<td>${ b.bLocation }</td>
		            	<td>
		            		<c:if test="${b.status eq 'R' }">
								<p style="color: blue;">대출 중</p>
			            	</c:if>
			            	<c:if test="${b.status eq 'N' }">
			            		<p style="color: red;">폐기 됨</p>
			            	</c:if>
			            	<c:if test="${b.status eq 'Y' }">
			            		<p>대출 가능</p>
			            	</c:if>
		            	</td>
		            	<td>
		            		<c:if test="${b.status ne 'N' }">
		            			<button onclick="location.href='${detailView}'" class="w3-button w3-white w3-border w3-round-large">상세 보기</button>
		            		</c:if>
		            		<c:if test="${b.status eq 'N' }">
		            			<p>폐기 됨</p>
		            		</c:if>
		            	</td>
		            </tr>
		            </c:forEach>
		        </tbody>
		    </table>	
		    </div>	
		    <c:url var="insertBook" value="insertBook.bk">
				</c:url>
				<button onclick="location.href='${insertBook}'" style="margin-left: 410px;"
				class="w3-button w3-white w3-border w3-round-large">도서 등록</button>	
		</section>
	<!-- </section> -->
		<!-- end section -->
	<div style="width:100%; height:200px; background-color: white;"></div>
	
	
	
	<jsp:include page="../common/footer.jsp" />	


</body>

</html>
