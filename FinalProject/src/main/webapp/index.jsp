<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyHub.lib</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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

	<!-- 신착도서 -->
	<section class="section bt">
		<div class="container  text-center">
			<div style="width: 330px;">
				중고서적
				<div id="d" class="owl-carousel owl-theme lightcasestudies withhover">
					<!-- 중고서적 이미지 -->
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->

				<script>
					function topList(){
						
						$.ajax({
						url: "topList.bs",
						dataType: "json" ,
						success: function(data){
							
							console.log(data);
							
							$("#d").text("");
					
							var str = "";
							
							for (var i in data){

								str +='<div class="item-carousel">';
								str +='<div class="case-box">';
								str +='<img alt="" src="resources/bsuploadFiles/'+ data[i].renameFileName +'"';
								str +=' style="width: 60px; height: 100;" class="img-respive">';
								str +='<div class="magnifier">';
								str +='<a href="'+ "bsdetail.bs?brBnumber=" + data[i].brBnumber +'"><i class="fa fa-link"></i></a>';
								str +='</div>';
								str +='</div>';
								str +='</div>';

							}
														
							console.log(str);
							$("#d").append(str);
							$('.item-carousel').first().addClass('active');
						
							}
						});
					}
					
					
					$(function(){
						topList();
						
						setInterval(function(){
							topList();
						}, 15000);
					});
					
				</script>
				
	<c:import url="WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>