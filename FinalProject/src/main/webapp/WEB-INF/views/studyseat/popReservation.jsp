<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 좌석 예약</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
</head>

<body style = "background : white;">
    
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link rel="stylesheet" href="resources/css/carousel.css">
	<link rel="stylesheet" href="resources/style.css">
   
 
 		<form action="updateR.ss"  >
	<div id="wrapper" >       
		<div class="container">
			<div style = "margin-left : 80px; margin-top : 50px;">
		    <b><p id = "seatId" style = "display : inline;">${ sNo }</p></b><small style = "display : inline;">번 좌석을 예약하시겠습니까?</small>
		    </div>
			<div class="row" style = "margin-left : 45px; margin-top : 50px;">         
		       <input type = "submit" id = "rSubmit" class="btn btn-transparent btn-lg okresv" style = "margin-right : 10px; background : white;" value = "O&nbsp;&nbsp;&nbsp;K"/>
		       <a  class="btn btn-transparent btn-lg cancel">Cancel</a>   
            </div>
        </div>
    </div>
  	  </form>

	<script >
		var sNo = ${ sNo };
		var floor = "${ floor }";
		
				
		$(".cancel").on("click" , function(){			
			window.close();
		});
		
		$(".okresv").on("click" , function(){		
			window.close();
			opener.location.href = "updateR.ss?sNo=" + sNo + "&floor=" + floor ;
			
		});
		
		
	</script>
	
	<script src="resources/js/jquery.min.js "></script>
    <script src="resources/js/bootstrap.min.js "></script>
    <script src="resources/js/parallax.js "></script>
    <script src="resources/js/animate.js "></script>
    <script src="resources/js/owl.carousel.js "></script>
    <script src="resources/js/custom.js "></script>

</body>

</html>