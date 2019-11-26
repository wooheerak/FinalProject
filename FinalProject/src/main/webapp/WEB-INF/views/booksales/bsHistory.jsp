<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.FinalProject.book.model.vo.BookReservation, java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 거래내역</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
</head>
<script type="text/javascript">
jQuery(function($) {
	$("#bs").DataTable({
         // 표시 건수기능 숨기기
         "lengthChange" : true,
         // 정보 표시 숨기기
         "info" : true,
		 "ordering": false ,
		 "filter" : false ,
		 "lengthChange" : false , 
           // 정렬
            "order": [],
            
         // 페이지 넘기는 방식
         pagingType : "full_numbers",

         // n번째 항목 넓이를 300px로 설정
         columnDefs : [ {
            targets : 0,
            width : 300
         }, {
            targets : 1,
            width : 300
         } ],

         "language" : {
            "emptyTable" : "데이터가 없어요.",
            "lengthMenu" : "페이지당 _MENU_ 개씩 보기",
            "info" : "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty" : "데이터 없음",
            "infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
            "search" : "검색: ",
            "zeroRecords" : "일치하는 데이터가 없어요.",
            "loadingRecords" : "로딩중...",
            "processing" : "잠시만 기다려 주세요...",
            "paginate" : {
               "next" : ">",
               "previous" : "<" , 
               "last" : ">>" ,
               "first" : "<<" 
            	  
            }
         }
   
	});
});
</script>	
<body>



	<c:import url="../common/header.jsp"></c:import>

	<div id="wrapper">


		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>개인 정보 조회</h2>
						<p class="lead">중고서적 거래내역</p>
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
			<div class="col-md-2"
				style="margin-left: 50px; border-radius: 30px; diplay: inline;">
				<div class="pricing-box clearfix">
					<div class="pricing-header firstch">
						<h4>도서 관리</h4>
					</div>
					<!-- end pricing-header -->

					<!-- end pricing-top -->
					<div class="pricing-details" style="text-align: center;">
						<ul>
							<div class="menuContent" focusable="true"
								onclick="location.href='userinformationcheck.ul'">내 정보 조회</div>
							<div class="menuContent" focusable="true"
								onclick="location.href='borrowBookList.bk'">대출 내역 조회</div>
							<div class="menuContent" focusable="true"
								onclick="location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
							<div class="menuContent" focusable="true"
								onclick="location.href='selectRequestBook.bk'">도서 신청 조회</div>
							<div class="menuContent" focusable="true"
								onclick="location.href='bsHistory.bs'">
								BOOKSALES<br>거래 내역
							</div>
							<div class="menuContent" focusable="true"
								onclick="location.href='reservationBookView.bk'">도서 예약 내역</div>
						</ul>
					</div>
					<!-- end pricing-details -->
				</div>
				<!-- end pricing-box -->
			</div>

			<!-- 공지사항 -->
			<div class="container col-md-8 col-sm-12" style="margin-left: 20px;">
				<br> <br>
				<hr>
				<form id="boardForm" name="boardForm" method="post">

					<table id="bs" class="table table-striped table-hover"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">도서 제목</th>
								<th style="text-align: center;">가격</th>
								<th style="text-align: center;">거래 날짜</th>
								<th style="text-align: center;">거래 유형</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bs" items="${ bsList }">
								<tr>
									<td>${ bs.bName }</td>
									<td>${ bs.bPrice } 원</td>
									<td>${ bs.bsDate }</td>
									
									<c:if test='${ bs.bsStatus eq "s" }'>
										<td><font color="red"><b>판매</b></font></td>
									</c:if>
									
									<c:if test='${ bs.bsStatus eq "b" }'>
										<td><font color="blue"><b>구매</b></font></td>
									</c:if>
								</tr>
							</c:forEach>

						</tbody>
					</table>


				</form>
			</div>



		</section>
		<!-- end section -->
	</div>
	<div style="width: 100%; height: 200px; background-color: white;">

	</div>
	<jsp:include page="../common/footer.jsp" />

</body>

</html>
