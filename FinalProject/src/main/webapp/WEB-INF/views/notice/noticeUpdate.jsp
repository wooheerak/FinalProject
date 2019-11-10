<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
			<form action="nupdate.no" method="post" enctype="Multipart/form-data">
				<table id="noticeInsertTable" class="table" border="1">
					<tr>
						<input type = "hidden" name = "nId" value = "${ notice.nId }"/>
						<th>제목</th>
						<td><input type="text" size="100%" name="nTitle" value="${ notice.nTitle }"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="nWriter" readonly value="${ notice.nWriter }" style="background: lightgrey;">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<!-- <textarea rows="20" cols="140" name="nContent" style="resize: none;"></textarea> -->
							<textarea name=nContent>${ notice.nContent }</textarea>
			                <script>
			                        CKEDITOR.replace( 'nContent' );
			                </script>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="reloadFile">
							<c:if test="${ !empty notice.originalFileName }">
								<br>현재 업로드한 파일 : 
								<a href="${ contextPath }/resources/nuploadFiles/${ notice.renameFileName }" download="${ notice.originalFileName }">
									${ notice.originalFileName }
								</a>
							</c:if>
						</td>
					</tr>					
				</table>
				<div class="text-center">
					<c:url var="ndelete" value = "ndelete.no">
						<c:param name="nId" value="${ notice.nId }"/>
					</c:url>
					<input class="btn btn-transparent" type="submit" value="등록 하기" style="background-color: transparent;"> &nbsp;
					<button class="btn btn-transparent" style="background-color: transparent;" type = "button" onclick="location.href='${ ndelete }'">삭제하기</button>
					<a href="nlist.no" class="btn btn-transparent">목록</a>
				</div>
			</form>
		</div>
	<!--  -->
	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>