<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyHub.lib</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/heerak.css">
<style>
/*열람실 좌석현황*/
.readingR {
	position: relative;
}

.readingR>ul {
	width: 100%;
	list-style-type: none;
	overflow: hidden;
	border: 1px solid #dedede;
	padding-left: 10px;
}

.readingR>ul li {
	line-height: 31px;
}

.readingR>ul h3 {
	float: left;
	width: 60px;
	text-align: left;
	font-size: 13px;
	color: #6d6d6d;
}

.readingR>ul p {
	font-size: 13px;
	color: #6d6d6d;
}

.readingR>ul p .num {
	font-size: 12px;
	color: #ff1857;
}

.readingR>ul p .total {
	font-size: 14px;
}

.readingR .flr {
	float: right;
}

.readingR .book p {
	padding-left: 28px;
	background-size: 13px 16px;
	text-align: left;
	min-width: 52px;
}

.readingR .com p {
	padding-left: 29px;
	background-size: 19px 14px;
}

.readingR .more {
	position: absolute;
	right: 0;
	top: 0;
}

.readingR .more img {
	width: 13px;
	height: 13px;
}

.lInput[type=text], .lInput[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.lButton {
	background-color: #00529c;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

.lButton:hover {
	opacity: 0.8;
}

.psw {
	float: right;
	padding-top: 16px;
}

/* 게시판 테이블 용 */
th {
	text-align: center !important;
	background: #bbd1f9;
	color: #806464;
}

.aa {
	background: rgba(104, 182, 253, 0.7);
	color: white;
	font-weight: 700;
	font-size: 18px;
	border-bottom: 1px solid black;
}

.bb {
	background: rgba(104, 182, 253, 0.7);
	color: white;
	font-weight: 700;
	font-size: 18px;
	border-bottom: 1px solid black;
}

.cc {
	border-bottom: 1px solid black;
}

.dd {
	border-bottom: 1px solid black;
}

.caption {
	font-weight: 700;
	font-size: 20px;
	padding: 5px;
	color: #1BA6B2;
	text-align: left;
	margin-bottom: 5px
}

.bo_top {
	background-color: rgba(0, 82, 156, 0.7);
	color: white;
	font-weight: 700;
	font-size: 18px;
}

#tb {
	border-bottom: 1px solid #878787;
}

#sbackground {
	background-image: url("resources/images/background.jpg");
}
</style>

</head>

