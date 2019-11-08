<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 좌석 조회</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row"> 
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>
						<strong>열람실</strong>조회
					</h2>
					<p class="lead">잠은 죽어서 자자...</p>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section bt overfree" style="padding: 40px 0px;">
		<div class="icon-center">
			<i class="fa fa-anchor"></i>
		</div>
		<div class="container">
			<div class="section-title text-center">
				<small>KH 대학교 도서관에 오신걸 환영합니다</small>
				<h3>열람실 좌석 조회페이지</h3>
				<hr>
			</div>
			<!-- end section-title -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section bt" style="padding: 30px 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-9 " style="height: 700px; display: inline;">
					<div class="service-box"
						style="height: 700px; border: 1px solid lightgray; border-radius: 4px; ">
						<div class="row window" style = "margin-left : 300px; maring-bottom : 20px;">
							<p style="margin-top: 10px; font-size: large;">창&nbsp;&nbsp;&nbsp;문</p>
						</div>
						<br>
						<div id = "seatList">
							<c:forEach var = "seat" items = "${ list }" varStatus="status">
								<c:if test = "${ (status.index % 20 == 0) }">
									<div class="row" style="margin-left: 20px; margin-right: 10px; margin-top: 5px;">
									
								</c:if>
								<c:if test = "${ status.index % 10 == 0 }">
									<c:if test = "${ status.index % 20 == 0 }">
										<div class="seatCharts-row" style="display: inline;">
									</c:if>
									<c:if test = "${ status.index % 20 != 0 }">
										<div class="seatCharts-row" style="display: inline; float : right;">
									</c:if>								
								</c:if>
								
								
								<c:if test = '${ seat.ss_use eq "N" }'>
									<div id="s${ seat.ss_no }" role="checkbox" onclick="clickSeat(this);"	aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell available">${ seat.ss_no }</div>
								</c:if>
									
								<c:if test = '${ seat.ss_use eq "Y" }'>
									<div id="s${ seat.ss_no }" role="checkbox" onclick="clickSeat(this);" aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell unavailable">${ seat.ss_no }</div>
								</c:if>
								
								
								<c:if test = "${ status.index != 0 && status.index % 10 == 9 }">
									</div>								
								</c:if>
								
								<c:if test = "${ status.index != 0 && status.index % 20 == 19 }">
									</div>								
								</c:if>
								
								<c:if test = "${ status.index != 0 && status.index % 40 == 39 }">
									<br>								
								</c:if>
								
								
						
								
							</c:forEach>
						</div>

						<div class="row door">
							<p style="margin-top: 10px; font-size: large;">출&nbsp;&nbsp;입&nbsp;&nbsp;문</p>
						</div>
					</div>
					<br>
				</div>


				<div class="col-md-3 col-sm-6" style="display: inline;">
					<form class="quoteform"
						style="border: 1px solid gray; border-radius: 4px;">
						<div class="pricing-header sixch">
							<b><p id="floor"
									style="font-size: 35px; color: white; display: inline;">${ floor }</p></b> <small
								style="color: white; display: inline;">열람실</small>
						</div>
						<br>
						<div class="service-box"
							style="border: 1px solid lightgray; height: 380px;">
							
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="A" >
								<b>A열람실</b> <br>
								<p id="a-floor" style="display: inline;">${ count[0] }</p>
								석/160석
							</div>
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="B" >
								<b>B열람실</b> <br>
								<p id="b-floor" style="display: inline;">${ count[1] }</p>
								석/120석
							</div>
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="C" >
								<b>C열람실</b> <br>
								<p id="c-floor" style="display: inline;">${ count[2] }</p>
								석/130석
							</div>
						</div>
						<div class="service-box"
							style="border: 1px solid lightgray; text-align: center;">
							<p style="display: inline;">좌석번호 :</p>
							<p id="seatNo" style="display: inline;"></p>
							번
							
						</div>
						<button type="button" class="btn btn-primary btn-block reset"
							style="width: 100px; padding-left: 4px; display: inline; margin-left: 3px; border-radius: 0px;">좌석
							다시 선택</button>
						<button type="button" class="btn btn-primary btn-block" onclick = "resvSeat();"
							style="width: 100px; display: inline; margin-top: 0px; margin-left: 10px; padding-left: 35px; border-radius: 0px;">예약</button>
					</form>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</section>
	<!-- end section -->
	<script>
		var seatId = "";
		var seatNo = 0;
		var check = 0;
		var floor = "";

		function clickSeat(obj) {
			if (check == 0) {
				if ($(obj).hasClass('available')) {
					console.log("available");
					seatNo = Number($(obj).text());
					seatId = "#" + $(obj).attr("id");
					console.log(seatId);
					$("#seatNo").text(seatNo);
					$(obj).removeClass("available");
					$(obj).addClass("selected");
					check = 1;

				} else if ($(obj).hasClass('selected')) {
					console.log("selected");

					$(obj).removeClass("selected");
					$(obj).addClass("available");
					check = 0;
					

				} else {
					console.log("unavailable");
				}
			} else {
				if (seatNo == Number($(obj).text())) {
					$(obj).removeClass("selected");
					$(obj).addClass("available");
					$("#seatNo").text("");

					check = 0;
				}

			}

		}

		$(".reset").on("click", function() {
			console.log(seatId);
			$("#seatNo").text("");
			$(seatId).removeClass("selected");
			$(seatId).addClass("available");

			check = 0;
			seatId = "";
		});

		
		
		
		
		
		/* 열람실 좌석 div부분 채우는 Ajax */
		$(".room").on("click", function(){
			floor = $(this).attr("value");
			$("#floor").text(floor);
			
			$.ajax({
				url : "slistAjax.ss" ,
				data : { floor : floor } ,
				dataType : "json" ,
				success : function(data){
					
					console.log(data);
					$("#a-floor").text(data.cList[0].count);
					$("#b-floor").text(data.cList[1].count);
					$("#c-floor").text(data.cList[2].count);
					
					$("#seatList").text("");
					
					var str = "";
					
					for(var i in data.sList){
						var no = data.sList[i].no;
						var floor = data.sList[i].floor;
						var use = data.sList[i].use;
						
						if(i % 20 == 0){
							str += '<div class="row" style="margin-left: 20px; margin-right: 10px; margin-top: 5px;">';							
						}	
						
						if(i % 10 == 0){
							if(i % 20 == 0){
								str += '<div class="seatCharts-row" style="display: inline;">';									
							}
							if(i % 20 != 0){
								str += '<div class="seatCharts-row" style="display: inline; float : right;">';								
							}
						}
						
						
						if(data.sList[i].use == "Y"){
							str  += '<div id="s'+ data.sList[i].no +'" role="checkbox"  aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell appendSeat unavailable">'+ data.sList[i].no + '</div>';							
						}						
						else if(data.sList[i].use == "N"){
							str += '<div id="s' + data.sList[i].no +'" role="checkbox"  aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell appendSeat available">' +  data.sList[i].no  + '</div>';							
						}
						
						
						
						if( i != 0 && i % 10 == 9){							
							str += '</div>';							
						}
						
						if( i != 0 && i % 20 == 19){							
							str += '</div>';							
						}
						
						if( i != 0 && i % 40 == 39){							
							str += '<br>';							
						}
						
					}
					
					$("#seatList").append(str);
					
				} ,
				error : function(data){
					
					console.log(data);
				}
				
				
				
			});
		});
		
		$(document).on("click", ".appendSeat"  ,function(){
			if (check == 0) {
				if ($(this).hasClass('available')) {
					console.log("available");
					seatNo = Number($(this).text());
					seatId = "#" + $(this).attr("id");
					console.log(seatId);
					$("#seatNo").text(seatNo);
					$(this).removeClass("available");
					$(this).addClass("selected");
					check = 1;

				} else if ($(this).hasClass('selected')) {
					console.log("selected");

					$(this).removeClass("selected");
					$(this).addClass("available");
					check = 0;
					

				} else {
					console.log("unavailable");
				}
			} else {
				if (seatNo == Number($(this).text())) {
					$(this).removeClass("selected");
					$(this).addClass("available");
					$("#seatNo").text("");

					check = 0;
				}

			}
		});
		
		
		function resvSeat(){
			var ss_no = seatNo;
			var url = "popResv.ss?ss_no=" + ss_no + "&floor=" + floor;
			var option = "width=400, height=250, resizable=no, scrollbars=no, status=no;";
			var popX =  ((window.screen.width / 2) - (500 / 2));
			var popY =  ((window.screen.height / 2) - (250 / 2));
			window.open(url , "", option + ", left = " + popX + ", top = " + popY);					
			
		}
		
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>

</html>