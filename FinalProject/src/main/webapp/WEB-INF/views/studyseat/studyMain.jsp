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

	<section class="section normalhead">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
                        <h2>열람실/스터디룸</h2>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </section>
        <!-- end section -->

        <section class="section" style="height: 750px;">
            <div class="container" style="padding-top: 50px;">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="pricing-box clearfix" style = " margin-right: 50px; cursor: pointer;" focusable = "true"  onclick="location.href='seatList.ss'">
                            <!-- end pricing-header -->
                            <div class="pricing-top secondch" style ="padding-top: 0; height : 300px; border-radius: 20px;">                                
                                <p><br><br>열람실<br><br>자리선택 / 예약</p>
                            </div>

                        </div>
                        <!-- end pricing-box -->
                    </div>
                    <!-- end col -->



                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="pricing-box clearfix"  style = " margin-right: 50px; cursor: pointer;" focusable = "true"  onclick="location.href='srDay.sr'">
                            <!-- end pricing-header -->
                            <div class="pricing-top sevench" style = "padding-top: 0; height : 300px; border-radius: 20px;">
                             
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