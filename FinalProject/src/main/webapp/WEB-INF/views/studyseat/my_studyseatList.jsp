<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 좌석 조회</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script>

	

	jQuery(function($) {
		$("#seatList").DataTable({
	         // 표시 건수기능 숨기기
	         "lengthChange" : true,
	         // 정보 표시 숨기기
	         "info" : true,
			 "ordering": false ,
			 "filter" : false ,
			 "lengthChange" : false , 
	           // 정렬
	            "order": [],
	            
	         // 페이지 넘기는 방식
	         pagingType : "full_numbers",

	         // n번째 항목 넓이를 300px로 설정
	         columnDefs : [ {
	            targets : 0,
	            width : 40
	         }, {
	            targets : 1,
	            width : 300
	         } ],

	         "language" : {
	            "emptyTable" : "데이터가 없어요.",
	            "lengthMenu" : "페이지당 _MENU_ 개씩 보기",
	            "info" : "현재 _START_ - _END_ / _TOTAL_건",
	            "infoEmpty" : "데이터 없음",
	            "infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
	            "search" : "검색: ",
	            "zeroRecords" : "일치하는 데이터가 없어요.",
	            "loadingRecords" : "로딩중...",
	            "processing" : "잠시만 기다려 주세요...",
	            "paginate" : {
	               "next" : ">",
	               "previous" : "<" , 
	               "last" : ">>" ,
	               "first" : "<<" 
	            	  
	            }
	         }
	   
		});
	});
	

</script>


</head>

