<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardInsert</title>
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
		$("#boardInsertTable").DataTable({
			// 표시 건수기능 숨기기
			"lengthChange" : false,
			// 정보 표시 숨기기
			"info" : false,

			// 페이지 넘기는 방식
			pagingType : "full_numbers",

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
					"next" : "다음",
					"previous" : "이전"
				}
			}
		});
	});
</script>
<style type="text/css">
#boardInsertTable {
	margin: auto;
	width: 80% !important;
	min-height: 600px;
}

#w3 {
	margin: auto;
	width: 700px;
	border-collapse: collapse;
}

#w3-sidebar {
	margin-top: 138px;
	height: 356px !important;
}

.col-sm-7 {
	width: 55.333333% !important;
	margin-top: 10px !important;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />

	<!-- 왼쪽 사이드 바 https://www.w3schools.com/w3css/w3css_sidebar.asp -->
	<!-- <div id="w3-sidebar"class="w3-sidebar w3-bar-block w3-light-blue" style="width:200px" >
		<a href="#" class="w3-bar-item w3-button w3-border-bottom w3-hover-blue">링크 1</a>
		<a href="#" class="w3-bar-item w3-button w3-border-bottom w3-hover-blue">링크 2</a>
        <a href="#" class="w3-bar-item w3-button w3-border-bottom w3-hover-blue">링크 3</a>
        <a href="#" class="w3-bar-item w3-button w3-border-bottom w3-hover-blue">링크 4</a>
        <img src="resources/images/logo.JPG" height="200px" width="200px"/>
	</div> -->

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>게시글 등록</h2>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
	</section>
	<!-- end section -->

	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<form action="bInsert.bo" method="post">
		<table id="boardInsertTable" border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" size="80" name="bo_title">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<%-- <input type="text" name="bo_name" readonly value="${ loginUser.id }" style="background: lightgrey;"> --%>
					<input type="text" size="80" name="bo_name">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="200" name="bo_detail"></textarea></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>
					<input class="w3-radio" type="radio" name="bo_maxmember" value="4" checked>
					<label>4명</label>
					
					<input class="w3-radio" type="radio" name="bo_maxmember" value="6">
					<label>6명</label>
					
					<input class="w3-radio" type="radio" name="bo_maxmember" value="8">
					<label>8명</label>
					
					<input class="w3-radio" type="radio" name="bo_maxmember" value="11">
					<label>11명</label>
				</td>
			</tr>
			<tr>
				<th>예약</th>
				<td>
					<input class="w3-radio" type="radio" name="bo_reinfo" value="N" checked>
					<label>바로</label>
					
					<input class="w3-radio" type="radio" name="bo_reinfo" value="Y">
					<label>예약</label>
				</td>
			</tr>
			<c:url var="blist" value="blist.bo">
			</c:url>
			<tr>
				<td colspan="2" align="center">
					<input class="w3-button w3-round-large w3-light-blue w3-hover-green" type="submit" value="등록 하기"> &nbsp;
					<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='${ blist }'">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	<br><br>
	<!-- footer -->
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>