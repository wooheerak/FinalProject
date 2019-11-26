<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
			<form action="ninsert.no" method="post" enctype="Multipart/form-data">
				<table id="noticeInsertTable" class="table" border="1">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" size="100%" name="nTitle">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="nWriter" value="관리자" disabled>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<!-- <textarea rows="20" cols="140" name="nContent" style="resize: none;"></textarea> -->
							 <textarea cols="80" id="editor1" name="editor1"  rows="10" data-sample-short></textarea>
  <script>
  // Don't forget to add CSS for your custom styles.
  CKEDITOR.addCss('figure[class*=easyimage-gradient]::before { content: ""; position: absolute; top: 0; bottom: 0; left: 0; right: 0; }' +
    'figure[class*=easyimage-gradient] figcaption { position: relative; z-index: 2; }' +
    '.easyimage-gradient-1::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 66, 174, 234, .72 ) 100% ); }' +
    '.easyimage-gradient-2::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 228, 66, 234, .72 ) 100% ); }');

  CKEDITOR.replace('editor1', {
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
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="uploadFile"></td>
					</tr>					
				</table>
				
				<div class="text-center">
					<input class="btn btn-transparent" type="submit" value="등록 하기" style="background-color: transparent;"> &nbsp;
					<a href="nlist.no" class="btn btn-transparent">목록</a>
				</div>
			</form>
		</div>
<!--  -->
	</section>
	<!-- end section -->
<!--  -->
	<jsp:include page="../common/footer.jsp" />

</body>

</html>