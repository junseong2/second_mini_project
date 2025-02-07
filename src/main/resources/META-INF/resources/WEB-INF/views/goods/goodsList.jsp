<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>


<div class="container">
  <div class="row">
  ${dto.gImage }
  <c:forEach var="dto" items="${goodsList}">
    <div class="col border border-dark m-4 w-80">

      <a href="goodsRetrieve?gCode=${dto.gCode}">

		<img src="images/items/${dto.gImage}" width="200" height="250">
	  </a>
       <div class="mt-4 fs-6"><strong>${dto.gName}</strong></div>
       <div class="mt-2 fs-6">${dto.gContent}</div>
       <div class="mt-2 fs-6" style="font-weight: bold; color: red;">${dto.gPrice}</div>
    </div>
  </c:forEach>  
 
  </div>
</div>

