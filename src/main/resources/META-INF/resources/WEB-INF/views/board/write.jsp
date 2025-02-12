<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>

<!-- 글쓰기 페이지 스타일링 -->
<style type="text/css">
    /* 전체 글쓰기 화면 스타일 */
    .board-write-container {
        width: 50%; /* 폼 크기 줄이기 */
        margin: 40px auto;
        padding: 30px;

        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .board-write-container h1 {
        text-align: center;
        font-size: 2rem;
        margin-bottom: 30px;
        font-weight: 700;
    }

    .board-write-container form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    /* 제목과 작성자 양옆 배치 */
    .form-group-horizontal {
        display: flex;
        justify-content: space-between;
        gap: 20px;
    }

    .form-group-horizontal label {
        flex: 1;
        text-align: left;
    }

    .form-group-horizontal input {
        flex: 2;
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .board-write-container label {
        font-size: 1.1rem;
        font-weight: bold;
    }

    .board-write-container input, .board-write-container textarea {
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .board-write-container input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .board-write-container input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .board-write-container a {
        text-align: center;
        font-size: 1.2rem;
        color: #007bff;
        text-decoration: none;
        display: block;
        margin-top: 20px;
    }

    .board-write-container a:hover {
        text-decoration: underline;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .form-group input[type="file"] {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .form-group textarea {
        width: 100%;
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ddd;
        border-radius: 5px;
        height: 150px;
    }
</style>

</head>
<body>
<sec:authentication property="principal.username" var="username"/>
<div class="board-write-container">
    <h1>글쓰기</h1>
    <form action="boardwrite" method="post" enctype="multipart/form-data">
        <!-- 제목과 작성자를 양옆에 배치 -->
        <div class="form-group-horizontal">
            <label for="title">제목</label>
            <input type="text" name="title" id="title" required>
        </div>

        <div class="form-group-horizontal">
            <label for="author">작성자</label>
            <input type="text" name="author" id="author" required readonly value="${username }">
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea name="content" id="content" required></textarea>
        </div>

        <div class="form-group">
            <label for="image">첨부파일 (이미지)</label>
            <input type="file" id="image" name="image" class="form-control" accept="image/*">
        </div>

        <div class="form-group">
            <input type="submit" value="저장">
        </div>
    </form>

    <a href="list">목록으로 돌아가기</a>
</div>

</body>
</html>
