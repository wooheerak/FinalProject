<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardDetail</title>
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
		$("#boardtable").DataTable({
			// 표시 건수기능 숨기기
			"lengthChange" : false,
			// 정보 표시 숨기기
			"info" : false,
			columnDefs : [ {
				targets : 0,
				width : 200
			} ],
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
#boardtable {
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

.replyTable {
	margin: auto;
	width: 600px;
}

.col-sm-7 {
	width: 55.333333% !important;
	margin-top: 10px !important;
}

#rContent {
	margin: auto;
}
</style>
</head>
<body>
	<!-- 헤더 -->
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
					<h2>게시글 보기</h2>
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
		<table border="1" id="boardtable" align="center">
			<tr>
				<th>번호</th>
				<td>${ board.bId }2045</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ board.bTitle }스터디룸멤버구합니다</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ board.bWriter }신박한돌아이</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>${ board.bCreateDate }2019/10/30</td>
			</tr>
			<tr>
				<th>내용</th>
				<%-- <td>${ board.bContent }</td> --%>
				<!-- 
				이렇게만 두면 엔터가 먹지 않음. 
				DB에는 엔터가 \r\n으로 들어가서 이를 치환해주는 작업 필요
			-->

				<%
					pageContext.setAttribute("newLineChar", "\r\n");
				%>
				<!-- \r\n 말고 그냥 \n도, \r도 가능하다 -->
				<td>${ fn:replace(board.bContent, newLineChar, "<br>") }스터디룸멤버
					구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 <br>
					스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다
					스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 <br>
					스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 <br>
					스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 스터디룸 멤버 구합니다 <br>
				</td>
			</tr>
			<tr>
				<th>모집 인원</th>
				<td>${ board.Member }
					<button
						class="w3-button w3-round-large w3-light-blue w3-hover-green"
						onclick="location.href='${ bupView }'">참여</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button
						class="w3-button w3-round-large w3-light-blue w3-hover-green"
						onclick="location.href='${ bupView }'">탈퇴</button>
				</td>
			</tr>

			<%-- <c:if test="${ !empty board.originalFileName }">
			<tr>
				<th>첨부파일</th>
				<td>
					<a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }" download="${ board.originalFileName }">${ board.originalFileName }</a>
					<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. -->
				</td>
			</tr>
		</c:if> --%>

			<c:url var="bupView" value="bupView.bo">
				<c:param name="bId" value="${ board.bId }" />
				<c:param name="page" value="${ page }" />
			</c:url>
			<c:url var="bdelete" value="bdelete.bo">
				<c:param name="bId" value="${ board.bId }" />
			</c:url>
			<c:url var="blist" value="blist.bo">
				<c:param name="page" value="${ page }" />
			</c:url>

			<c:if test="${ loginUser.id eq board.bWriter }">
				<tr>
					<td colspan="2" align="center">
						<button
							class="w3-button w3-round-large w3-light-blue w3-hover-Green"
							onclick="location.href='${ bupView }'">수정하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button
							class="w3-button w3-round-large w3-light-blue w3-hover-Green"
							onclick="location.href='${ bdelete }'">삭제하기</button>
					</td>
				</tr>
			</c:if>

		</table>

		<br> <br>
		<!-- 댓글 -->

		<table class="replyTable">
			<tr>
				<td><textarea rows="3" cols="55" id="rContent"></textarea></td>
				<td>
					<button id="rSubmit"
						class="w3-button w3-round-large w3-light-blue w3-hover-green">등록</button>
				</td>
			</tr>
		</table>

		<table class="replyTable" id="rtb">
			<thead>
				<tr>
					<td colspan="2"><b id="rCount"></b></td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

		<script>
			$(function() {
				getReplyList();

				setInterval(function() {
					getReplyList();
				}, 10000);
			});

			$("#rSubmit").on("click", function() {
				var rContent = $("#rContent").val();
				var refBid = $
				{
					board.bId
				}
				;

				$.ajax({
					url : "addReply.bo",
					data : {
						rContent : rContent,
						refBid : refBid
					},
					type : "post",
					success : function(data) {
						if (data == "success") {
							getReplyList();
							$("#rContent").val("");
						}
					}
				});
			})

			function getReplyList() {
				var bId = $
				{
					board.bId
				}
				;

				$.ajax({
					url : "rList.bo",
					data : {
						bId : bId
					},
					dataType : "json",
					success : function(data) {
						$tableBody = $("#rtb tbody");
						$tableBody.html("");

						var $tr;
						var $rWriter;
						var $rContent;
						var $rCreateDate;

						$("#rCount").text("댓글 (" + data.length + ")");

						if (data.length > 0) {
							for ( var i in data) {
								$tr = $("<tr>");
								$rWriter = $("<td width = '100'>").text(
										data[i].rWriter);
								$rContent = $("<td>").text(
										decodeURIComponent(data[i].rContent
												.replace(/\+/g, " ")));
								$rCreateDate = $("<td width = '100'>").text(
										data[i].rCreateDate);

								$tr.append($rWriter);
								$tr.append($rContent);
								$tr.append($rCreateDate);
								$tableBody.append($tr);

							}

						} else {
							$tr = $("<tr>");
							$rContent = $("<td colspan = '3'>").text(
									"등록된 댓글이 없습니다.");

							$tr.append($rContent);
							$tableBody.append($tr);
						}
					}

				});
			}
		</script>

		<br> <br>

		<%-- <p align="center">
		<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='index.jsp'">메인 페이지</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
		<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='${ blist }'">뒤로 가기</button>
	</p> --%>


		<p align="center">
			<button class="w3-button w3-round-large w3-light-blue w3-hover-Green"
				onclick="location.href='home.do'">시작 페이지로 이동</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="w3-button w3-round-large w3-light-blue w3-hover-Green"
				onclick="location.href='${ blist }'">목록 보기로 이동</button>
		</p>
	</section>
	
	<!-- footer -->
	<c:import url="../common/footer.jsp" />
	
</body>
</html>