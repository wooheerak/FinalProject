<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	<section>
		<div class="col-md-4 col-sm-12 col-xs-12">
			<div class="text-box-2">
				<h3>도서 신청하기</h3>
				<form role="form" class="contactform">
				    <div class="form-group">
				        <input type="text" class="form-control" id="name" name="name" placeholder="제목을 입력하세요" required>
				    </div>
				    <div class="form-group">
				        <input type="text" class="form-control" id="email" name="email" placeholder="출판사" required>
				    </div>
					<div class="form-group">
				        <input type="text" class="form-control" id="phone" name="phone" placeholder="가 격" required>
				    </div>
					<div class="form-group">
				        <input type="text" class="form-control" id="date" name="date" placeholder="발행" required>
				    </div>				    
				    <div class="form-group">
				        <input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN" required>
				    </div>
				    <div class="form-group">
				        <textarea class="form-control" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
				    </div>
				    <button type="button" id="submit" name="submit" class="btn btn-primary btn-block">Submit Form</button>
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>