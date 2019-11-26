<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
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
		$("#orderList").DataTable({
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
<style>
#myModal{
	margin-top:300px;
}
</style> 
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
                            <div class = "menuContent" focusable="true">열람실/스터디룸 이용내역 조회</div>
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
                    <button class="btn  dropdown-toggle" type="button" data-toggle="dropdown" style = "float: left;border-radius: 2px; width : 160px ; text-align: center; background: white; border : 1px solid lightgray;">
                        <p class = "isStudy" style = "display: inline;">열람실/스터디룸</p>
                       <span class="fa fa-angle-down" style = "display: inline;"></span></button>
                    <ul class="dropdown-menu" style="margin-top:40px;">
                        <li><a class= "seat" href="myseatList.ss" data-filter="*" style="text-align: center;">열람실</a></li>
                        <li><a class= "studyroom" href="mystudyroomList.sr" data-filter=".cat1" style="text-align: center;">스터디룸</a></li>                       
                    </ul>
                </div><!-- end dropdown -->

                <script>
                    
                    $(".seat").on("click" , function(){
                        $(".isStudy").text("열람실");
                    });

                    $(".studyroom").on("click", function(){
                        $(".isStudy").text("스터디룸");
                    });
                </script>
                <br><br>
                <hr>
                <form action="" method="post">
                    <table id="orderList" name="orderList" class="table table-striped table-hover" style = "text-align: center;">
                        <thead >
                            <tr>
                                <th style = "text-align: center;">예약번호</th>
                                <th style = "text-align: center;">이용 내역</th>
                                <th style = "text-align: center;">참여자</th>
                                <th style = "text-align: center;">예약 시간</th>
                                <th style = "text-align: center;">날짜</th>
                                <th style = "text-align: center;">예약 상태</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="b" items="${list}">                      	
	                            <tr>
	                                <td>${b.so_no}</td>
	                                <td>${b.so_name} 스터디룸&nbsp;&nbsp;&nbsp;[${b.so_floor}층]</td>
	                                <td>${b.so_participant}</td>
	                                <td>${b.so_start_time}:00~${b.so_end_time}:00</td>
	                                <td>${b.so_date}</td>
	                                
	                                <!-- 예약 취소 버튼 -->
	                                
	                                <!-- 오늘정보 -->	                                
                                	<jsp:useBean id="now" class="java.util.Date"/>
                                	<!-- 현재 날짜 -->
                                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
                                	<!-- 현재 시간 -->
                                	<fmt:formatDate value="${now}" pattern="HH" var="nowHour" />
                                	
                                	<!-- 예약 일, 시작 시간과 현재를 비교 -->
                                	<c:choose>
                                		<c:when test="${b.so_status == 'n'}">
                                			<td><label >예약 취소 됨</label></td>
                                		</c:when>
                                		<c:when test="${b.so_date > nowDate}">
                                			<td><button type="button" class = "btn cancelRev" data-toggle="modal" data-target="#myModal" data-so_no="${b.so_no}">예약 취소</button></td>
                                		</c:when>
                                		<c:when test="${b.so_date == nowDate && nowHour < b.so_start_time}">
                                			<td><button type="button"  class = "btn cancelRev" data-toggle="modal" data-target="#myModal" data-so_no="${b.so_no}">예약 취소</button></td>
                                		</c:when>
                                		<c:otherwise>
                                			<td></td>
                                		</c:otherwise>
                                	</c:choose>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </form>
            </div>

        </section>
        <!-- end section -->
        </div>
        
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">스터디룸 예약 취소</h4>
      </div>
      <div class="modal-body">
        	정말로 예약을 취소 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="deleteOrder()">예약 취소</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

	
	<jsp:include page="../common/footer.jsp"/>

</body>
<script>
var so_no ="";
$(document).ready(function() {     
    $('#myModal').on('show.bs.modal', function(event) {          
    	so_no = $(event.relatedTarget).data('so_no');
    });
});

function deleteOrder(){
	console.log(so_no);
	 
	$.ajax({
		type 	: "POST",
		url		: "deleteOrder.sr",
		async	: false,
		data	: {
			so_no:so_no
		},
		success	:{
			
		}
		,error : {
			
		}
	});
	
	location.reload();
	self.close();
}
</script>

</html>