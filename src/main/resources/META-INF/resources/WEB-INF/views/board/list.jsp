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
<title>공지사항</title>

<!-- list.jsp 전용 스타일 -->
<style type="text/css">
    /* 페이지 스타일링 */
    .board-list-container {
        margin-top: 30px;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width:70%;
        margin : 0 auto;
    }

    .board-list-container h1 {
        text-align: center;
        font-size: 1.8rem;
        margin-bottom: 20px;
        font-weight:700;
    }

    .board-list-container table {
        width: 100%;
        margin-bottom: 20px;
        border-collapse: collapse;
    }

    .board-list-container table th, .board-list-container table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .board-list-container table th {
        background-color: #f8f9fa;
    }

    .board-list-container table a {
        color: #007bff;
        text-decoration: none;
    }

    .board-list-container table a:hover {
        text-decoration: underline;
    }

    .board-list-container .btn-add {
        display: block;
        margin: 30px auto;
        padding: 10px 20px;
        font-size: 1.1rem;
        color: white;
        background-color: #f0f0f0;
        border: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        width:20%;
        color:#737272;
    }

    .board-list-container .btn-add:hover {
        background-color: #0056b3;
    }
    
    .title {
    	width:50%;
    	text-align:left;
    }
</style>

</head>
<body>

<div class="board-list-container">
    <h1>NOTICE</h1>
    
    <hr>

    <!-- 게시판 목록 테이블 -->
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th class="title">제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <!-- findAll을 순회하여 각 BoardDTO의 num을 출력 -->
            <c:forEach var="dto" items="${findAll}">
                <tr>
                    <td>${dto.num}</td>
                    <td class="title">
                        <!-- num을 사용하여 링크 연결 -->
                        <a href="retrieve?num=${dto.num}">${dto.title}</a>
                    </td>
                    <td>${dto.author}</td>
                    <td>${dto.writeday}</td>
                    <td>${dto.readcnt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 글쓰기 버튼 -->
    <a href="boardwrite" class="btn-add">글쓰기</a>
</div>

</body>
</html>
