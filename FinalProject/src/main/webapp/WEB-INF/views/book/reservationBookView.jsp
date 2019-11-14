<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 예약현황</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
</head>

<body>
    
    
    
    <c:import url="../common/header.jsp"></c:import> 
 	
	<div id="wrapper">  

       
        <section class="section normalhead">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
                        <h2>개인 정보 조회</h2>
                        <p class="lead">도서 예약 관리</p>
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end section -->

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
                <br><br>
                <hr>
                <form id="boardForm" name="boardForm" method="post">

                    <table class="table table-striped table-hover" style = "text-align: center;">
                        <thead >
                            <tr>
                                <th style = "text-align: center;">도서 제목</th>
                                <th style = "text-align: center;">작 가</th>
                                <th style = "text-align: center;">예약 날짜</th>
                                <th style = "text-align: center;">만료 날짜</th>
                                <th style = "text-align: center;">대출 상황</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="r" items="${ list }">
	                        <tr>
                                <td>${r.bName }  </td>
                                <td>${r.bWriter }</td>
                                <td>${r.bookReservation.BV_DATE }</td>
                                <td>${r.bookReservation.BV_RETURN_DATE }</td>
                                <td>
                                	<p>대기</p>
                                	<c:if test="dateCalc() == 1">
                                		<p>대출 대기</p>
                                	</c:if>
        	                        <c:if test="dateCalc() == 0">
    	                            	<c:if test="${r.bookReservation.BV_STATUS } == 'N'">
    	                            		<p>기간 만료</p>
    	                            	</c:if>
    	                            	<c:if test="${r.bookReservation.BV_STATUS } == 'R'">
    	                            		<p>대출 완료</p>
    	                            	</c:if>
	                                </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </form>
            </div>

        </section>
        <!-- end section -->
        </div>

	<script>
		function dateCalc(){
			var currentDate = new Date();
			var finishDate = ${r.bookReservation.BV_RETURN_DATE };

			if(currentDate < finishDate){
				return 1;
			} else {
				return 0;
			}
		}
	</script>
	
	<jsp:include page="../common/footer.jsp"/>

</body>

</html>
