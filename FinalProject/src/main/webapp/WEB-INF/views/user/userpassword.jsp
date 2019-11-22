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
               <h2>비밀번호 수정</h2>
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
            <div class="col-md-4"></div>

            <div class="col-md-4">
               <form action="userpassword.ul" role="form" class="contactform">
                  <input type="hidden" name="member_Id"
                     value="${ loginUser.member_Id }"/>
                  <div class="form-group">
                     <input type="text" class="form-control" id="password" placeholder="현재 비밀번호를 입력해주세요." required/>
                        <div class="alert alert-success" id="alert-success1">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger1">비밀번호가 일치하지 않습니다.</div>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" id="password1" name="member_Password" placeholder="새 비밀번호를 입력해주세요." required/>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" id="password2" name="member_Password1" placeholder="새 비밀번호를 다시 입력해주세요." required/>
                        <div class="alert alert-success" id="alert-success2">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지 않습니다.</div>
                  </div>
                  <script>
                     $(function(){
                        $("#alert-success1").hide();
                        $("#alert-danger1").hide();
                        $("input").keyup(function(){
                           var pwd1 = $("#password").val();
                           var pwd2 = "${ loginUser.member_Password }";
                           if(pwd1 != "" || pwd2 != ""){
                              if(pwd1 == pwd2){
                                 $("#alert-success1").show();
                                 $("#alert-danger1").hide();
                                 $("#check").removeAttr("disabled");
                              } else {
                                 $("#alert-success1").hide();
                                 $("#alert-danger1").show();
                                 $("#check").attr("disabled","disabled");
                              }
                           }
                        });
                     });
                     $(function(){
                        $("#alert-success2").hide();
                        $("#alert-danger2").hide();
                        $("input").keyup(function(){
                           var pwd1 = $("#password1").val();
                           var pwd2 = $("#password2").val();
                           if(pwd1 != "" || pwd2 != ""){
                              if(pwd1 == pwd2){
                                 $("#alert-success2").show();
                                 $("#alert-danger2").hide();
                                 $("#check").removeAttr("disabled");

                              } else {
                                 $("#alert-success2").hide();
                                 $("#alert-danger2").show();
                                 $("#check").attr("disabled","disabled");
                                 
                              }
                           }
                        });
                     });
                  </script>
                  <input type="submit" id="check" class="btn btn-transparent" value="수정하기" style="background: white;"/>
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

   <jsp:include page="../common/footer.jsp" />

</body>
</html>