<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<%@ taglib prefix="c"  uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<c:set var="pageDTO"  value="${findAll}" />
	<c:forEach var="dto" items="${pageDTO.list}">
      <tr>
        <td>${dto.num}</td>
        <td>
         <a href="retrieve?num=${dto.num}">
          ${dto.title}      
         </a>
         </td>
        <td>${dto.author}</td>
        <td>${dto.writeday}</td>
        <td>${dto.readcnt}</td>
      </tr>
     </c:forEach>
 
      
      <!--  페이지 번호 출력 -->
   <tr>
    <td colspan="5">   
 
		  <c:set var="curPage" value="${pageDTO.curPage}" /> 
		  <c:set var="perPage" value="${pageDTO.perPage}" /> 
		  <c:set var="totalRecord" value="${pageDTO.totalRecord}" /> 
		  <c:set var="totalPage" value="${totalRecord/perPage}" /> 
		  <c:if test="${totalRecord % perPage != 0}">
		    <c:set var="totalPage" value="${totalPage+1}" /> 
		  </c:if>
		  <c:forEach var="i"  begin="1" end="${totalPage}">
		    <c:if test="${i==curPage}">
		       ${i}&nbsp;
		    </c:if>
		    <c:if test="${i != curPage}">
		       <a href="list?curPage=${i}">${i}&nbsp;</a>
		    </c:if>
		  </c:forEach>

    </td>
   </tr> 

    </table>
    <a href="writeUI">글쓰기</a>
  
   <!--   
    <script>
       alert('<= list %>');
       alert(<= xxx %>);
    </script>
    --> 
</body>
</html>