<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 신청현황</title>
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
						<p class="lead">도서 신청 관리</p>
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
							<div class="menuContent" focusable="true" onclick="location.href='borrowBookList.bk'">대출 내역 조회</div>
							<div class="menuContent" focusable="true" onclick="location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
							<div class="menuContent" focusable="true" onclick="location.href='selectRequestBook.bk'">도서 신청 조회</div>
							<div class="menuContent" focusable="true">
								BOOKSALES<br>거래 내역
							</div>
							<div class="menuContent" focusable="true" onclick="location.href='reservationBookView.bk'">
								도서 예약 내역
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
								<th style="text-align: center;">저 자</th>
								<th style="text-align: center;">ISBN</th>
								<th style="text-align: center;">신청 날짜</th>
								<th style="text-align: center;">요청 사항</th>
								<th style="text-align: center;">신청 현황</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${ list }">
								<c:url var="cancel" value="cancelRequset.bk">
									<c:param name="BQ_NO" value="${ r.BQ_NO }"/>					
								</c:url>  							
								<tr>
									<td>${r.BQ_NAME }</td>
									<td>${r.BQ_WRITER }</td>
									<td>${r.BQ_ISBN }</td>
									<td>${r.BQ_DATE }</td>
									<td>${r.BQ_MESSAGE }</td>
									<td>
										<c:if test='${r.BQ_STATUS == "N"}'>
											<p>요청 거절됨</p>
										</c:if>
										<c:if test='${r.BQ_STATUS == "Y"}'>
											<p>요청 수락됨</p>
										</c:if>
										<c:if test='${r.BQ_STATUS == "W"}'>
											<p>요청 대기중</p>
										</c:if>
										<c:if test='${r.BQ_STATUS == "C"}'>
											<p>요청 취소됨</p>
										</c:if>
									</td>
									<td>
					            		<c:if test="${r.BQ_STATUS eq 'W' }">
						            		<input id="" type="button" onclick="location.href='${cancel}'" value="취소하기" style="background-color: white; color: black; border: 2px solid red;"/>&nbsp;
						            	</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
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
