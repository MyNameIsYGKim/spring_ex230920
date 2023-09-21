<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<form name="insertForm" action="boardInsert" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="text" name="image"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="button" onclick="location.href=boardList'">취소</button>

	</form>
	<script>
		$('[name="insertForm"]').on('submit', function(e){
			e.preventDefault();
			
			let title = $('[name="title"]');
			let writer = $('[name="writer"]');
			
			if(title.val() == ''){
				alert('제목이 입력되지 않았습니다.');
				title.focus();
				return;
			}
			
			if(writer.val() == ''){
				alert('작성자가 입력되지 않았습니다.');
				wrtier.focus();
				return;
			}
			
			alert('게시글이 등록되었습니다.');
			insertForm.submit();
		});
	</script>
</body>
</html>
















