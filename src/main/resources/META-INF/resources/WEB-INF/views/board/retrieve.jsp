<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.exam.dto.BoardDTO"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
	    $("#updateBtn").on("click", function(){
	    	//event.preventDefault();
	    	var f = $("#updateBoard")[0];
	    	f.action="updateBoard";
	    	f.method="GET";
	    });
	    
	    $("#deleteBtn").on("click", function(){
	    	//event.preventDefault();
	    	var f = $("#updateBoard")[0];
	    	f.action="deleteBoard";
	    	f.method="GET";
	    });
	    
	    
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>글자세히 보기</h1>
  <form id="updateBoard" action="#" method="post">
  <input type="hidden" name="num" value="${retrieve.num }">
   글번호: ${retrieve.num } <br>
   작성일: ${retrieve.writeday }  <br>
   조회수: ${retrieve.readcnt }  <br>
   제목: <input type="text" name="title" value="${retrieve.title } "> <br>
   작성자: <input type="text" name="author" value="${retrieve.author } "> <br>
   내용: <textarea rows="10" cols="20" name="content">${retrieve.content } </textarea><br>
   <button id="updateBtn">수정</button>
   <button id="deleteBtn">삭제</button>
  </form>
  <a href="list">목록</a>
</body>
</html>