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
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
				"emptyTable" : "데이터가 없습니다.",
				"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "검색: ",
				"zeroRecords" : "일치하는 데이터가 없습니다.",
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



	<c:import url="../common/header.jsp"></c:import>

		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>도서 관리 페이지</h2>
						<p class="lead">신청 도서 관리</p>
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
						<h4>도서 관리</h4>
					</div>
					<!-- end pricing-header -->

					<!-- end pricing-top -->
					<div class="pricing-details" style="text-align: center;">
						<ul>
							<div class="menuContent" focusable="true" onclick="location.href='requestBookMaster.bk'">신청 도서 관리</div>
							<div class="menuContent" focusable="true" onclick="location.href='reservationBookMaster.bk'">대출 예약 도서 관리</div>
							<div class="menuContent" focusable="true" onclick="location.href='loanBookMaster.bk'">대출 도서 관리</div>
							<div class="menuContent" focusable="true" onclick="location.href='bookManagement.bk'">도서 관리</div>
							<div class="menuContent" focusable="true" onclick="location.href=''">...</div>
						</ul>
					</div>
					<!-- end pricing-details -->
				</div>
				<!-- end pricing-box -->
			</div>
			
			<!-- 테이블 -->
	<table id="tb" class="table">
        <thead>
            <tr>
            	<th>번호</th>
            	<th>신청자 아이디</th>
            	<th>도서 제목</th>
            	<th>작 가</th>
            	<th>역 자</th>
            	<th>출판사</th>
            	<th>ISBN</th>
            	<th>도서 가격</th>
            	<th>요청 사항</th>
            	<th>요청 날짜</th>
            	<th>상 태</th>
            	<th></th>
          	</tr>
        </thead>

        <tbody align="center">
        
            <!-- 번호, 제목, 작성자, 현재인원/최대인원, 예약상태, 모집상태, 작성시간, 조회수 -->
            <c:forEach var="r" items="${ list }">
            <tr>
            	<td>${ r.BQ_NO }</td>
     
            
            	<td>
					<c:url var="bDetail" value="bDetail.bo">
						<c:param name="bo_number" value="${ b.bo_number }"/>
					</c:url>
					<a href="${ bDetail }">${ b.bo_title }</a>
				</td>
            
            
            	<td>${ b.bo_name }</td>
            
            
            	<td>${ b.bo_member } / ${ b.bo_maxmember }</td>
           
           
            	<td>
            	<c:set var="rei" value="${ b.bo_reinfo }" />
				<c:choose>
				    <c:when test="${rei eq 'N'}">
				        	바로
				    </c:when>
				    <c:when test="${rei eq 'Y'}">
				       		예약
				    </c:when>
				</c:choose>
            	</td>
          
            
            	<td>
				<c:set var="com" value="${b.bo_complete }" />
				<c:choose>
				    <c:when test="${com eq 'N'}">
				        	모집중
				    </c:when>
				    <c:when test="${com eq 'Y'}">
				       		완료
				    </c:when>
				</c:choose>
            	</td>

            	<td>${ b.bo_date } </td>
       
            	<td>${ b.bo_count }</td>
            </tr>
            
            </c:forEach>
            
            
        </tbody>
    </table>			
		</section>
		<!-- end section -->
	<div style="width:100%; height:200px; background-color: white;"></div>
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>

</html>
