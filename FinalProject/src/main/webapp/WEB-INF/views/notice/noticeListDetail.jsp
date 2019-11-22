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
			<div class="noticeDetail">	
				<div class="noticeInfo"
					style="background-color: #f3f3f3; border: 1px solid #e6e6e6; border-top: 1px solid #b3b3b3; padding: 20px;">
					<p class="noticeInfoTitle">
						<b style="font-size: 24px;">${ n.nTitle }</b>
					</p>
					<p class="writeInfo text-right" style="font-size: 18px;">
						${ n.nCreateDate }&nbsp;&nbsp;&nbsp;&nbsp;<span>조회&nbsp;${ n.nCount }</span>
					</p>
					<dl class="writerInfo text-right">
						<dd class="writer" style="font-size: 18px;">
							<span>${ n.nWriter }</span>
						</dd>
					</dl>
				</div>
				<div class="noticeContent"
					style="border: 1px solid #e6e6e6; border-top: none; padding: 20px; font-size: 18px;">
					${ n.nContent }
				</div>
				
				<c:if test="${ !empty n.originalFileName }">
					<div style="padding: 20px; border: 1px solid #e6e6e6; border-top: none; border-bottom: 1px solid #b3b3b3; vertical-align: middle;">
						<i class="fa fa-file"></i>&nbsp;&nbsp;&nbsp;<a href="${ contextPath }/resources/nuploadFiles/${ n.renameFileName }" download="${ n.originalFileName }">${ n.originalFileName }</a>
              		 	<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. -->
					</div>
				</c:if>

			</div>
			<br>
			<br>
			<div class="text-center">
			    <c:url var="updateView" value="nupView.no">
			       <c:param name="nId" value = "${ n.nId }"/>
			    </c:url>
			    
 				<c:if test="${ loginUser.member_Name eq n.nWriter }">
					<a href="${ updateView }" class="btn btn-transparent">수정</a>
				</c:if>
			    
				
				<a href="nlist.no" class="btn btn-transparent">목록</a>
			</div>
		</div>



	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>