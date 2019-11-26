<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 수정</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.13.0/standard-all/ckeditor.js"></script>
</head>
<style>
table{
border: 1px;

}

th {
background-color: #f3f3f3; border: 1px solid #e6e6e6; border-top: 1px solid #b3b3b3;
}
</style>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>중고서적 수정</h2>
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
			<form action="bsupdate.bs" method="post" enctype="Multipart/form-data">
				<table id="booksalesInsertTable" class="table" border="1">
					<tr>
						<input type = "hidden" name = "brBnumber" value = "${ br.brBnumber }"/>
						<th>책제목</th>
						<td>
							<input type="text" size="100%" name="brName" value="${ br.brName }">
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							
							<select name="brCategory" id="brCategory">
								<OPTION value='' >카테고리 선택</OPTION>
	                            <OPTION value='경상계열'>경상계열</OPTION>
	                            <OPTION value='인문/사회계열'>인문/사회계열</OPTION>
	                            <OPTION value='공학계열'>공학계열</OPTION>
	                            <OPTION value='어학계열'>어학계열</OPTION>
	                            <OPTION value='법학계열'>법학계열</OPTION>
	                            <OPTION value='의학/약학계열'>의학/약학계열</OPTION>
	                            <OPTION value='사법계열'>사법계열</OPTION>
	                            <OPTION value='예체능계열'>예체능계열</OPTION>
	                            <OPTION value='기타'>기타</OPTION>
							</select>
						</td>
					</tr>
					<tr>
						<th>작성자 학생번호</th>
						<td>
							<input type="text" name="brStudentId" value="${ br.brStudentId }">
						</td>
					</tr>
					<tr>
						<th>책저자</th>
						<td>
							<input type="text" name="brWriter" value="${ br.brWriter }">
						</td>
					</tr>
					<tr>
						<th>출판사</th>
						<td>
							<input type="text" name="brPublisher" value="${ br.brPublisher }">
						</td>
					</tr>
					<tr>
						<th>발행일자</th>
						<td>
							<input type="date" name="brIssueDate" value="${ br.brIssueDate }">
						</td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td>
							<input type="text" name="brISBN" value="${ br.brISBN }">
						</td>
					</tr>
					<tr>
						<th>책상태</th>
						<td>
							<select name="brCondition" id="brCondition">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>
							<input type="text" name="brPrice" value="${ br.brPrice }"> 원
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<!-- <textarea rows="20" cols="140" name="nContent" style="resize: none;"></textarea> -->
							<textarea cols="80" id="brComment" name="brComment" rows="10" data-sample-short>${ br.brComment }</textarea>
			                <script>
  // Don't forget to add CSS for your custom styles.
  CKEDITOR.addCss('figure[class*=easyimage-gradient]::before { content: ""; position: absolute; top: 0; bottom: 0; left: 0; right: 0; }' +
    'figure[class*=easyimage-gradient] figcaption { position: relative; z-index: 2; }' +
    '.easyimage-gradient-1::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 66, 174, 234, .72 ) 100% ); }' +
    '.easyimage-gradient-2::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 228, 66, 234, .72 ) 100% ); }');

  CKEDITOR.replace('brComment', {
    extraPlugins: 'easyimage',
    removePlugins: 'image',
    removeDialogTabs: 'link:advanced',
    toolbar: [{
        name: 'document',
        items: ['Undo', 'Redo']
      },
      {
        name: 'styles',
        items: ['Format']
      },
      {
        name: 'basicstyles',
        items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']
      },
      {
        name: 'paragraph',
        items: ['NumberedList', 'BulletedList']
      },
      {
        name: 'links',
        items: ['Link', 'Unlink']
      },
      {
        name: 'insert',
        items: ['EasyImageUpload']
      }
    ],
    height: 400,
    cloudServices_uploadUrl: 'https://33333.cke-cs.com/easyimage/upload/',
    // Note: this is a token endpoint to be used for CKEditor 4 samples only. Images uploaded using this token may be deleted automatically at any moment.
    // To create your own token URL please visit https://ckeditor.com/ckeditor-cloud-services/.
    cloudServices_tokenUrl: 'https://33333.cke-cs.com/token/dev/ijrDsqFix838Gh3wGO3F77FSW94BwcLXprJ4APSp3XQ26xsUHTi0jcb1hoBt',
    easyimage_styles: {
      gradient1: {
        group: 'easyimage-gradients',
        attributes: {
          'class': 'easyimage-gradient-1'
        },
        label: 'Blue Gradient',
        icon: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/gradient1.png',
        iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/hidpi/gradient1.png'
      },
      gradient2: {
        group: 'easyimage-gradients',
        attributes: {
          'class': 'easyimage-gradient-2'
        },
        label: 'Pink Gradient',
        icon: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/gradient2.png',
        iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/hidpi/gradient2.png'
      },
      noGradient: {
        group: 'easyimage-gradients',
        attributes: {
          'class': 'easyimage-no-gradient'
        },
        label: 'No Gradient',
        icon: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/nogradient.png',
        iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.13.0/examples/assets/easyimage/icons/hidpi/nogradient.png'
      }
    },
    easyimage_toolbar: [
      'EasyImageFull',
      'EasyImageSide',
      'EasyImageGradient1',
      'EasyImageGradient2',
      'EasyImageNoGradient',
      'EasyImageAlt'
    ]
  });
  </script>
							<P>※ 상세 이미지 내용에 붙여넣기 가능</P>
						</td>
					</tr>
					<tr>
						<th>
							첨부파일
							<p><font size="2">※ 책 표지 사진을 <br>첨부해 주세요<br>(최대 4kbyte)</font></p>
						</th>
						<td>
							<input type="file" name="reloadFile">
							<c:if test="${ !empty br.originalFileName }">
								<br>현재 업로드한 파일 : 
								<a href="${ contextPath }/resources/bsuploadFiles/${ br.renameFileName }" download="${ br.originalFileName }">
									${ br.originalFileName }
								</a>
							</c:if>
						</td>
					</tr>					
				</table>
				
				<div class="text-center">
					<c:url var="bsdelete" value = "bsdelete.bs">
						<c:param name="brBnumber" value="${ br.brBnumber }"/>
					</c:url>
					<input class="btn btn-transparent" type="submit" value="등록 하기" style="background-color: transparent;"> &nbsp;
					<button class="btn btn-transparent" style="background-color: transparent;" type = "button" onclick="location.href='${ bsdelete }'">삭제하기</button>
					<a href="bslist.bs" class="btn btn-transparent">목록</a>
				</div>
			</form>
		</div>
<!--  -->
	</section>
	<!-- end section -->
	
	<!-- 카테고리 selected 된 값 가져오기 -->
	<script>
	    var category = '${ br.brCategory }';
	    var str = "";
	    var index = -1;
	    for(var i = 0; i < 10 ; i++){
	    	str = "#brCategory option:eq("+ i +")" ;
	    	if($(str).val() == category){
	    		index = i ;
	    		break;
	    	} 	    	
	    }
	    str = "#brCategory option:eq("+ index +")"
	    $(str).attr("selected", "selected");
	</script>
	
	<!-- 책상테 selected 된 값 가져오기 -->
	<script>
		var category = '${ br.brCondition }';
		var str = "";
		var index = 1;
		for(var i = 0; i < 3; i++){
			str = "#brCondition option:eq("+ i +")";
			if($(str).val() == category){
				index = i;
				break;
			}
		}
		str = "#brCondition option:eq("+ index +")"
		$(str).attr("selected", "selected");
	</script>
	<!-- END SCRIPT -->

	<jsp:include page="../common/footer.jsp" />

</body>

</html>