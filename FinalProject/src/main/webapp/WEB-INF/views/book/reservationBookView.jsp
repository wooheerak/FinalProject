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

	<div id="wrapper">


		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>개인 정보 조회</h2>
						<p class="lead">도서 예약 관리</p>
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
						<h4>개인 정보 조회</h4>
					</div>
					<!-- end pricing-header -->

					<!-- end pricing-top -->
					<div class="pricing-details" style="text-align: center;">
						<ul>
							<!-- <span><i class="fa fa-check"></i></span> -->
							<div class="menuContent" focusable="true">내 정보 조회</div>
							<div class="menuContent" focusable="true">대출 내역 조회</div>
							<div class="menuContent" focusable="true" onclick="location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
							<div class="menuContent" focusable="true">도서 신청 조회</div>
							<div class="menuContent" focusable="true">
								BOOKSALES<br>거래 내역
							</div>
							<!-- <li>Sector and Competitor Analysis <span><i class="fa fa-check"></i></span></li> -->

						</ul>
					</div>
					<!-- end pricing-details -->

				</div>
				<!-- end pricing-box -->
			</div>

			<!-- 공지사항 -->
			<div class="container col-md-8 col-sm-12" style="margin-left: 20px;">
				<br>
				<br>
				<hr>
				<form id="boardForm" name="boardForm" method="post">

					<table class="table table-striped table-hover"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">도서 제목</th>
								<th style="text-align: center;">작 가</th>
								<th style="text-align: center;">예약 날짜</th>
								<th style="text-align: center;">만료 날짜</th>
								<th style="text-align: center;">대출 상황</th>
							</tr>
						</thead>
						<tbody>
							<%
								java.util.Date today = new java.util.Date();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
								String tt = sdf.format(today);
							%>
							<c:forEach var="r" items="${ list }">
								<tr>
									<td>${r.bName }</td>
									<td>${r.bWriter }</td>
									<c:set var="bvDate">
										<fmt:setLocale value="ko"/>
										<fmt:parseDate value="${r.bookReservation.BV_DATE }" pattern="yyyy/MM/dd HH:mm"/>
									</c:set>
									<c:set var="returnDate">
									    <fmt:setLocale value="ko"/>
										<fmt:parseDate value="${r.bookReservation.BV_RETURN_DATE }" pattern="yyyy/MM/dd HH:mm"/>
									</c:set>
									<td>${ r.bookReservation.BV_DATE }</td>
									<td>${ r.bookReservation.BV_RETURN_DATE }</td>
									<td>
										<c:set var="today" value="<%= tt %>" />
										<c:if test="${ today < r.bookReservation.BV_RETURN_DATE }">
											<c:set var="result" value="1" />
										</c:if> 
										<c:if test="${ today >= r.bookReservation.BV_RETURN_DATE }">
											<c:set var="result" value="0" />
										</c:if> 
										
										<c:if test="${result == 1 }">
											<p>대출 대기</p>
										</c:if> 
										<c:if test="${result == 0 }">
											<c:if test='${r.bookReservation.BV_STATUS == "N" }'>
												<p>기간 만료</p>
											</c:if>
											<c:if test='${r.bookReservation.BV_STATUS  == "R" }'>
												<p>대출 완료</p>
											</c:if>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			<!-- 페이징 처리 -->
			<table style="margin-left: 43%">
				<tr style="align: center; height: 20px;" id="buttonTab;">
					<td colspan="6">
					
						<!-- [이전] --> 
						<c:if test="${ pi.currentPage <= 1 }">
							[이전] &nbsp;
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="reservationBookView.bk">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>
		
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="reservationBookView.bk">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach> 
						
						<!-- [다음] --> 
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if> 
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="reservationBookView.bk">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>

				</form>
			</div>



		</section>
		<!-- end section -->
	</div>
	<div style="width:100%; height:200px; background-color: white;">
	
	</div>
	<jsp:include page="../common/footer.jsp" />

</body>

</html>
