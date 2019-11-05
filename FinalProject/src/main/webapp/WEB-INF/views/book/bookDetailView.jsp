<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
					<div class="menuContent">
						BOOKSALES<br>거래 내역
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row case-single" style="margin-left: 100px;">
				<div class="col-md-6 col-sm-6 col-xs-12" style="width:230px; height:340px;">
					<div class="pitem" style="width:220px; height:330px;">
						<div class="case-box">
							<img src="http://image.aladin.co.kr/product/5382/45/cover/8994217630_1.jpg" alt=""
								class="img-responsive">
						</div>
						<!-- end case-box -->
					</div>
					<!-- end pitem -->
				</div>
				<!-- end col -->

				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="case-details" style="width:670px; height:330px;">
						<h3>
							자바를 잡아라 <small>이수진 / 멍청이</small>
						</h3>
						<p>대충 줄거리 부분.</p>
						<p>대충 목차 부분.</p>
						<a onclick="document.getElementById('id01').style.display='block'" class="btn btn-transparent btn-lg cancel">
						<i class="fa fa-book"></i>예약하기</a>
						<!-- <a href="#" class="btn btn-transparent btn-lg" style="margin-bottom:5%; margin-right:5%;"><i class="fa fa-book"></i> 예약 하기</a> -->
					</div>
					<!-- end details -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<div class="myTalbles" style="background-color: white;">
		<table class="myTable" style="border:1px solid black; width:50%; margin-left: 450px;">
			<thead style="background-color: skyblue;">
				<tr>
					<th>기관명   </th>
					<th>자료실명</th>
					<th>등록번호</th>
					<th>청구기호</th>
					<th>수 량    </th>
					<th>도서상태</th>									
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Studyhub.lib</td>
					<td>종합 자료실</td>
					<td>EAS0028167433</td>
					<td>ㄱ192.28.11</td>
					<td>4 / 5</td>
					<td>예약 가능</td>
				</tr>
			</tbody>
		</table>
		<br><br><br><br><br><br>
		<br><br><br><br><br><br>
	</div>

	<div id="id01" class="w3-modal">
		<div class="w3-modal-content" style="width: 400px; height: 300px;">
			<div class="w3-container"
				style="margin-top: 160px; width: 400px; height: 300px;">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright"
					style="width: 10px; heigth: 10px;">&times;</span> <br>
				<br> <b>&nbsp;&nbsp;예약 기능은 예약 후 24시간 이내에 도서관 방문하여 직접 대출을
					받아야 완료되며, 24시간 이후 자동 예약 취소됩니다.</b> <br>
				<br>
				<hr>
				<button class="w3-button w3-blue" style="margin-bottom:-45px; margin-left:60px; border-radius: 10px; ">예약하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="w3-button w3-blue" style="margin-bottom:-45px; margin-left:60px; border-radius: 10px;"
				onclick="document.getElementById('id01').style.display='none'">취 소</button>
			</div>
		</div>
	</div>
	
	<button onclick="location.href='selectList.bk'" class="w3-btn w3-white w3-border" style="border-radius: 10px; margin-left:48%; margin-top:-25%">목록으로</button>
	<br><br>

	<jsp:include page="../common/footer.jsp" />

</body>

</html>