<%@ page language="java" contentType="text/html; charset=UTF-8"
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

			// 정렬
            "order": [],
			
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

					<c:forEach var="n" items="${ list }">

						<tr>
							<td>${ n.nId }</td>
							<td>
								<c:url var="ndetail" value="ndetail.no">
									<c:param name="nId" value="${ n.nId }"/>
								</c:url>
								<a href="${ ndetail }">${ n.nTitle }</a>
							</td>
							<td>${ n.nWriter }</td>
							<td>${ n.nCreateDate }</td>
							<td>${ n.nCount }</td>
							<td>
								<c:if test="${ ! empty n.originalFileName }">
									<i class="fa fa-file"></i>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>