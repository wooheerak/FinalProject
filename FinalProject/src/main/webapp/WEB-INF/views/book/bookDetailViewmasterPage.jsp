<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				</div><!-- end col -->
			</div><!-- end row -->
		</div><!-- end container -->
	</section><!-- end section -->

	<section class="section" style="padding-top: 10px;">
		<div class="col-md-2" style="margin-left: 50px; border-radius: 30px; diplay:inline;">
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

		<div class="container">
			<div class="row case-single" style="margin-left: 100px;">
				<div class="col-md-6 col-sm-6 col-xs-12" style="width:230px; height:340px;">
					<div class="pitem" style="width:220px; height:330px;">
						<div class="case-box">
							<img src="resources/BOOK_IMG/${book.bIMG }" alt=""
								class="img-responsive">
						</div><!-- end case-box -->
					</div><!-- end pitem -->
				</div><!-- end col -->

				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="case-details" style="width:670px; height:330px;">
						<h3>${book.bName }<br>
							<small>${book.bWriter } / ${book.bPublisher }</small>
						</h3>
						<p>카테고리 : ${ book.bMainCTG} <br> 언 어 : ${ book.bLanguage}</p>
						<p>발행 일자 : ${ book.bIssueDate}</p>
					</div><!-- end details -->
				</div><!-- end col -->
			</div><!-- end row -->
		</div><!-- end container -->
	</section><!-- end section -->

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
					<td>${book.bNo }</td>
					<td>${book.bLocation }</td>
					<td>${bCount} / ${bYCount }</td>
					<td>
						<c:if test="${book.status == 'Y' }">
							<p>대출 가능</p>
						</c:if>
						<c:if test="${book.status == 'R' }">
							<p>대출 중</p>
						</c:if>
						<c:if test="${book.status == 'N' }">
							<p>폐기 도서</p>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<c:url var="updateBtn" value="bookDetailUpdate.bk">
		<c:param name="bNo" value="${book.bNo }"/>
	</c:url>
	
	<div style="background-color: white; width:100%; height:200px"></div>
	<div style="background-color: white; diplay:inline;">
		<button onclick="location.href='${updateBtn}'" class="w3-btn w3-white w3-border" style="margin-left:43%; border-radius: 10px; background-color: white;">수정하기</button>
		&nbsp;&nbsp;&nbsp;
		<button onclick="location.href='bookManagement.bk'" class="w3-btn w3-white w3-border" style="border-radius: 10px; background-color: white;">목록으로</button>
		&nbsp;&nbsp;&nbsp;
		<button onclick="deleteBook()" class="w3-btn w3-white w3-border" style="border-radius: 10px; background-color: white;">폐기처리</button>
	</div>
	<div style="background-color: white; width:100%; height:200px"></div>
	
	<input id="yCount" type="hidden" value="${yCount }"/>
	<input id="allCount" type="hidden" value="${allCount }"/>
	<input name="bookWriter" type="hidden" value="${book.bWriter }"/>
	
	
	<form id="submitForm" action="deleteBook.bk">
		<input type="hidden" name="bNo" value="${book.bNo }"/>
	</form>
	
	<script>
		function backBtn(){
			window.history.back();
		}
		
		function deleteBook(){
			if(confirm('도서를 폐기처리 하시겠습니까?')){
				$('#submitForm').submit();
			} else {
				
			}
		}
	</script>	

	<jsp:include page="../common/footer.jsp" />

</body>

</html>