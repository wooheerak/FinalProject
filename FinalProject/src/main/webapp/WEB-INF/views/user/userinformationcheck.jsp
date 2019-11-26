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
               <h2>회원 정보 조회</h2>
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
      
      <div class="col-md-2" style="margin-left: 50px; border-radius: 30px; diplay:inline;">
					<div class="pricing-box clearfix">
						<div class="pricing-header firstch">
							<h4>도서 관리</h4>
						</div>
						<!-- end pricing-header -->
	
						<!-- end pricing-top -->
						<div class="pricing-details" style="text-align: center;">
							<ul>
								<div class="menuContent" focusable="true" onclick="location.href='userinformationcheck.ul'">내 정보 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='borrowBookList.bk'">대출 내역 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='myseatList.ss'">열람실/스터디룸 이용내역 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='selectRequestBook.bk'">도서 신청 조회</div>
								<div class="menuContent" focusable="true" onclick="location.href='#'">BOOKSALES<br>거래 내역</div>
								<div class="menuContent" focusable="true" onclick="location.href='reservationBookView.bk'">도서 예약 내역</div>
							</ul>
						</div>
						<!-- end pricing-details -->
					</div>
					<!-- end pricing-box -->
				</div>
      <div class="container">
         <div class="row">
         
            <div class="col-md-2">
            </div>
      
            <div class="col-md-5 text-left">
               <form role="form" class="contactform" action="userUpdate.ul">
                  <div class="form-group">
                     <p>학번</p>
                     <input type="text" class="form-control" name="member_number" readonly value="${ loginUser.member_Id }" style="background: rightgray;">
                  </div>
                  <div class="form-group">
                     <p>이름</p>
                     <input type="text" class="form-control" name="member_name" readonly value="${ loginUser.member_Name }" style="background: rightgray;">
                  </div>
                  <div class="form-group">
                     <p>핸드폰 번호</p>
                     <input type="text" class="form-control" name="Phone" readonly value="${ loginUser.phone }" style="background: rightgray;">
                  </div>
                  <div class="form-group">
                     <p>이메일</p>
                     <input type="text" class="form-control" name="member_Email" readonly value="${ loginUser.member_Email }" style="background: rightgray;">
                  </div>
                  <div class="form-group">
                     <p>주소</p>
                     <input type="text" class="form-control"   name="address" readonly value="${ loginUser.address }" style="background: rightgray;"/>
                  </div>
                      <c:url var="mUpdate" value="mUpdate.ul"/>
                      <a class="btn btn-transparent" onclick="location.href='${mUpdate}'">회원정보수정</a>
               </form>
            </div>
            
            
            <!-- end col -->

            <div class="col-md-4">
            </div>
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