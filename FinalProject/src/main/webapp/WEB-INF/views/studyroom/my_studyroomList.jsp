<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
                <form id="boardForm" name="boardForm" method="post">

                    <table class="table table-striped table-hover" style = "text-align: center;">
                        <thead >
                            <tr>
                                <th style = "text-align: center;">번호</th>
                                <th style = "text-align: center;">이용 내역</th>
                                <th style = "text-align: center;">참여자</th>
                                <th style = "text-align: center;">예약 시간</th>
                                <th style = "text-align: center;">날짜</th>
                                <th style = "text-align: center;"></th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4</td>
                                <td>꽃채운 스터디룸&nbsp;&nbsp;&nbsp;[2층]</td>
                                <td>이동수,문아람,이혜진,윤동혁,최진호</td>
                                <td>09:00~11:00</td>
                                <td>2019-10-30</td>
                                <td><button class = "btn cancelRev" >예약 취소</button></td>
                                
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>마루 스터디룸&nbsp;&nbsp;&nbsp;[1층]</td>
                                <td>이동수,고슬지,최진호</td>
                                <td>12:00~13:00</td>
                                <td>2019-10-29</td>
                                <td></td>
                               
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>우주 스터디룸&nbsp;&nbsp;&nbsp;[3층]</td>
                                <td>최진호,최진수,이상은,이수진</td>
                                <td>10:00~11:00</td>
                                <td>2019-10-27</td>
                                <td></td>
                               
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>다솜 스터디룸&nbsp;&nbsp;&nbsp;[3층]</td>
                                <td>최진호,우희락,이동수,이성원,이수진,이상은,고슬지,안정식</td>
                                <td>14:00~16:00</td>
                                <td>2019-10-26</td>
                                <td></td>
                            
                            </tr>

                        </tbody>
                    </table>

                </form>
            </div>

        </section>
        <!-- end section -->
        </div>

	
	<jsp:include page="../common/footer.jsp"/>

</body>

</html>