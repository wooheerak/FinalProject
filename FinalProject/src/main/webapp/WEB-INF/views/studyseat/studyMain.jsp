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

	<section class="section normalhead">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
                        <h2>열람실/스터디룸</h2>
                        <p class="lead">열람실과 스터디룸 이용안내는 이용안내 페이지로 가주세요,,,</p>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </section>
        <!-- end section -->

        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="pricing-box clearfix" style = " margin-right: 50px; cursor: pointer;" focusable = "true"  onclick="location.href='seatList.ss'">
                            <div class="pricing-header firstch">
                                <h4></h4>
                            </div>
                            <!-- end pricing-header -->
                            <div class="pricing-top secondch" style = "padding-top: 0; height : 300px;">                                
                                <p><br><br>열람실<br><br>자리선택 / 예약</p>
                            </div>

                        </div>
                        <!-- end pricing-box -->
                    </div>
                    <!-- end col -->



                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="pricing-box clearfix"  style = " margin-right: 50px; cursor: pointer;" focusable = "true"  onclick="">
                            <div class="pricing-header sixch" >
                                <h4></h4>
                            </div>
                            <!-- end pricing-header -->
                            <div class="pricing-top sevench" style = "padding-top: 0; height : 300px;">
                             
                                <p><br><br><br>스터디룸 예약</p>
                            </div>
                            <!-- end pricing-top -->

                        </div>
                        <!-- end pricing-box -->
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->

                <br>

                <!-- end section-button -->
            </div>
            <!-- end container -->
        </section>
        <!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>