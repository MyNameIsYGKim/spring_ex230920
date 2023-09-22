<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno" value=${boardInfo.bno } readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value=${boardInfo.title }></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value=${boardInfo.writer }></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents">${boardInfo.contents }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="text" name="image" value=${boardInfo.image }></td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td><input type="date" name="updatedate" value='<fmt:formatDate value="${boardInfo.updatedate }" pattern="yyyy-MM-dd"/>'></td>
			</tr>
		</table>
		<button type="button" id="updateBtn">수정</button>
		<button type="button" onclick="location.href='boardInfo?bno=${boardInfo.bno}'">취소</button>
	</form>
	<script>
		$('#updateBtn').on('click', updateAjax);
		
		function updateAjax(e){
			let updateData = getBoardInfo();
			
			$.ajax('boardUpdate', {
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(updateData)
			})
			.done(result => {
				if(result['result']){
					alert('정상적으로 수정되었습니다.');
				}else{
					alert('수정에 실패했습니다.');
				}
			})
			.fail(reject => console.log(reject));
		}
		
		function getBoardInfo(){
			let formData = $('form').serializeArray(); // 입력태그 배열
			
			let formObj = {};
			$.each(formData, function(idx, obj){
				// 각 입력태그 -> 하나의 필드로 변환
				formObj[obj.name] = obj.value;
			});
			
			return formObj;
		}
	</script>
</body>
</html>




