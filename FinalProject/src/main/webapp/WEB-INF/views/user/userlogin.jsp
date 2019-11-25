<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
               <h2>로그인</h2>
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
               <form class="contactform" action="userlogin.ul" method="post">
                  <div class="form-group">
                     <input type="text" class="form-control" id="id" name="member_Id"
                        placeholder="id" required>
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" id="password"
                        name="member_Password" placeholder="password" required>
                  </div>

                  <input type="submit" class="btn btn-transparent" value="로그인" style="background:white;"/>
                  <c:url var="upasswordfind" value="userpasswordfind.ul"/>
                  <a class="btn btn-transparent" onclick="location.href='${upasswordfind}'">비밀번호찾기</a>
                  
               </form>
            </div>
            <!-- end col -->

            <div class="col-md-4"></div>
            <!-- end col -->
         </div>
         <!-- end row -->
      </div>
      <!-- end container -->
      
      	<div id = "myModal5">
		<!-- Button trigger modal -->
		<button type="button" id = "mButton1" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter5" style = "display : none;">
  		
		</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="false">
  			<div class="modal-dialog modal-dialog-centered" role="document">
    			<div class="modal-content" style = "margin-top : 300px; width : 500px;">
      				<div class="modal-header" style = "width : 500px; text-align : center;">
       					 <h3 class="modal-title" id="exampleModalLongTitle" style = "display : inline;">Message!</h3>
        				 <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "display : inline;">
          				 	<span aria-hidden="true">&times;</span>
        				 </button>
   				    </div>
     			   
     			    <div class="modal-body"  style = "text-align : center;">
     			    	<br>
        				<p id = "mMessage1" style = "font-size : 20px; color : black;">아이디와 비밀번호를 확인해주세요!<p>
        				
      				</div>
      		
      				<div class="modal-footer">
        				<button type="button" id = "mB1" class="btn btn-secondary" data-dismiss="modal" style = "float : left ; margin-left : 140px; width : 200px;" onclick = "" >확인</button>        				
      				</div>
    			</div>
  			</div>
		</div>
		
	</div>
   </section>
   
   	
		<!-- 수진쓰 추가부분 -->
	

   <jsp:include page="../common/footer.jsp" />
   
   
      
</body>

	<script>
		 $(function(){
			check = Number(${ checkL }) ;
			console.log("checkL" + check);
			
			if(check != 0){
				$("#mButton1").trigger("click");
				
			}
		});
	</script>
</html>