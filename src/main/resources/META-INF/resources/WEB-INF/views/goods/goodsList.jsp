<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="container">
  <!-- 정렬 선택 드롭다운 -->
  <div class="text-end mb-3">
<form action="goodsList" method="get" >
    <!-- param을 사용하여 현재 URL의 파라미터 값을 가져옴 -->
    <input type="hidden" name="gCategory" value="${param.gCategory}">
    
    <label for="sort">정렬:</label>
    <select name="sort" onchange="this.form.submit()">
        <option value="">정렬 기준 선택</option>
        <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>가격 높은순</option>
        <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>가격 낮은순</option>
        <option value="code_asc" ${param.sort == 'code_asc' ? 'selected' : ''}>상품 코드순</option>
    </select>
</form>
</div>




	<div class="container">
		<div class="row">
			${dto.gImage }
			<c:forEach var="dto" items="${goodsList}">
				<div class="col m-4 w-80"
					style="border-radius: 15px; border: 2px solid black;">

					<a href="goodsRetrieve?gCode=${dto.gCode}"> <img
						src="images/items/${dto.gImage}" width="200" height="250">
					</a>
					<div class="mt-4 fs-6">
						<strong>${dto.gName}</strong>
					</div>
					<div class="mt-2 fs-6">${dto.gContent}</div>
					<div class="mt-2 fs-6" style="font-weight: bold; color: red;">${dto.gPrice}</div>
				</div>
			</c:forEach>

		</div>
	</div>