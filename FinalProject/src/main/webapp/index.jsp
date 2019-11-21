<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyHub.lib</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
/*공지사항*/
.notice {
	position: relative;
	float: left;
	width: 462px;
}

.notice>ul {
	border-top: 1px solid #878787;
}

.notice>ul>li {
	height: 43px;
	line-height: 44px;
	border-bottom: 1px solid #dedede;
	overflow: hidden;
}

.notice>ul>li>a {
	display: block;
	padding-left: 13px;
	margin-right: 10px;
	font-size: 15px;
	color: #666;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.notice>ul>li>a:hover {
	color: #00529c;
}

.notice .type2 {
	display: block;
	margin-top: 12px;
	margin-right: 10px;
	float: left;
	line-height: 19px;
	color: #fff;
	font-size: 13px;
	padding: 0 14px;
	background-color: #00529c;
}

/*열람실 좌석현황*/
.readingR{position: relative; margin-top: 22px;}
.readingR > ul{overflow: hidden;padding: 3px 9px 2px 12px;border: 1px solid #dedede;background-color: #f5f5f5;}
.readingR > ul li{float: left; line-height: 31px;}
.readingR > ul h3{float: left;width: 45px;text-align: left;font-size: 13px;color: #6d6d6d;}
.readingR > ul p{float: right;font-size: 13px; color: #6d6d6d;}
.readingR > ul p .num{color: #ff1857;}
.readingR .flr{float: right;}
.readingR .book p{padding-left: 28px;background: url(../../../../image/ko/local/main/readingIcon2.png) no-repeat 10px 7px;background-size:13px 16px;text-align: left;min-width: 52px;}
.readingR .com p{padding-left: 29px; background: url(../../../../image/ko/local/main/readingIcon1.png) no-repeat 6px 8px; background-size:19px 14px;}
.readingR .more{position: absolute; right: 0; top: 0;}
.readingR .more img{width: 13px; height: 13px;}
@media screen and (max-width:1116px){
	.readingR > ul{padding: 3px 8px 2px 8px;}
	.readingR .book p{padding-left: 24px;background: url(../../../../image/ko/local/main/readingIcon2.png) no-repeat 5px 7px;background-size:13px 16px;}
	.readingR .com p{padding-left: 25px; background: url(../../../../image/ko/local/main/readingIcon1.png) no-repeat 3px 8px; background-size:19px 14px;}
}



</style>

</head>

<body style="overflow-X: hidden">

	<c:import url="WEB-INF/views/common/header.jsp"></c:import>

	<!-- 검색바 -->
	<div class="" style="background-color: white;">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
				<form action="selectList.bk" class="calculateform"
					style="height: 120px; padding-top: 33px; background-color: rgb(19, 19, 94);">
					<div class="dorpdown dropdown" style="display: flex;">
						<SELECT name='searchOption'>
							<!-- 검색 컬럼 -->
							<OPTION value='title'>제목 검색</OPTION>
							<OPTION value='author'>저자 검색</OPTION>
							<OPTION value='publisher'>출판사 검색</OPTION>
							<OPTION value='ISBN'>ISBN 검색</OPTION>
						</SELECT> &nbsp;&nbsp; <input type="text" class="form-control"
							id="searchbar" name="search"
							style="height: 49.33px; width: 450px;" placeholder="검색어를 입력하세요">
						&nbsp;&nbsp; <input type="submit" name="send" value="검색"
							class="btn btn-default" style="height: 49.33px; width: 150px;" />
					</div>
				</form>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- 검색바 -->

	<section class="section nopad">
		<div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-3 col-sm-6 nopad first">
					<div class="home-service c1" style="background-color: #dfe8ea;">
						<i class="flaticon-competition"></i>
						<p>대출/연장</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad">
					<div class="home-service c2" style="background-color: #dfe8ea;">
						<i class="flaticon-chat"></i>
						<p>자료 요청</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad">
					<div class="home-service c3" style="background-color: #dfe8ea;"
						onclick="location.href='studymain.ss'">
						<i class="flaticon-medal"></i>
						<p>열람실/스터디룸</p>
					</div>
					<!-- end home-service -->
				</div>

				<div class="col-md-3 col-sm-6 nopad">
					<div class="home-service c3" style="background-color: #dfe8ea;"
						onclick="location.href='bList.bo'">
						<i class="flaticon-chat"></i>
						<p>스터디룸 게시판</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->

				<div class="col-md-3 col-sm-6 nopad last">
					<div class="home-service c4" style="background-color: #dfe8ea;">
						<i class="flaticon-medal"></i>
						<p>시설 안내</p>
					</div>
					<!-- end home-service -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<!-- 공지사항 -->
	<section class="section" style="padding-top: 80px;">
		<div class="col-md-1"></div>
		<div class="col-md-3 notice nopad">
			<b style="padding-left: 15px;">공지사항</b>
			<ul id="t" style="padding-left: 0px;">
				<!-- li 태그로 공지사항 제목 들어가는 부분 -->
			</ul>
		</div>
	</section>
	<!-- end section -->

	<!-- 공지사항 인덱스 리스트 -->
	<script>
		function topList() {

			$.ajax({
				url : "topList.no",
				dataType : "json",
				success : function(data) {

					console.log(data);
					$("#t").html("");

					var str = "";

					for ( var i in data) {
						str += '<li><span class="type2">일반</span>';
						str += '<a href="ndetail.no?nId='
								+ data[i].nId
								+ '">'
								+ (decodeURIComponent(data[i].nTitle.replace(
										/\+/g, " "))) + '</a>';
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
	<!-- 공지사항 인덱스 리스트 끝 -->

	<!-- 중고 신착 도서 리스트 -->
	<section class="section" style="padding-top:0px;">
		<div class="col-md-1"></div>
		<div class="col-md-3 nopad">
			<div style="width: 330px;">
				<b style="padding-left: 15px;">중고서적</b>
				<div id="d" style="display:flex;">
					<!-- 중고서적 이미지 -->
				</div>
			</div>
		</div>
	</section>
	
				<!-- 중고서적 탑 리스트 -->
				<script>
					function topList1(){
						
						$.ajax({
						url: "topList.bs",
						dataType: "json" ,
						success: function(data){
							
							console.log(data);
							
							$("#d").text("");
					
							var str = "";
							
							for (var i in data){
								str +='<div  style="padding-left: 10px;">';
								str +='<a href="'+ "bsdetail.bs?brBnumber=" + data[i].brBnumber +'"><span class="img"><span class="bookKind" style="position: absolute; background: url(resources/images/신착도서.png); background-size: 100%; z-index: 100; width: 30px; height: 316px; color: #fff; font-size: 13px; padding-top: 5px; background-repeat: no-repeat; text-align: center;">신착</span>';
								str +='<div class="imgBox ebook-details nopad">';
								str +='<img alt="" src="resources/bsuploadFiles/'+ data[i].renameFileName +'"';
								str +=' style="width: 100px; height: 140; padding-left:10px;" class="img-respive">';
								str +='</a>';
								str +='</div>';
								str +='</span>';
								str +='</div>';

							}
														
							console.log(str);
							$("#d").append(str);
						
							}
						});
					}
					
					
					$(function(){
						topList1();
						
						setInterval(function(){
							topList1();
						}, 15000);
					});
					
				</script>
		<section class="section" style="padding-top:0px;">
		<div class="col-md-4">
			<div class="readingR">
	   			 <h2>열람실 좌석현황</h2>
	   			 <ul id="seatStat" style="">
	     			   <li class="book">
	           			 <h3>1열람실</h3>
	          		     <p title="1열람실 : 344석"><span class="num">344</span>/<span class="total">344</span></p>
	   			       </li>
	     			   <li class="book flr">
	         		     <h3>2열람실</h3>
	    	        	 <p title="2열람실 : 176석"><span class="num">46</span>/<span class="total">176</span></p>
	      			   </li>
				       <li class="com">
				           <h3>3열람실</h3>
				           <p title="3열람실 : 148석, 노트북 사용가능"><span class="num">29</span>/<span class="total">148</span></p>
				       </li>
				       <li class="book flr">
				           <h3>4열람실</h3>
				           <p title="4열람실 : 278석"><span class="num">185</span>/<span class="total">278</span></p>
				       </li>
				       <li class="com">
				           <h3>6열람실</h3>
				           <p title="6열람실 : 54석, 노트북 사용가능"><span class="num">35</span>/<span class="total">54</span></p>
				       </li>
				       <li class="com flr">
				           <h3>법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학</h3>
				           <p title="법학열람실 : 133석, 노트북 사용가능"><span class="num">105</span>/<span class="total">133</span></p>
				       </li>
				 </ul>
			</div>
		</div>
		</section>
	
	<c:import url="WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>