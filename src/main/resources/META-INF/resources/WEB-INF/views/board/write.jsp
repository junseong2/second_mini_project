<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기 화면</h1>
	<form action="boardwrite" method="post">
		제목: <input type="text" name="title"> <br>
		작성자: <input type="text" name="author"> <br>
		내용: <textarea rows="10" cols="20" name="content"></textarea><br>
		<input type="submit" value="저장">
	</form>
	<a href="list">목록</a>

</body>
</html>