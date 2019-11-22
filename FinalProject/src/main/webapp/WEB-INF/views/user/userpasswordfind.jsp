<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<body>
   <c:import url="../common/header.jsp"></c:import>

   <section class="section normalhead lb">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
               <h2>비밀번호 찾기</h2>
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
            <div class="col-md-4">
               <div class="contact-details"></div>
            </div>

            <div class="col-md-4">
               <form class="contactform" action="userpassword2.ul" method="post">
                  
                  <div class="form-group">
                     <input type="text" class="form-control" id="id"
                        name="member_Id" placeholder="id" required>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" id="name"
                        name="member_Name" placeholder="name" required>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" id="e-mail"
                        name="member_Email" placeholder="e-mail" required>
                  </div>

                  <input class="btn btn-transparent" type="submit" value="다음" style="background:white;">
                  
            
               </form>
            </div>
            <!-- end col -->

            <div class="col-md-4"></div>
            <!-- end col -->
         </div>
         <!-- end row -->
      </div>
      <!-- end container -->
   </section>
   
   <c:if test="${checkSep == 0 }">
      <script>
         alert("입력하신 정보가 일치하지 않습니다");
      </script>
   </c:if>

   <jsp:include page="../common/footer.jsp" />
   <script>
      function checkSep(){}
   </script>
</body>
</html>