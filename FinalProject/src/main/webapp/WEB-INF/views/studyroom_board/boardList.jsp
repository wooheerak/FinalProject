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

			  // 정렬
            "order": [],
            
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
        
            <!-- 번호, 제목, 작성자, 현재인원/최대인원, 예약상태, 모집상태, 작성시간, 조회수 -->
            <c:forEach var="b" items="${ list }">
            <tr>
            	<td>${ b.bo_number }</td>
     
            
            	<%-- <td>${ b.bo_title }</td> --%>
            	<td>
						<c:url var="bDetail" value="bDetail.bo">
							<c:param name="bo_number" value="${ b.bo_number }"/>
						</c:url>
						<a href="${ bDetail }">${ b.bo_title }</a>
				</td>
            
            
            	<td>${ b.bo_name }</td>
            
            
            	<td>${ b.bo_member } / ${ b.bo_maxmember }</td>
           
           
            	<td>${ b.bo_reinfo }</td>
          
            
            	<td>${ b.bo_complete }</td>
          
           
            	<td>${ b.bo_date }</td>
         
       
            	<td>${ b.bo_count }</td>
            </tr>
            
            </c:forEach>
            
            
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
			
		<tr>
			<td colspan="6" align="right" id="buttonTab">
				<c:if test="${ !empty loginUser }">
					&nbsp; &nbsp; &nbsp;
				<button class="w3-button w3-round-large w3-light-blue w3-hover-Green" style="margin-left: 80%;"  onclick="location.href='binsertView.bo';">글쓰기</button>				</c:if>
			</td>
		</tr>
		<!--  -->
	<!-- footer -->
	<c:import url="../common/footer.jsp"/>
</body>
</html>