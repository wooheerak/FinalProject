<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
<script>
	jQuery(function($) {
		$("#tb").DataTable({
			// 표시 건수기능 숨기기
			"lengthChange" : false,
			// 정보 표시 숨기기
			"info" : true,

			// 페이지 넘기는 방식
			pagingType : "full_numbers",

			// n번째 항목 넓이를 300px로 설정
			columnDefs : [ {
				targets : 0,
				width : 50
			}, {
				targets : 1,
				width : 500
			}, {
				targets : 5,
				width : 70
			}],

			"language" : {
				"emptyTable" : "데이터가 없어요.",
				"info" : "현재 _START_ - _END_ / 총_TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "검색: ",
				"zeroRecords" : "일치하는 데이터가 없어요.",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"first" : "<<",
					"next" : ">",
					"previous" : "<",
					"last" : ">>"
				}
			}
		});
	});
</script>

</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>공지사항</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<!-- 공지사항 -->


	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<table id="tb" class="table table-hover">
				<thead>
					<tr class="active">
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>첨부파일</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>1</td>
						<td>일반열람실 24시간 개방 안내</td>
						<td>이수진</td>
						<td>2019-10-07</td>
						<td>1102</td>
						<td><a href="noticedetail.no"><i class="fa fa-file"></i></a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>한글날 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-07</td>
						<td>342</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>3</td>
						<td>10월 도서관 정기교육 안내</td>
						<td>이동수</td>
						<td>2019-10-02</td>
						<td>55</td>
						<td><i></i></td>
					</tr>
					<tr>
						<td>4</td>
						<td>개천절 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-02</td>
						<td>33</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>5</td>
						<td>일반열람실 24시간 개방 안내</td>
						<td>이수진</td>
						<td>2019-10-07</td>
						<td>1102</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>6</td>
						<td>한글날 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-07</td>
						<td>342</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>7</td>
						<td>10월 도서관 정기교육 안내</td>
						<td>이동수</td>
						<td>2019-10-02</td>
						<td>55</td>
						<td><i></i></td>
					</tr>
					<tr>
						<td>8</td>
						<td>개천절 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-02</td>
						<td>33</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>9</td>
						<td>일반열람실 24시간 개방 안내</td>
						<td>이수진</td>
						<td>2019-10-07</td>
						<td>1102</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>10</td>
						<td>한글날 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-07</td>
						<td>342</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
					<tr>
						<td>11</td>
						<td>10월 도서관 정기교육 안내</td>
						<td>이동수</td>
						<td>2019-10-02</td>
						<td>55</td>
						<td><i></i></td>
					</tr>
					<tr>
						<td>12</td>
						<td>개천절 도서관 이용안내</td>
						<td>우희락</td>
						<td>2019-10-02</td>
						<td>33</td>
						<td><i class="fa fa-file"></i></td>
					</tr>
				</tbody>
			</table>
		</div>


		<!-- 		<div class="pull-right">
			<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>
		</div> -->


		<!-- 		<script type="text/javascript">
			$(function() {
				$(".contentTR").mouseenter(function() {
					$(this).css({
						"color" : "black",
						"font-weight" : "bold",
						"cursor" : "pointer"
					});
				}).mouseout(function() {
					$(this).css({
						"color" : "gray",
						"font-weight" : "normal"
					});
				}).click(function() {
					var nId = $(this).children("td").eq(0).text();

					location.href = "bdetail.bo?nId=" + nId + "&page=" + $
					{
						pi.currentPage
					}
					;
				});
			});
		</script> -->
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>