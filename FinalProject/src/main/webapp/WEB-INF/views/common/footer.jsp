<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#footer {
font-size: 15px;
font-weight: bold;
}
</style>
</head>
<body>
	<!-- footer는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들어주자 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	
	<footer class="footer primary-footer ">
            <div class="container ">
                <div class="row ">
                    <div class="col-md-3 col-sm-4 ">
                    </div>
                    <!-- end col -->
                    <div class="col-md-6 col-sm-6 col-xs-12 text-center ">
                        <p id="footer">2019 &copy;The StudyHub.lib All rights reserved.</p>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </footer>
        <!-- end primary-footer -->
        
        <!-- jQuery Files -->
    <script src="resources/js/bootstrap.min.js "></script>
    <script src="resources/js/parallax.js "></script>
    <script src="resources/js/animate.js "></script>
    <script src="resources/js/owl.carousel.js "></script>
    <script src="resources/js/custom.js "></script>
</body>
</html>