<body style="overflow-X: hidden">

	<c:import url="WEB-INF/views/common/header.jsp"></c:import>

	<!-- 검색바 -->
	<section id="sbackground" class="section nopad"
		style="width: 100%; height: 300px;">

		<div class="col-md-10 col-md-offset-1  text-center" style="">
			<form action="selectList.bk" class="calculateform"
				style="height: 150px; padding-top: 33px; background-color: rgba(0, 82, 156); margin-bottom: 30px; opacity: 0.9;">
				<div class="dorpdown dropdown"
					style="display: flex; margin-top: 30px; width: 100%;">
					<SELECT name='searchOption'>
						<!-- 검색 컬럼 -->
						<OPTION value='title' selected>제목 검색</OPTION>
						<OPTION value='author'>저자 검색</OPTION>
						<OPTION value='publisher'>출판사 검색</OPTION>
						<OPTION value='ISBN'>ISBN 검색</OPTION>
					</SELECT> &nbsp;&nbsp; 
					<input type="text" class="form-control"
						id="searchbar" name="search"
						style="height: 49.33px; width: 450px;" placeholder="검색어를 입력하세요">
					&nbsp;&nbsp; 
					<input type="submit" name="send" value="검색"
						class="btn btn-default" style="height: 49.33px; width: 150px;" />
				</div>
			</form>
		</div>
	</section>


	<!-- 메뉴바 -->
	<section class="section nopad" style="">
		<ul class="text-center"
			style="list-style-type: none; margin-left: 0px; padding: 0px;">
			<li>
				<div class="col-md-2 col-sm-6 nopad">
					<div onclick="checkLogin2()" class="home-service c1"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;">
						<img src="resources/images/timeIcon1.png" style="width: 100px;">
						<p>대출/연장</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>
			<!-- end col -->
			<li>
				<div class="col-md-2 col-sm-6 nopad">
					<div onclick="checkLogin()" class="home-service c2"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;">
						<img src="resources/images/quickMenu4.png" style="width: 90px;">
						<p>도서 신청</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>
			<!-- end col -->

			<li>
				<div class="col-md-2 col-sm-6 nopad">
					<div class="home-service c3"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;"
						onclick="location.href='studymain.ss'">
						<img src="resources/images/quickMenu3.png" style="width: 90px;">
						<p>열람실/스터디룸</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>

			<li>
				<div class="col-md-2 col-sm-6 nopad">
					<div class="home-service c3"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;"
						onclick="location.href='bList.bo'">
						<img src="resources/images/quickMenu1.png" style="width: 90px;">
						<p>스터디룸 게시판</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>
			<!-- end col -->
			<li>
				<div class="col-md-2 col-sm-6 nopad last">
					<div class="home-service c4"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;"
						onclick="location.href='nlist.no'">
						<img src="resources/images/quickMenu2.png" style="width: 90px;">
						<p>공지사항</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>
			<li>
				<div class="col-md-2 col-sm-6 nopad last">
					<div class="home-service c4"
						style="background-color: #dfe8ea; height: 145px; padding: 7px;"
						onclick="location.href='bslist.bs'">
						<img src="resources/images/quickMenu7.png" style="width: 90px;">
						<p>중고 서적</p>
					</div>
					<!-- end home-service -->
				</div>
			</li>
			<!-- end col -->
		</ul>
	</section>
	<!-- 메뉴바 end-->

	<!-- 공지사항, 로그인 -->
	<section class="section"
		style="padding-top: 50px; padding-bottom: 20px;">
		<div class="col-md-2"></div>
		<div class="col-md-5 notice nopad">
			<b style="padding-left: 15px;">공지사항</b> <a href="nlist.no"
				class="more" title="More" style="float: right; padding-right: 10px;"><img
				src="resources/images/more.gif" alt="더보기" style="width: 15px;"></a>
			<ul id="t" style="padding-left: 10px;">
				<!-- li 태그로 공지사항 제목 들어가는 부분 -->
			</ul>
		</div>
		<div class="col-md-1"></div>


		<!-- 로그인 -->
		<c:if test="${ empty sessionScope.loginUser }">
			<form class="lForm" action="userlogin.ul" method="post">

				<div class="col-md-3"
					style="border: 1px solid lightgray; width: 330px; padding: 10px;">
					<label for="uname"><b>Student Id</b></label> <input class="lInput"
						type="text" placeholder="Enter Student Id" name="member_Id"
						required style="height: 40px;"> <label for="psw"><b>Password</b></label>
					<input class="lInput" type="password" placeholder="Enter Password"
						name="member_Password" required style="height: 40px;">

					<button class="lButton" type="submit">Login</button>
					<a href="userpasswordfind.ul">비밀번호를 잊으셨나요?</a>
				</div>
			</form>
		</c:if>

		<c:if test="${ !empty sessionScope.loginUser }">
			<div class="col-md-3"
				style="border: 1px solid lightgray; padding: 0px; margin-top: 25px; height: 294px;">
				<img src="resources/images/logo.png"
					style="display: block; width: 150px; margin-left: auto; margin-right: auto; padding-top: 30px;" />
				<div style="text-align: center; padding-top: 30px;">
					<b>${ loginUser.member_Name }</b>님, 반갑습니다.
				</div>
				<div style="text-align: center; padding-top: 30px;">
					<button class="lButton" type="button"
						onclick="location.href='userinformationcheck.ul'"
						style="width: 40%; height: 40px; display: inline; padding-top: 8px;">개인
						정보</button>
					<button class="lButton" type="button"
						onclick="location.href='logout.ul'"
						style="margin-left: 5px; width: 40%; height: 40px; display: inline; padding-top: 8px;">로그아웃</button>
				</div>
			</div>
		</c:if>
	</section>
	<!-- 공지사항, 로그인  end -->
	<!-- 공지사항 인덱스 리스트 -->
	<script>
		function topList() {
			$
					.ajax({
						url : "topList.no",
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#t").html("");
							var str = "";
							for ( var i in data) {
								str += '<li style="height:52px;"><span class="type2">NEW</span>';
								str += '<a href="ndetail.no?nId='
										+ data[i].nId
										+ '">'
										+ (decodeURIComponent(data[i].nTitle
												.replace(/\+/g, " "))) + '</a>';
								str += '</li>';
							}
							console.log(str);
							$("#t").html(str);
						}
					});
		}
		$(function() {
			topList();
			setInterval(function() {
				topList();
			}, 15000);
		});
	</script>




	<!-- 열람실 & 신착도서 & 중고서적 -->
	<section class="section"
		style="padding-top: 35px; padding-bottom: 80px; padding-left: 60px;">
		<!-- 열람실 좌석현황 -->
		<div class="col-md-2" style="margin-left: 30px;">
			<div class="readingR ">
				<b>열람실 좌석현황</b>
				<ul id="seatStat" style="padding-left: 0px;">
					<li style="text-align: center; padding-top: 15px;"><span
						class="num" style="color: red;">잔여좌석</span> / 총 좌석</li>
					<li class="book" style="margin-top: 10px; text-align: center;">
						<p style="display: inline; font-size: 17px; padding-left: 0px;">
							<img src="resources/images/readingIcon2.png"
								style="width: 25px; padding-right: 8px;"><b>A</b> 열람실
						</p>
						<p id="aTitle" title="A열람실 : 344석" style="display: inline;">
							<span class="num numA" style="font-size: 17px;">344</span>/<span
								class="total" style="font-size: 17px;">160</span>
						</p>
					</li>

					<li class="book" style="margin-top: 10px; text-align: center;">
						<p style="display: inline; font-size: 17px; padding-left: 0px;">
							<img src="resources/images/readingIcon2.png"
								style="width: 25px; padding-right: 8px;"><b>B</b> 열람실
						</p>
						<p id="bTitle" title="B열람실 : 176석" style="display: inline;">
							<span class="num numB" style="font-size: 17px;">46</span>/<span
								class="total" style="font-size: 17px;">140</span>
						</p>
					</li>

					<li class="com"
						style="margin-top: 10px; margin-bottom: 10px; text-align: center;">
						<p style="display: inline; font-size: 17px; padding-left: 0px;">
							<img src="resources/images/readingIcon2.png"
								style="width: 25px; padding-right: 8px;"><b>C</b> 열람실
						</p>
						<p id="cTitle" title="C열람실 : 148석, 노트북 사용가능"
							style="display: inline;">
							<span class="num numC" style="font-size: 17px;">29</span>/<span
								class="total" style="font-size: 17px;">140</span>
						</p>
					</li>
				</ul>
			</div>
		</div>

		<!-- 신착도서 top -->
		<div class="col-md-4 notice nopad" style="margin-left: 60px;">
			<b style="padding-left: 15px;">신착도서</b><a
				href="selectList.bk?searchOption=" +'title'+"&search="+' '"
				class="more" title="More" style="float: right; padding-right: 10px;"><img
				src="resources/images/more.gif" alt="더보기" style="width: 15px;"></a>
			<ul id="nb"
				style="max-width: 564px; padding-left: 0px; display: flex; border-top: 1px solid #878787;">
				<!-- 도서 이미지 -->
			</ul>
		</div>

		<!-- 중고서적 top -->
		<div class="col-md-4 notice nopad" style="margin-left: 60px;">
			<b style="padding-left: 15px;">중고서적</b><a href="bslist.bs"
				class="more" title="More" style="float: right; padding-right: 10px;"><img
				src="resources/images/more.gif" alt="더보기" style="width: 15px;"></a>
			<ul id="d"
				style="max-width: 564px; padding-left: 0px; display: flex; border-top: 1px solid #878787;">
				<!-- 중고서적 이미지 -->
			</ul>
		</div>
	</section>
	<!-- 열람실 & 신착도서 & 중고서적 end -->
	<!-- 좌석현황 -->
	<script>
		function countSeat() {
			$.ajax({
				url : "cSeat.ss",
				success : function(data) {
					console.log(data);
					var countA = data[0];
					var countB = data[1];
					var countC = data[2];

					$("#aTitle").attr("title", "A열람실 : " + countA + "석");
					$("#bTitle").attr("title", "B열람실 : " + countB + "석");
					$("#cTitle").attr("title",
							"C열람실 : " + countC + "석, 노트북 사용가능");

					$(".numA").text(countA);
					$(".numB").text(countB);
					$(".numC").text(countC);

				},
				error : function(data) {
					console.log(data);
				}

			});
		}

		$(function() {
			countSeat();
			setInterval(function() {
				countSeat();
			}, 10000);
		});
	</script>
	<!-- 좌석현황 끝 -->

	<!-- 중고서적 탑 리스트 -->
	<script>
		function topList1() {
			$
					.ajax({
						url : "topList.bs",
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#d").text("");
							var str = "";
							for ( var i in data) {
								str += '<ul style="padding-left: 5px; list-style-type:none; padding-top: 10px; width: 140px; height: 170px;">';
								str += '<a href="'
										+ "bsdetail.bs?brBnumber="
										+ data[i].brBnumber
										+ '"><span class="img"><span class="bookKind" style="position: absolute; background: url(resources/images/신착도서.png); background-size: 100%; z-index: 100; width: 30px; height: 316px; color: #fff; font-size: 13px; padding-top: 5px; background-repeat: no-repeat; text-align: center;">신착</span>';
								str += '<li class="imgBox ebook-details nopad">';
								str += '<img alt="" src="resources/bsuploadFiles/'
										+ data[i].renameFileName + '"';
								str += ' style="width: 100%; height: auto; padding-left:10px;" class="img-respive">';
								str += '<li style="padding-left:25px; padding-top: 9px;">'
										+ data[i].brPrice + '원</div>';
								str += '</a>';
								str += '</li>';
								str += '</span>';
								str += '</ul>';
							}
							console.log(str);
							$("#d").append(str);
						}
					});
		}
		$(function() {
			topList1();
			setInterval(function() {
				topList1();
			}, 15000);
		});
	</script>

	<!-- 유용한 싸이트 링크 슬라이드 -->
	<section style="background-color: white; padding-top: 20px;">
		<div id="logoSlider"
			style="border-top: 1px solid #dadada; border-bottom: 1px solid #dadada;">
			<div class="MS-content">
				<div class="item">
					<a href="http://www.nl.go.kr/nl/" target="_blank" title="국립중앙도서관">
						<img src="resources/images/국림중앙도서관.jpg" alt="국립중앙도서관"
						onmouseover="bannerMouse('resources/images/국림중앙도서관2.jpg', this);"
						onmouseout="bannerMouse('resources/images/국림중앙도서관.jpg', this);">
					</a>
				</div>
				<div class="item">
					<a href="http://scholar.ndsl.kr" target="_blank" title="NDSL">
						<img src="resources/images/NDSL.jpg" alt="NDSL"
						onmouseover="bannerMouse('resources/images/NDSL2.jpg', this);"
						onmouseout="bannerMouse('resources/images/NDSL.jpg', this);">
					</a>
				</div>
				<div class="item">
					<a href="http://lib.dankook.ac.kr/dcollection/" target="_blank"
						title="전국대학학위논문"> <img src="resources/images/전국대학학위논문.jpg"
						alt="전국대학학위논문"
						onmouseover="bannerMouse('resources/images/전국대학학위논문2.jpg', this);"
						onmouseout="bannerMouse('resources/images/전국대학학위논문.jpg', this);">
					</a>
				</div>
				<div class="item">
					<a href="http://www.fric.kr" target="_blank" title="FRIC 외국학술지지원센터">
						<img src="resources/images/RISSFRIC.jpg" alt="FRIC 외국학술지지원센터"
						onmouseover="bannerMouse('resources/images/RISSFRIC2.jpg', this);"
						onmouseout="bannerMouse('resources/images/RISSFRIC.jpg', this);">
					</a>
				</div>
				<div class="item">
					<a href="https://www.nanet.go.kr/main.do" target="_blank"
						target="_blank" title="국회도서관"> <img
						src="resources/images/국회도서관.jpg" alt="국회도서관"
						onmouseover="bannerMouse('resources/images/국회도서관2.jpg', this);"
						onmouseout="bannerMouse('resources/images/국회도서관.jpg', this);">
					</a>
				</div>
				<div class="item">
					<a href="http://www.medlis.kr/index.do" target="_blank"
						title="MEDLIS"> <img src="resources/images/MEDLIS.jpg"
						alt="MEDLIS"
						onmouseover="bannerMouse('resources/images/MEDLIS2.jpg', this);"
						onmouseout="bannerMouse('resources/images/MEDLIS.jpg', this);">
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Include jQuery -->
	<script src="resources/js/jquery-2.2.4.min.js"></script>
	<!-- Include Multislider -->
	<script src="resources/js/multislider.min.js"></script>

	<!-- Initialize element with Multislider -->
	<script>
		$('#logoSlider').multislider({
			continuous : true,
			duration : 4000
		});

		function bannerMouse(imgPath, obj) {
			$(obj).prop('src', imgPath);
		}
	</script>
	<!-- 동수 수정 시작 -->
	<script>
		// 도서 신청
		function checkLogin() {
			var id = '${ loginUser.member_Name }';

			if (id != "") {
				location.href = "requestBook.bk";
			} else {
				alert('로그인이 필요한 기능입니다.');
				location.href = "loginForm.ul";
			}
		}

		// 대출/연장
		function checkLogin2() {
			var id = '${ loginUser.member_Name }';

			if (id != "") {
				location.href = "borrowBookList.bk";
			} else {
				alert('로그인이 필요한 기능입니다.');
				location.href = "loginForm.ul";
			}
		}

		/* 신작도서 */
		function newBookList() {
			$
					.ajax({
						url : "newBookList.bk",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#nb").text("");
							var str = "";
							for ( var i in data) {
								str += '<ul style="padding-left: 5px; list-style-type:none; padding-top: 10px; width: 140px; height: 170px;">';
								str += '<a href="'
										+ "bookdetailIndex.bk?bNo="
										+ data[i].bNo
										+ "&bISBN="
										+ data[i].bISBN
										+ '"><span class="img"><span class="bookKind" style="position: absolute; background: url(resources/images/신착도서.png); background-size: 100%; z-index: 100; width: 30px; height: 316px; color: #fff; font-size: 13px; padding-top: 5px; background-repeat: no-repeat; text-align: center;">신착</span>';
								str += '<li class="imgBox ebook-details nopad">';
								str += '<img alt="누락" src="resources/BOOK_IMG/'
								+ data[i].bIMG + '"';
						str += ' style="width: 115px; height: 160px; padding-left:10px;" class="img-respive"/></li>';
								str += '<li style="padding-left:25px; padding-top: 9px;"><b>'
										+ data[i].bName + '</b></li>';
								str += '</a>';
								str += '</span>';
								str += '</ul>';
							}
							console.log(str);
							$("#nb").append(str);
						}
					});
		}
		$(function() {
			newBookList();
			setInterval(function() {
				topList1();
			}, 15000);
		});
	</script>
	<!-- 동수 수정 끝 -->

	<c:import url="WEB-INF/views/common/footer.jsp"></c:import>

</body>

</html>