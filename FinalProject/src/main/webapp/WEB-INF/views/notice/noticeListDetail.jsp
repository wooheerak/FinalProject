<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

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
			<div class="boardDetail">
				<div class="boardInfo"
					style="background-color: #f3f3f3; border: 1px solid #e6e6e6; border-top: 1px solid #b3b3b3; padding: 20px;">
					<p class="boardInfoTitle">
						<b>일반열람실 24시간 개방 안내</b>
					</p>
					<p class="writeInfo text-right">
						2019-11-01&nbsp;&nbsp;&nbsp;&nbsp;<span>조회&nbsp;19</span>
					</p>
					<dl class="writerInfo text-right">
						<dd class="writer">
							<span>성중호</span>
						</dd>
					</dl>
				</div>
				<div class="boardContent"
					style="background-color: #fff; border: 1px solid #e6e6e6; border-top: none; padding: 20px; font-size: 13px;">
					퇴계기념중앙도서관에서 제공하는 인터넷동영상서비스인 푹존(POOQZONE)서비스가 아래와 같이 변경될 예정이오니 참고
					바랍니다.<br> <br> 가. 변경내용 : 기존 푹존(POOQZONE)과 SK 옥수수 서비스 결합으로
					인한 서비스 플랫폼 변경(Wavve)<br> <br> 나. 주요내용<br> <br>
					&nbsp; 1) 홈페이지 리뉴얼<br> <br> &nbsp; 2) Major Studio(유니버셜,
					파라마운트, 디즈니 등) 영화 라인업 추가<br> <br> &nbsp; 3) 국내외 영화 콘텐츠 및
					방송 VOD 채널 추가 등<br> <br> 다. 유의사항<br> <br> <span
						style="color: #0000cd">&nbsp; 1) 서비스 변경으로 인하여 현재 중앙도서관 3층
						전자정보자료실에 설치되어 있는 푹존 바로가기는 사용이 불가합니다.<br> <br> &nbsp; 2)
						최대한 빠른 시일 내에 새로운 서비스 이용을 위한 설치 작업을 완료할 예정이오니 다소 불편하시더라도 양해를 부탁
						드립니다.<br> <br> &nbsp; 3) 중앙도서관 웨이브(Wavve) 서비스 개시 예정일은
						11.11日(월)이오니 참고하여 주시기 바랍니다.
					</span><br> <br> <br> 이용에 불편을 드리게 되어 대단히 송구하오며, 빠른 시일 내에
					정상적인 서비스가 제공될 수 있도록 조치하겠습니다.
				</div>


			</div>
			<br>
			<br>
			<div class="text-center">
				<a href="notice.no" class="btn btn-transparent">목록</a>
			</div>
		</div>



	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>