<%@page import="java.text.SimpleDateFormat"%>
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
</head>

<body>



	<c:import url="../common/header.jsp"></c:import>

		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>도서 관리 페이지</h2>
						<p class="lead">도서 관리</p>
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
			<div class="col-md-2 col-sm-12 "
				style="margin-left: 135px; border-radius: 30px;">
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
		</section>
		<!-- end section -->
	<div style="width:100%; height:200px; background-color: white;"></div>
	<jsp:include page="../common/footer.jsp" />

</body>

</html>
