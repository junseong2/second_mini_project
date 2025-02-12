<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("#updateBtn").on("click", function(){
            var f = $("#updateBoard")[0];
            f.action="updateBoard";
            f.method="GET";
        });
        
        $("#deleteBtn").on("click", function(){
            var f = $("#updateBoard")[0];
            f.action="deleteBoard";
            f.method="GET";
        });
    });
</script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 수정 및 삭제</title>
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

        .board-write-container label {
            font-size: 1.1rem;
            font-weight: bold;
        }

        /* 2x2 표 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 9px;
            text-align: center;
            border: 1px solid #ddd;
            height: 10px; /* 모든 셀의 높이를 동일하게 맞춤 */
        }

        table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* 제목 및 내용 스타일 */
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        /* 제목 입력을 가로로 배치 */
        .form-group-horizontal {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-group-horizontal label {
            width: 100px; /* 제목 텍스트의 너비 */
            text-align: right;
        }

        .form-group input[type="text"], .form-group textarea {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%; /* 텍스트 입력창 너비를 전체로 설정 */
        }

        .form-group textarea {
            height: 150px;
        }

        /* 버튼 스타일 */
        .form-actions {
            text-align: center;
        }

        button {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 링크 스타일 */
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
    </style>
</head>

<body>
<div class="board-write-container">
    <h1>글 수정 및 삭제</h1>
    <form id="updateBoard" action="#" method="post" enctype="multipart/form-data">
        <input type="hidden" name="num" value="${retrieve.num }">
		<input type="hidden" name="author" value="${retrieve.author }">
		<input type="hidden" name="image" value="${retrieve.image }">
        <!-- 2x2 표 레이아웃 -->
        <table>
            <tr>
                <th>글번호</th>
                <td>${retrieve.num }</td>
                <th>조회수</th>
                <td>${retrieve.readcnt }</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${retrieve.writeday }</td>
                <th>작성자</th>
                <td>${retrieve.author }</td>
            </tr>
        </table>

        <!-- 제목 입력 필드 -->
        <div class="form-group-horizontal">
            <label for="title">제목 </label>
            <input type="text" name="title" value="${retrieve.title }" style="width:70%; border-radius:20px">
        </div>



        <!-- 이미지 표시 -->
        <c:if test="${not empty retrieve.image}">
            <div class="form-group">
                <label>첨부 이미지:</label>
                <img src="images/items/${retrieve.image}" alt="">
            </div>
        </c:if>
        
        <!-- 내용 입력 필드 -->
        <div class="form-group">
            <label for="content">내용</label>
            <textarea name="content" style="border-radius:20px">${retrieve.content }</textarea>
        </div>

        <div class="form-actions">
            <button id="updateBtn">수정</button>
            <button id="deleteBtn">삭제</button>
        </div>
    </form>

    <a href="list">목록</a>
</div>
</body>
</html>
