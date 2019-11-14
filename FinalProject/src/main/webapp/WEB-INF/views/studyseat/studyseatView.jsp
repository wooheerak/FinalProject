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

	<section class="section bt " style="padding: 30px 0px;">
		<div class="container ">
			<div class="row" style = "">
				<div class="col-md-9 col-sm-6" style="height: 745px; display : inline;" >
					<div class="service-box"
						style="height: 745px; border: 1px solid lightgray; border-radius: 4px; ">
						
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
								
								<c:if test = '${ seat.ss_use eq "R" }'>
									<div id="s${ seat.ss_no }" role="checkbox" onclick="clickSeat(this);"	aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell reserved">${ seat.ss_no }</div>
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
								
								<c:if test = "${ status.index != 0 && status.index % 40 == 39 && status.index < 159 }">									
									<br>								
								</c:if>				
								
							</c:forEach>
							
							
						
						</div>

						<div class="row door">
							<p style="margin-top: 10px; font-size: large;">출&nbsp;&nbsp;입&nbsp;&nbsp;문</p>
						</div>
					
						
				
				
					</div>
					
					
				</div>		
				<div class="col-md-3 col-sm-6" style="display : inline;">
							<div class="quoteform"	style="border: 1px solid gray; border-radius: 4px; width : 262.5px ; height : 745px;">
								<div class="pricing-header sixch">
									<b><p id="floor" style="font-size: 35px; color: white; display: inline;">${ floor }</p></b>
									 <small	style="color: white; display: inline;">열람실</small>
								</div>
						        <br>
							<div class="service-box" style="border: 1px solid lightgray; height: 380px;">							
								<div class="service-box room" focusable="true"	style="text-align: center; cursor: pointer;" value="A" >
								<b>A열람실</b> <br>
								<p id="a-floor" style="display: inline;">${ count[0] }</p>
								석/160석
								</div>
								
								<div class="service-box room" focusable="true" 	style="text-align: center; cursor: pointer;" value="B" >
								<b>B열람실</b> <br>
								<p id="b-floor" style="display: inline;">${ count[1] }</p>
								석/140석
								</div>
								
								<div class="service-box room" focusable="true" 	style="text-align: center; cursor: pointer;" value="C" >
								<b>C열람실</b> <br>
								<p id="c-floor" style="display: inline;">${ count[2] }</p>
								석/140석
								</div>
							</div>
							
							<div class="service-box" style="border: 1px solid lightgray; text-align: center;">
							<p style="display: inline;">좌석번호 :</p>
							<p id="seatNo" style="display: inline;"></p>번						
							</div>
							
							<button type="button" class="btn btn-primary btn-block reset"
							style="width: 100px; padding-left: 4px; display: inline; margin-left: 3px; border-radius: 0px;">좌석
							다시 선택</button>
							
							<button type="button" class="btn btn-primary btn-block" onclick = "resvModal();"
							style="width: 100px; display: inline; margin-top: 0px; margin-left: 10px; padding-left: 35px; border-radius: 0px;">예약</button>
							
							<button type="button" class="btn btn-primary btn-block" onclick = "certModal();" style="width: 210px; display: inline; margin-top: 10px; margin-left: 5px; padding-left: 35px; border-radius: 0px;">
								좌석 예약 인증
							</button>
						</div>
					</div>	
				
	</section>
	<!-- end section -->
	<div id = "myModal">
		<!-- Button trigger modal -->
		<button type="button" id = "mButton" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style = "display : none;">
  		
		</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered" role="document">
    			<div class="modal-content" style = "margin-top : 300px; width : 500px;">
      				<div class="modal-header" style = "width : 500px; text-align : center;">
       					 <h3 class="modal-title" id="exampleModalLongTitle" style = "display : inline;">Message!</h3>
        				 <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "display : inline;">
          				 	<span aria-hidden="true">&times;</span>
        				 </button>
   				    </div>
     			   
     			    <div class="modal-body"  style = "text-align : center;">
     			    	<br>
        				<p id = "mMessage" style = "font-size : 20px;"><p>
        				
      				</div>
      		
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal" style = "float : left ; margin-left : 140px; width : 200px;">확인</button>        				
      				</div>
    			</div>
  			</div>
		</div>
		
	</div>
	
	<div id = "myModal1">
		<!-- Button trigger modal -->
		<button type="button" id = "popModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter1" style = "display : none;">
		  이건 예약 모달
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content" style = "margin-top : 300px; width : 500px;">
		      <div class="modal-header" style = "width : 500px; text-align : center;" >
		        <h3 class="modal-title" id="exampleModalLongTitle" style = "display : inline;">예약 확인 Message !</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "display : inline;">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style = "text-align : center; font-size : 30px;">
		      	<br>
		        <b><p id = "seatId" style = "display : inline; font-size : 30px;"></p></b><small style = "display : inline;">번 좌석을 예약하시겠습니까?</small>
		        <br><br>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" style = "background : #0080FF; color : white; float : left ; margin-left : 130px;" onclick = "resvSeat();">확인</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" style = "background : lightgray ; margin-right : 115px; ">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<div id = "myModal2">
		<!-- Button trigger modal -->
		<button type="button" id = "codeModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter2" style = "display : none;">
		  이건 예약 모달
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content" style = "margin-top : 300px; width : 500px;">
		      <div class="modal-header" style = "width : 500px; text-align : center;" >
		        <h3 class="modal-title" id="exampleModalLongTitle" style = "display : inline;">예약 인증 Message !</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "display : inline;">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style = "text-align : center; font-size : 30px;">
		      	<br>
		        <b><p id = "certMsg" style = "display : inline; font-size : 30px;"></p></b><small style = "display : inline;"></small>
		        <br><br>
		        <input type="text" id = "rCode" style = "width : 200px ; height : 50px;"/>
		        
		      </div>
		      <br>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal" style = "background : #0080FF; color : white; float : left ; margin-left : 130px;" onclick = "certSeat();">확인</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" style = "background : lightgray ; margin-right : 115px; ">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<script>
		var seatId = "";
		var seatNo = 0;
		var check1 = 0;
		var check2 = 0;
		var floor = "";

		/* function clickSeat(obj) {
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

		} */

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
					
					check2 = 0 ;
					
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
						else if(data.sList[i].use == "R"){
							str += '<div id="s' + data.sList[i].no +'" role="checkbox" 	aria-checked="false" focusable="true" tabindex="-1" class="seatCharts-seat seatCharts-cell appendSeat reserved">' + data.sList[i].no +'</div>';
						}
						
						
						
						if( i != 0 && i % 10 == 9){							
							str += '</div>';							
						}
						
						if( i != 0 && i % 20 == 19){							
							str += '</div>';							
						}
						
						if( i != 0 && i % 40 == 39 && i < 159){							
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
		
		var mStr = "";
		function clickSeat(obj) {
			
			
			
			$.ajax({
				url : "checkDup.ss" ,
				success : function(data){
					console.log(data);
					if(data == "notDup"){
						if (check1 == 0) {
							if ($(obj).hasClass('available')) {
								console.log("available");
								seatNo = Number($(obj).text());
								seatId = "#" + $(obj).attr("id");
								console.log(seatId);
								$("#seatNo").text(seatNo);
								$(obj).removeClass("available");
								$(obj).addClass("selected");
								check1 = 1;

							} else if ($(obj).hasClass('selected')) {
								console.log("selected");

								$(obj).removeClass("selected");
								$(obj).addClass("available");
								check1 = 0;
								

							} else {
								console.log("unavailable");
							}
						} else {
							if (seatNo == Number($(obj).text())) {
								$(obj).removeClass("selected");
								$(obj).addClass("available");
								$("#seatNo").text("");

								check1 = 0;
							}

						}
					}
					else if (data == "noUser"){
						$("#mMessage").text("로그인 후 이용해주세요 !");
						$("#mButton").trigger("click");
					}
					else {
						$("#mMessage").text("한 ID당 예약은 한번 가능합니다!");
						$("#mButton").trigger("click");
					}
				} ,
				error : function(error){
					console.log(error);
				}
			});
		}
		
		

		
		$(document).on("click", ".appendSeat"  ,function(){
			
			var element = this; 
			
			
			
			$.ajax({
				url : "checkDup.ss" ,
				success : function(data){
					console.log(data);
					if(data == "notDup"){
						if (check2 == 0) {
							if ($(element).hasClass('available')) {
								console.log("available");
								seatNo = Number($(element).text());
								seatId = "#" + $(element).attr("id");
								console.log(seatId);
								$("#seatNo").text(seatNo);
								$(element).removeClass("available");
								$(element).addClass("selected");
								check2 = 1;

							} else if ($(element).hasClass('selected')) {
								console.log("selected");

								$(element).removeClass("selected");
								$(element).addClass("available");
								check2 = 0;
								

							} else {
								
								console.log("unavailable");
							}
						} else {
							if (seatNo == Number($(element).text())) {
								$(element).removeClass("selected");
								$(element).addClass("available");
								$("#seatNo").text("");

								check2 = 0;
							}

						}
					}
					else if (data == "noUser"){
						$("#mMessage").text("로그인 후 이용해주세요 !");
						$("#mButton").trigger("click");
					}
					else {
						$("#mMessage").text("한 ID당 예약은 한번 가능합니다!");
						$("#mButton").trigger("click");
					}
				} ,
				error : function(error){
					console.log(error);
				}
			});
		});
		
		
		function resvModal(){
			$("#seatId").text(seatNo);
			$("#popModal").trigger("click");
			
		}
		
		function resvSeat(){
			location.href = "updateR.ss?sNo=" + seatNo + "&floor=" + floor ;
		}
		
		function certModal(){
			$.ajax({
				url : "selectsId.ss" ,
				success : function(data){
					console.log(data);
					
					if(data == 0){
						$("#certMsg").text("예약한 좌석이 없습니다 !");
						$("#rCode").hide();
					}
					else{
						$("#certMsg").text(data + "번 좌석 예약 인증")
						$("#rCode").show();
					}
					
					
					$("#codeModal").trigger("click");
					
				} ,
				error : function(error){
					console.log(error);
				}
			});
			
		}
		
		function certSeat(){
			
			var iCode = $("#rCode").val();
			
			$.ajax({
				
				url : "checkCode.ss" ,
				data : { iCode : iCode } ,
				success : function(data){
					
					console.log(data);
					if(data == "success"){
						$("mMessage").text("인증되었습니다!");
						$("#mButton").trigger("click");
						
						location.href="seatList.ss";
					}
					else{
						$("mMessage").text("인증코드가 틀립니다!");
						$("#mButton").trigger("click");
					}
					
					
				} ,
				error : function(error){
					
					console.log(error);
				}
				
			});
		}
		
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>

</html>