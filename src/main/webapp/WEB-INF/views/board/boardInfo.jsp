<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 정보</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<td>${boardInfo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${boardInfo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardInfo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td width="2" height="3">${boardInfo.contents }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<c:choose>
				<c:when test="${not empty boardInfo.image }">
					<!-- <td><img src="${pageContext.request.contextPath}/resources/image/${boardInfo.image }" /></td> -->
					<td><img style="width: 100%;" src="<c:url value="/resources/image/${boardInfo.image }" />"></td>
				</c:when>
				<c:otherwise>
					<td>${boardInfo.image }</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>작성일자</th>
			<td><fmt:formatDate value="${boardInfo.regdate }"
					pattern="yyyy/MM/dd" /></td>
		</tr>
	</table>
	<button type="button" onclick="location.href='boardUpdate?bno=${boardInfo.bno }'">수정</button>
	<button type="button" onclick="location.href='boardDelete?bno=${boardInfo.bno }'">삭제</button>
</body>
</html>