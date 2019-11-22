<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:import url="../common/header.jsp"></c:import>

   <section class="section normalhead lb">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
               <h2>PASSWORD</h2>
            </div>
            <!-- end col -->
         </div>
         <!-- end row -->
      </div>
      <!-- end container -->
   </section>
   <!-- end section -->

   <section class="section overfree">
      <div class="icon-center">
         <i class="fa fa-code"></i>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-md-6">
               <div class="design-title text-left">
                  <small>본인 인증이 완료되었습니다.</small>
                  <h2>임시비밀 번호가 발송되었습니다.</h2>
                  <p class="lead">로그인 후 비밀번호를 변경해주세요!!!</p>
                  <p></p>
                  <a class="btn btn-transparent" onclick="location='index.jsp'">홈으로</a>
                  <c:url var="ulogin" value="userlogin.ul" />
                  <input class="btn btn-transparent"  onclick="location.href='${ulogin}'" value="로그인" style="background: white;" />
               </div>
               <!-- end website-design -->
            </div>
            <!-- end col -->

            <div class="col-md-3 mb30"></div>
            <!-- end col -->
         </div>
         <!-- end row -->
      </div>
      <!-- end container -->
   </section>
   <!-- end section -->


   <jsp:include page="../common/footer.jsp" />

</body>
</html>