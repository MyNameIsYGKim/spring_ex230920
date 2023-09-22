<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Form</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<!-- <form action="" method="post" enctype="multipart/form-data"> -->
	<div>
		<input type="file" name="uploadFile" multiple>
		<!-- multiple: 여러개 파일을 입력받을지 등. 필수아님 -->
		<button class="uploadBtn">Submit</button>
	</div>
	<!-- </form> -->


	<script>
		$('.uploadBtn').click(function() {
			var formData = new FormData(); //FormData 객체 생성
			var inputFile = $("input[type='file']");

			var files = inputFile[0].files; // files : 실제 파일에 대한 정보.
			//files : 선택한 모든 파일을 나열하는 FileList 객체입니다.
			//multiple 특성을 지정하지 않닸다면 두 개 이상의 파일을 포함하지 않습니다.

			for (var i = 0; i < files.length; i++) {
				console.log(files[i]);
				formData.append("uploadFiles", files[i]);//키,값으로 append 
			}
			
			// 실제 업로드 Ajax
			/* 자바 스트립트 : fetch
			fetch('uploadsAjax',{
				method : 'post',
				body : formData
			})
			.then(response => response.json())
			.then(data => console.log(data))
			.catch(err => console.log(err));
			 */
			//jQuery.ajax
	           $.ajax({
	               url: 'uploadsAjax',	
	               type: 'POST',
	               processData: false,	//기본값은 true, ajax 통신을 통해 데이터를 전송할 때, 기본적으로 key와 value값을 Query String으로 변환해서 보냅니다.
	               contentType: false,	// multipart/form-data타입을 사용하기위해 false 로 지정합니다.
	               data: formData,               
	               success: function(result){
	                   for(let image of result){
						   let path = '${pageContext.request.contextPath}/images/' + image;
						   let imgTag = $('<img/>').prop('src', path);
						   $('div').append(imgTag);
					   }
	               },
	               error: function(reject){	
	                   console.log(reject);
	               }
	           }); 
		});
	</script>
</body>
</html>











