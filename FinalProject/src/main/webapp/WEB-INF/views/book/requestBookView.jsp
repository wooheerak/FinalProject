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

	<br>
	<br>
	<div class="row">
		<section>
			<div class="col-md-8 col-sm-4" style="height:850px;">
				<div class="text-box-2"
					style="border: 1px solid black; margin-left: 600px; margin-bottom: 150px; margin-top: 50px; ">
					<h3>도서 신청하기</h3>
					<form role="form" class="contactform" action="insertRequest.bk">
						<div class="form-group">
							도서제목 : <input type="text" class="form-control" id="name"
								name="name" placeholder="제목을 입력하세요" required>
						</div>
						<div class="form-group">
							작 가 : <input type="text" class="form-control" id="writer"
								name="writer" placeholder="작가를 입력하세요" required>
						</div>
						<div class="form-group">
							출판사 이름 : <input type="text" class="form-control" id="publisher"
								name="publisher" placeholder="출판사" required>
						</div>
						<div class="form-group">
							도서 가격 : <input type="text" class="form-control" id="price"
								name="price" placeholder="가 격" required>
						</div>
						<div class="form-group">
							ISBN : <input type="text" class="form-control" id="isbn"
								name="isbn" placeholder="ISBN" required>
						</div>
						<div class="form-group">
							요청 사항 :
							<textarea class="form-control" id="message" name="message"
								placeholder="요청 사항을 적어주세요." maxlength="140" rows="7"></textarea>
						</div>
						<input type="submit" id="submit" name="submit"
							class="btn btn-transparent btn-lg cancel" value="신청하기"
							style="width: 200px; margin-left: 35%; background: white;"/>
					</form>


				</div>
			</div>
			
			<button onclick="goHomeBtn()" class="w3-btn w3-white w3-border" style="border-radius: 10px; margin-left: 46.5%; margin-bottom: 50px;">
			취소하기</button>
			<br><br><br><br><br>
		</section>
		<br><br><br><br>
		
	</div>
	<script>
		function goHomeBtn(){
			location.href="index.do";
		}
	</script>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>