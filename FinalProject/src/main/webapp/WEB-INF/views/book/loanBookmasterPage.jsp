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
	<!-- 	<section> -->
	<div class="col-md-9" style="margin-left: 30px; border-radius: 30px; diplay:inline;">
			<table id="tb" class="table" style="clear:none; diplay:inline;">
		        <thead align="center">
		            <tr>
		            	<th>대출 번호</th>
		            	<th>대출자 아이디</th>
		            	<th>도서 번호</th>
		            	<th>도서 제목</th>
		            	<th>저 자</th>
		            	<th>대출 날짜</th>
		            	<th>만료 날짜</th>
		            	<th>도서 상태</th>
		          	</tr>
		        </thead>
		
		        <tbody>
		            <c:forEach var="r" items="${ list }">
		            <tr>
		            	<td>${ r.br_no }</td>
		            	<td>${ r.user_id }</td>
		            	<td>${ r.b_no }</td>
		            	<td>${ r.book.bName }</td>
		            	<td>${ r.book.bWriter }</td>
		            	<td>${ r.br_date }</td>
		            	<td>${ r.br_return_date }</td>
		            	<td>
		            		<c:if test="${r.br_status eq 'E' }">
								<p style="color: blue;">대출 중</p>
			            	</c:if>
			            	<c:if test="${r.br_status eq 'N' }">
			            		<p style="color: blue;">대출 중</p>
			            	</c:if>
			            	<c:if test="${r.br_status eq 'Y' }">
			            		<p>반납 완료</p>
			            	</c:if>
			            	<c:if test="${r.br_status eq 'O' }">
			            		<p style="color: red;">연체 중</p>
			            	</c:if>
		            	</td>
		            </c:forEach>
		        </tbody>
		    </table>	
		    </div>	
		</section>
	<!-- </section> -->
		<!-- end section -->
	<div style="width:100%; height:200px; background-color: white;"></div>
	
	
	
	<jsp:include page="../common/footer.jsp" />	


</body>

</html>
