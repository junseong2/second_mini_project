<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.exam.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>글자세히 보기</h1>
  <form action="#" method="post">
   글번호: ${retrieve.num } <br>
   작성일: ${retrieve.writeday }  <br>
   조회수: ${retrieve.readcnt }  <br>
   제목: <input type="text" name="title" value="${retrieve.title } "> <br>
   작성자: <input type="text" name="author" value="${retrieve.author } "> <br>
   내용: <textarea rows="10" cols="20" name="content">${retrieve.content } </textarea><br>
  </form>
  <a href="list">목록</a>
</body>
</html>