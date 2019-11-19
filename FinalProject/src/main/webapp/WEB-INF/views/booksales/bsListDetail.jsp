<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 판매</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table td {
	padding: 20px;
}

table th {
	padding: 20px;
}
</style>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>중고 서적 판매</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->



	<section class="section overfree" style="padding: 30px 0px;">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">

			<div class="col-md-12" style="padding-top: 30px;">
				<div style="display: flex;">
					<div class="col-md-9">
						<b style="font-size: 30px; margin-left: 40px;">${ bs.brName }</b>
					</div>

					<div class="text-right col-md-3">조회수: ${ bs.brCount }</div>
				</div>
				<hr>

				<div class="col-md-3 text-center ebook-details row">
					<img alt="" src="resources/bsuploadFiles/${ bs.renameFileName }"
						style="width: 150px; height: 190;">
				</div>
				<div class="col-md-9">
					<div>
						<div>
							<b>저자 |</b>&nbsp;&nbsp;&nbsp;
							<p>${ bs.brWriter }</p>
						</div>
						<div style="display: flex;">
							<div>
								<b>출판사 |</b>&nbsp;&nbsp;&nbsp;
								<p>${ bs.brPublisher }</p>
							</div>
							<div style="margin-left: 205px;">
								<b>카테고리 |</b>&nbsp;&nbsp;&nbsp;
								<p>${ bs.brCategory }</p>
							</div>
						</div>
						<div style="display: flex;">
							<div>
								<b>발행날짜 |</b>&nbsp;&nbsp;&nbsp;
								<p>${ bs.brIssueDate }</p>
							</div>
							<div style="margin-left: 195px;">
								<b>ISBN |</b>&nbsp;&nbsp;&nbsp;
								<p>${ bs.brISBN }</p>
							</div>
						</div>
					</div>
					<div style="display: flex;">
						<div>
							<b>등록자</b>&nbsp;
							<p>${ bs.brMemberName }</p>
						</div>
						<div style="margin-left: 225px;">
							<b>등록날짜</b>&nbsp;
							<p>${ bs.brRegDate }</p>
						</div>
					</div>
					<div style="display: flex;">
						<div>
							<b>가격</b>&nbsp;
							<p>${ bs.brPrice }원</p>
						</div>
						<div style="margin-left: 220px;">
							<b>품질등급</b>
							<p>${ bs.brCondition }</p>
						</div>
						<div style="margin-left: 30px;">
							<!-- <i class="fa fa-thumbs-o-up fa-5x" aria-hidden="true"></i> -->
						</div>
					</div>
					<br>
					<table
						style="height: 120px; width: 780px; border: 1px solid lightgray;">
						<tr>
							<th>품질정보</th>
						</tr>
						<tr>
							<td>${ bs.brComment }</td>
						</tr>
					</table>
					<br>
				</div>
				<div class="text-center">
					<!-- 로그인 아이디 소유자가 NO 작성 시 -->
					<c:if test="${ loginUser.member_Name ne bs.brMemberName }">
						<a href="bslist.bs" class="btn btn-transparent" style="margin-left:100px;">목록</a>
						<c:url var="bsupView" value="bsupView.bs">
							<c:param name="brBnumber" value="${ bs.brBnumber }" />
						</c:url>

						<c:url var="complete" value="complete.bs">
							<c:param name="brBnumber" value="${ bs.brBnumber }" />
						</c:url>
						<button type="button" class="btn btn-transparent"
							style="background-color: white; margin-left: 150px;"
							data-toggle="modal" data-target=".bd-example-modal-lg">구매하기</button>
					</c:if>

					<!-- 로그인 아이디 소유자가 작성했을 시 -->
					<c:if test="${ loginUser.member_Name eq bs.brMemberName }">
						<c:url var="bsupView" value="bsupView.bs">
							<c:param name="brBnumber" value="${ bs.brBnumber }" />
						</c:url>
						<a href="${ bsupView }" class="btn btn-transparent" style="color:red;">수정</a>
						<a href="bslist.bs" class="btn btn-transparent" style="margin-left: 30px;">목록</a>

						<c:url var="complete" value="complete.bs">
							<c:param name="brBnumber" value="${ bs.brBnumber }" />
						</c:url>

						<button type="button" class="btn btn-transparent"
							style="background-color: white; margin-left: 150px;"
							data-toggle="modal" data-target=".bd-example-modal-lg">구매하기</button>
					</c:if>
				</div>



				<!-- Modal -->
				<div id="buymodal" class="modal fade bd-example-modal-lg"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content" style="margin-top: 200px;">
							<div class="modal-header"
								style="background-color: skyblue; border-radius: 4px;">
								<h3 class="modal-title" id="exampleModalLabel"
									style="color: white;">[주문하기]</h3>
								<button type="button" id="close" class="close"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div style="display: flex">
								<div class="modal-body" style="margin-left: 60px; width: 35%">
									<form class="w3-container">
										<p>
											<label>Name</label><input class="w3-input" type="text"
												value="${ loginUser.member_Name }">
										</p>
										<p>
											<label>Student ID</label> <input class="w3-input" type="text"
												value="${ loginUser.member_Id }">
										</p>
										<p>
											<label>Phone</label> <input class="w3-input" type="text"
												value="${ loginUser.phone }">
										</p>
										<p>
											<label>E-mail</label> <input class="w3-input" type="email"
												value="${ loginUser.member_Email }">
										</p>
									</form>
								</div>
								<div class="modal-body" style="margin-left: 25px; width: 40%;">
									<div>
										<b>결제상품</b>
									</div>
									<div style="display: flex; margin-top: 20px;">
										<div>
											<img alt=""
												src="resources/bsuploadFiles/${ bs.renameFileName }"
												style="width: 100px; height: 150;">
										</div>
										<div style="margin-left: 20px;">
											[${ bs.brCategory }]<br>${ bs.brName }
										</div>
									</div>
									<hr>
									<div style="display: flex;">
										<div>상품금액:</div>
										<div style="margin-left: 180px;">${ bs.brPrice }원</div>
									</div>
									<hr style="margin-top: 100px;">
									<div style="display: flex; color: red; margin-top: 20px;">
										<div>결제하실 금액:</div>
										<div style="margin-left: 147px;">${ bs.brPrice }원</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button id="checkout" type="button" class="btn btn-primary">주문하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 아임포트 결제 관련 -->
		<!-- jQuery -->
		<script type="text/javascript"
			src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript"
			src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

		<script>
			$('#checkout').click(function() {

				var IMP = window.IMP; // 생략가능.
				IMP.init("imp57445042"); // 발급받은 "가맹점 식별코드"

				IMP.request_pay({
					pg : ' html5_inicis', // version 1.1.0부터 지원.
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : 'StudyHub.lib 중고서적:  ${ bs.brName }',
					amount : '${ bs.brPrice }', //판매 가격
					buyer_email : '${ loginUser.member_Email }',
					buyer_name : '${ loginUser.member_Name }',
					buyer_tel : '${ loginUser.phone }',
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.\n';
						msg += '고유ID : ' + rsp.imp_uid + '\n';
						msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
						msg += '결제 금액 : ' + rsp.paid_amount + '\n';

						$("#close").trigger("click");
						alert(msg);
						location.href = "complete.bs?brBnumber=" + $
						{
							bs.brBnumber
						}
						+"&brStudentId=" + $
						{
							bs.brStudentId
						}
						;
					} else {
						var msg = '결제에 실패하였습니다. \n';
						msg += '에러내용 : ' + rsp.error_msg;

						alert(msg);

						$("#close").trigger("click");

					}

				});
			});
		</script>
		<!-- END 아임포트 -->

	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>
</html>