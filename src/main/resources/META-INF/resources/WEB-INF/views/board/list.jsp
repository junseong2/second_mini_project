<%@page import="com.exam.dto.BoardDTO"%>
<%@page import="com.exam.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>

	<h1>게시판 목록보기</h1>
	<hr>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<!-- findAll을 순회하여 각 BoardDTO의 num을 출력 -->
        <c:forEach var="dto" items="${findAll}">
            <tr>
                <td>${dto.num}</td>
         <td>
            <!-- num을 사용하여 링크 연결 -->
            <a href="retrieve?num=${dto.num}">${dto.title}</a>
        </td>
                <td>${dto.author}</td>
                <td>${dto.writeday}</td>
                <td>${dto.readcnt}</td>
            </tr>
        </c:forEach>

	<a href="boardwrite">글쓰기</a>




</body>
</html>