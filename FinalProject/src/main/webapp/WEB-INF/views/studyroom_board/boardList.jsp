<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
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
			"lengthChange" : true,
			// 정보 표시 숨기기
			"info" : true,

			// 높이 고정

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
/* 	#tb{margin: auto; width: 700px; border-collapse: collapse; width: 1000px !important;}
	#tb tr td{padding: 5px;} */
#buttonTab {
	border-left: hidden;
	border-right: hidden;
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

.dataTables_wrapper {
	margin: auto;
	width: 80% !important;
	min-height: 600px;
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
					<h2>스터디룸 게시판</h2>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
	</section>
	<!-- end section -->


	<section class="section overfree" style="padding: 30px 0px;">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<table id="tb" class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>모집인원</th>
					<th>바로/예약</th>
					<th>상태</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>

			<tbody align="center">

				<tr>
					<td>1</td>
					<td>인문 과학</td>
					<td>성원</td>
					<td>2/4</td>
					<td>바로</td>
					<td>모집중</td>
					<td>2019/10/30</td>
					<td>8</td>
				</tr>
				<tr>
					<td>2</td>
					<td>수학 공부</td>
					<td>수진</td>
					<td>3/6</td>
					<td>바로</td>
					<td>모집중</td>
					<td>2019/10/30</td>
					<td>4</td>
				</tr>
				<tr>
					<td>3</td>
					<td>팀 프로젝트</td>
					<td>동수</td>
					<td>4/6</td>
					<td>예약(11/03)</td>
					<td>모집중</td>
					<td>2019/10/31</td>
					<td>7</td>
				</tr>
				<tr>
					<td>4</td>
					<td>자격증 시험</td>
					<td>희락</td>
					<td>2/4</td>
					<td>바로</td>
					<td>모집중</td>
					<td>2019/9/30</td>
					<td>2</td>
				</tr>
				<tr>
					<td>5</td>
					<td>기말 빡공</td>
					<td>진호</td>
					<td>6/6</td>
					<td>예약(11/01)</td>
					<td>모집완료</td>
					<td>2019/10/20</td>
					<td>10</td>
				</tr>
				<tr>
					<td>6</td>
					<td>롤 할사람</td>
					<td>한수</td>
					<td>1/4</td>
					<td>바로</td>
					<td>모집중</td>
					<td>2019/10/10</td>
					<td>45</td>
				</tr>
				<tr>
					<td>7</td>
					<td>공무원 시험 대비</td>
					<td>준호</td>
					<td>5/6</td>
					<td>예약(11/02)</td>
					<td>모집중</td>
					<td>2019/10/15</td>
					<td>8</td>
				</tr>
				<tr>
					<td>8</td>
					<td>공시생 모여라</td>
					<td>성호</td>
					<td>6/6</td>
					<td>바로</td>
					<td>모집완료</td>
					<td>2019/10/21</td>
					<td>9</td>
				</tr>
				<tr>
					<td>9</td>
					<td>학원 가기 전에</td>
					<td>철현</td>
					<td>2/4</td>
					<td>예약(11/04)</td>
					<td>모집중</td>
					<td>2019/10/28</td>
					<td>11</td>
				</tr>
				<tr>
					<td>10</td>
					<td>탈주각 보실 분?</td>
					<td>상은</td>
					<td>1/6</td>
					<td>바로</td>
					<td>모집중</td>
					<td>2019/10/05</td>
					<td>13</td>
				</tr>
				<tr>
					<td>99</td>
					<td>유학 가자~</td>
					<td>재윤</td>
					<td>4/4</td>
					<td>예약(11/10)</td>
					<td>모집완료</td>
					<td>2019/10/08</td>
					<td>21</td>
				</tr>

			</tbody>
			<%-- <c:forEach var="b" items="${ list }">
			<tr class="contentTR">
				<td align="center">${ b.bId }</td>
				
				<td align="left">
					<c:if test="${ !empty loginUser }">
						<c:url var="bdetail" value="bdetail.bo">
							<c:param name="bId" value="${ b.bId }"/>
						</c:url>
						<a href="${ bdetail }">${ b.bTitle }</a>
					</c:if>
					<c:if test="${ empty loginUser }">
						${ b.bTitle }		
					</c:if>
				</td>
				
				<td align="center">${ b.bWriter }</td>
				<td align="center">${ b.bMember } / ${ b.bMaxMember }</td>
				<td align="center">${ b.bComplete }</td>
				<td align="center">${ b.bCreateDate }</td>
				<td align="center">${ b.bCount }</td>
			</tr>
			</c:forEach>
		</tbody> --%>
		</table>

		<%-- 		<tr>
			<td colspan="6" align="right" id="buttonTab"><c:if
					test="${ !empty loginUser }">
					&nbsp; &nbsp; &nbsp;
				<button
						class="w3-button w3-round-large w3-light-blue w3-hover-Green"
						style="margin-left: 80%;"
						onclick="location.href='binsertView.bo';">글쓰기</button>
				</c:if></td>
		</tr> --%>

	</section>

	<!-- footer -->
	<c:import url="../common/footer.jsp" />

</body>
</html>