<body>
    
    
    
    <c:import url="../common/header.jsp"></c:import> 
 	
	<div id="wrapper">       

       
        <section class="section normalhead">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
                        <h2>개인정보조회</h2>
                        <p class="lead">열람실/스터디룸 이용내역 조회</p>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </section>
        <!-- end section -->

        <!-- 메뉴바 -->
        <section class="section" >
            <div class="col-md-2 col-sm-12 " style="margin-left: 135px; border-radius: 30px;">
                <div class="pricing-box clearfix" >
                    <div class="pricing-header firstch">
                        <h4>개인 정보 조회</h4>
                    </div>
                    <!-- end pricing-header -->

                    <!-- end pricing-top -->
                    <div class="pricing-details" style="text-align: center;">
                        <ul>
                            <!-- <span><i class="fa fa-check"></i></span> -->
                            <div class = "menuContent" focusable="true">내 정보 조회</div>
                            <div class = "menuContent" focusable="true">대출 내역 조회</div>
                            <div class = "menuContent" focusable="true" onclick = "location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
                            <div class = "menuContent" focusable="true">도서 신청 조회</div>
                            <div class = "menuContent" focusable="true">BOOKSALES<br>거래 내역</div>
                            <!-- <li>Sector and Competitor Analysis <span><i class="fa fa-check"></i></span></li> -->

                        </ul>
                    </div>
                    <!-- end pricing-details -->

                </div>
                <!-- end pricing-box -->
            </div>

           <!-- 공지사항 -->
	<div class="container col-md-8 col-sm-12" style="margin-left: 20px;">
		<div class="dropdown portfolio-filter">
			<button class="btn  dropdown-toggle" type="button"
				data-toggle="dropdown"
				style="float: left; border-radius: 2px; width: 160px; text-align: center; background: white; border: 1px solid lightgray;">
				<p class="isStudy" style="display: inline;">열람실/스터디룸</p>
				<span class="fa fa-angle-down" style="display: inline;"></span>
			</button>
			<ul class="dropdown-menu" style="margin-top: 40px;">
				<li><a class="seat" href="#" data-filter="*"
					style="text-align: center;">열람실</a></li>
				<li>
					<a class="studyroom" href="mystudyroomList.sr"
					data-filter=".cat1" style="text-align: center;">스터디룸</a>
				</li>
			</ul>
		</div>
		<!-- 수정 확인하기 -->

		<!-- end dropdown -->

               
                
                <br><br>
                <hr>
                
                <div id = "myModal2">
                	<button type="button" id = "cancelModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter2" style = "display : none;">
					  이건 예약 모달
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content" style = "margin-top : 300px; width : 500px;">
					      <div class="modal-header" style = "width : 500px; text-align : center;" >
					        <h3 class="modal-title" id="exampleModalLongTitle" style = "display : inline;">예약 취소 Message !</h3>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "display : inline;">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" style = "text-align : center; font-size : 30px;">
					      	<br>
					        <b><p id = "seatId1" style = "display : inline; font-size : 30px;"></p></b><small style = "display : inline;">번 좌석예약을 취소하시겠습니까?</small>
					        <br><br>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-dismiss="modal" style = "background : #0080FF; color : white; float : left ; margin-left : 130px;" onclick = "cancelSeat(this);">확인</button>
					        <button type="button" class="btn btn-primary" data-dismiss="modal" style = "background : lightgray ; margin-right : 115px; ">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
                </div>
                <form action = "" method="post">
				<div id = "mySeat">
                    <table id = "seatList" class="table table-striped table-hover" style = "text-align: center;">
                        <thead >
                            <tr>
                                <th style = "text-align: center;">번호</th>
                                <th style = "text-align: center;">이용 내역</th>
                                <th style = "text-align: center;">처리상태</th>
                                <th style = "text-align: center;">입실시간</th>
                                <th style = "text-align: center;">퇴실시간</th>
                                <th style = "text-align: center;"></th>                               
                            </tr>
                     	</thead>
                        
                        
                        
                        <tbody id = "sContent">
                           
                           <c:forEach var="sh" items="${ list }" varStatus = "status" >
                           		
                           		<tr>
                           			<td>${ status.count }</td>
                           			<td>${ sh.seat.ss_floor }열람실[ ${ sh.seat.ss_no }번 ]</td>
                           			<c:if test='${ sh.shStatus eq "E" }'>
                           				<td>만료</td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "R" }'>
                           				<td>예약인증 전</td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "U" }'>
                           				<td>사용중</td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "C" }'>
                           				<td>예약 취소</td>
                           			</c:if>
                           			
                           			<td>${ sh.startTime }</td>
                           			<td>${ sh.endTime }</td>
                           			
                           			<c:if test='${ sh.shStatus eq "E" }'>
                           				<td></td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "U" }'>
                           				<td></td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "C" }'>
                           				<td></td>
                           			</c:if>
                           			
                           			<c:if test='${ sh.shStatus eq "R" }'>
                           				<td><button id = "cb${ sh.seat.ss_no }" type = "button" class = "btn cancelRev" onclick = "cancelModal(this);"  value = "${ sh.seat.ss_no }" >예약 취소</button></td>
                           			</c:if>
                           			
                           		</tr>	
                           </c:forEach>
                        </tbody>
                    </table>
				 </div>
                </form>
            </div>

        </section>
        <!-- end section -->
        </div>
        	`
        <script>
        		
       
		
        
        
        		var cancelId = 0 ;
        		var str = "";
        		
        		
        		 $(".seat").on("click" , function(){
                     
                     
                     $.ajax({
 						url : "seatListAjax.ss" , 				
 						success : function(data){
 							console.log(data);
 							
 						
 							$(".isStudy").text("열람실");
 							
 							
 	                        
 	                        $("#sContent").text("");
 								
 							for(var i in data){
 								
 								str +=  '<tr>' ;
 								str +=  ('<td>' + (Number(i)+1) + '</td>');
 								str +=  ('<td>' + data[i].seat.ss_floor + "열람실" + '[ ' + data[i].seat.ss_no + '번 ]</td>');
 								
 								if(data[i].shStatus == "E"){
 									str += '<td>만료</td>';
 								}
 								else if(data[i].shStatus == "R"){
 									str += '<td>예약인증 전</td>' ;
 								}
 								else if(data[i].shStatus == "U"){
 									str += '<td>사용중</td>' ;
 								}
 								else if(data[i].shStatus == "C"){
 									str += '<td>예약 취소</td>' ;
 								}
 								
 								str += ('<td>' + data[i].useDate + '</td>');
 								
 								if(data[i].shStatus == "E"){
 									str += '<td></td>';
 								}
 								
 								else if(data[i].shStatus == "U"){
 									str += '<td></td>';
 								}
 								
 								else if(data[i].shStatus == "C"){
 									str += '<td></td>';
 								}
 								
 								else if(data[i].shStatus == "R"){
 									str += '<td><button id = "cb' + data[i].seat.ss_no +'" type = "button" class = "btn cancelRev" onclick = "cancelModal(this);" value = "' + data[i].seat.ss_no +'" >예약 취소</button></td>' ;
 								}
 										
 								str += '</tr>';
 								
 							}
 							
 							
 							$("#sContent").append(str);
 							location.reload();
 							
 												
 							
 						} ,
 						error : function(error){
 							console.log(error);
 						}
 						
 					});
                     
                     
                 });

                 $(".studyroom").on("click", function(){
                     $(".isStudy").text("스터디룸");
                 });
                 
		        function cancelSeat(obj){									
					console.log(cancelId);
					
					$.ajax({
						url : "cancelResv.ss" ,
						data : { cancelId : cancelId } ,
						success : function(data){
							console.log(data);
							
					
							
							str = "";
 						
							$("#sContent").text("");
							
							for(var i in data){
								
								str +=  '<tr>' ;
								str +=  ('<td>' + (Number(i)+1) + '</td>');
								str +=  ('<td>' + data[i].seat.ss_floor + "열람실" + '[ ' + data[i].seat.ss_no + '번 ]</td>');
								
								if(data[i].shStatus == "E"){
									str += '<td>만료</td>';
								}
								else if(data[i].shStatus == "R"){
									str += '<td>예약인증 전</td>' ;
								}
								else if(data[i].shStatus == "U"){
 									str += '<td>사용중</td>' ;
 								}
 								else if(data[i].shStatus == "C"){
 									str += '<td>예약 취소</td>' ;
 								}
								
								
								str += ('<td>' + data[i].useDate + '</td>');
								
								if(data[i].shStatus == "E"){
									str += '<td></td>';
								}
								else if(data[i].shStatus == "U"){
 									str += '<td></td>';
 								}
 								
 								else if(data[i].shStatus == "C"){
 									str += '<td></td>';
 								}
								else if(data[i].shStatus == "R"){
									str += '<td><button id = "cb' + data[i].seat.ss_no +'" type = "button" class = "btn cancelRev" onclick = "cancelModal(this);" value = "' + data[i].seat.ss_no +'" >예약 취소</button></td>' ;
								}
										
								str += '</tr>';
								
							}
							
							
 							$("#sContent").append(str);
							
 							location.reload();
 							
							
						} ,
						error : function(error){
							console.log(error);
						}
						
					});
				}
		        
		        function cancelModal(obj){
		        	
		        	cancelId = $(obj).val();
		        	$("#seatId1").text($(obj).val());
		        	$("#cancelModal").trigger("click");
		        }
        </script>

	
	<jsp:include page="../common/footer.jsp"/>

</body>

</html>
