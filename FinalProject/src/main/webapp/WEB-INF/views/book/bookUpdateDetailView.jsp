<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
</head>
<style>
table{
border: 1px;
}

th {
background-color: #f3f3f3; border: 1px solid #e6e6e6; border-top: 1px solid #b3b3b3;
}
</style>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>서적 등록</h2>
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
			<form action="updateNBook.bk" method="post" enctype="Multipart/form-data">
				<table id="booksalesInsertTable" class="table" border="1">
					<tr>
						<th>도서 제목</th>
						<td>
							<input type="text" size="100%" name="bName" value="${book.bName }" required/>
						</td>
					</tr>
					<tr>
						<th>도서 저자</th>
						<td>
							<input type="text" name="bWriter" value="${book.bWriter }" required/>
						</td>
					</tr>
					<tr>
						<th>도서 역자</th>
						<td>
							<input type="text" name="bTrans" value="${book.bTrans }"/>
						</td>
					</tr>
					<tr>
						<th>출판사</th>
						<td>
							<input type="text" name="bPublisher" value="${book.bPublisher}" required/>
						</td>
					</tr>	
					<tr>
						<th>페이지 수</th>
						<td>
							<input type="number" name="bPage" value="${book.bPage }"/>
						</td>
					</tr>
					<tr>
						<th>가 격</th>
						<td>
							<input type="number" name="price" value="${book.price }"> 원
						</td>
					</tr>									
					<tr>
						<th>카테고리</th>
						<td>
							<!-- <input type="text" size="100%" name="brCategory"> -->
							<select name="bMainCTG" required>
								<OPTION value=''>카테고리 선택</OPTION>
	                            <OPTION value='경상계열'>경상계열</OPTION>
	                            <OPTION value='인문/사회계열'>인문/사회계열</OPTION>
	                            <OPTION value='공학계열'>공학계열</OPTION>
	                            <OPTION value='어학계열'>어학계열</OPTION>
	                            <OPTION value='법학계열'>법학계열</OPTION>
	                            <OPTION value='의학/약학계열'>의학/약학계열</OPTION>
	                            <OPTION value='사법계열'>사법계열</OPTION>
	                            <OPTION value='예체능계열'>예체능계열</OPTION>
	                            <OPTION value='기타'>기타</OPTION>
							</select>
						</td>
					</tr>					
					<tr>
						<th>언 어</th>
						<td>
							<input type="text" name="bLanguage" value="${book.bLanguage }" required/>
						</td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td>
							<input type="text" name="bISBN" value="${book.bISBN }" required>
						</td>
					</tr>
					<tr>
						<th>위 치</th>
						<td>
							<input type="text" name="bLocation" value="${book.bLocation }" required>
						</td>
					</tr>					
					<tr>
						<th>
							첨부파일<br>
							<p><font size="2">※ 책 표지 사진을 <br>첨부해 주세요</font></p>
						</th>
						<td><input type="file" name="uploadFile" required/></td>
					</tr>					
				</table>
				<input type="hidden" name="bNo" value="${book.bNo }"/>
				
				<div class="text-center">
					<input class="btn btn-transparent" type="submit" value="수정 하기" style="background-color: transparent;"> &nbsp;
					<a href="${cancelBtn }" class="btn btn-transparent">취소하기</a>
				</div>
			</form>
		</div>
		<c:url var="cancelBtn" value="bookDetailViewMaster.bk">
			<c:param name="bNo" value="${bNo }"></c:param>
		</c:url>
<!--  -->
	</section>
	<!-- end section -->
<!--  -->
	<jsp:include page="../common/footer.jsp"/>

</body>

</html>