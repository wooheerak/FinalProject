<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적</title>
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
					<h2>중고서적</h2>
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
						<th>이미지</th>
						<th>정보</th>
						<th>조회수</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach var="br" items="${ list }">

						<tr onclick="document.location = 'bsdetail.bs;">
							<td>${ br.brBnumber }</td>
							<td>
								<c:url var="bsdetail" value="bsdetail.bs">
									<c:param name="brBnumber" value="${ br.brBnumber }"/>
								</c:url>
								<a href="${ bsdetail }">${ br.originalFileName }a</a>
							
								
							</td>
							<td>
								<div>
									<p>카테고리: ${ br.brCategory }</p>
									<p>책제목: ${ br.brName }</p>
									<p>가 격: ${ br.brPrice } 원</p>
								</div>	
							</td>
							<td>
								${ br.brCount }
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