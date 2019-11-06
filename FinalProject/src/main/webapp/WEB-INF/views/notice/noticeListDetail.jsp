<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>공지사항</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<!-- 공지사항 -->


	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="boardDetail">
			
				<div class="boardInfo"
					style="background-color: #f3f3f3; border: 1px solid #e6e6e6; border-top: 1px solid #b3b3b3; padding: 20px;">
					<p class="boardInfoTitle">
						<b>${ n.nTitle }</b>
					</p>
					<p class="writeInfo text-right">
						${ n.nCreateDate }&nbsp;&nbsp;&nbsp;&nbsp;<span>조회&nbsp;${ n.nCount }</span>
					</p>
					<dl class="writerInfo text-right">
						<dd class="writer">
							<span>${ n.nWriter }</span>
						</dd>
					</dl>
				</div>
				<div class="boardContent"
					style="background-color: #fff; border: 1px solid #e6e6e6; border-top: none; padding: 20px; font-size: 13px;">
					${ n.nContent }
				</div>


			</div>
			<br>
			<br>
			<div class="text-center">
				<a href="nlist.no" class="btn btn-transparent">목록</a>
			</div>
		</div>



	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>