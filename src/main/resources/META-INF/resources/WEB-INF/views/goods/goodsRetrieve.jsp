<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
	  
	  $("#up").on("click", function(){
		  
		  var gAmount = $("#gAmount").val();
		  $("#gAmount").val( Number.parseInt(gAmount) + 1);
	  });
	  
	  $("#down").on("click", function(){
		  
		  var gAmount =  Number.parseInt($("#gAmount").val());
		  
		  if(gAmount == 1){
		    $("#gAmount").val(1);			  
		  }else{
		    $("#gAmount").val(gAmount - 1);
		  }
	  });
	  
	  
	  $("#cartBtn").on("click", function(){
	    	//event.preventDefault();
	    	var f = $("form")[0];
	    	f.action="cartAdd";
	    	f.method="GET";
	    });
	  
	  
	
  });//end ready
</script> 
<div class="container">
	<div>${errorMessage }</div>
	<div class="row" style="display: flex;">
		<!-- 왼쪽: 상품 정보 -->
		<form class="row g-3 m-4" style="flex: 0 0 45%; padding: 15px;">
			<input type="hidden" name="gCode" value="${goodsRetrieve.gCode}" >
			<div class="row">    
				<div class="card" style="width:100%; padding: 10px;">
					<img src="images/items/${goodsRetrieve.gImage}.gif" class="card-img-top" alt="...">
					<div class="card-body" style="padding: 10px;">
						<h6 class="card-title" style="font-size: 14px;">
							<span class="fw-bold">제품코드:</span>  
							${goodsRetrieve.gCode}</h6>
						<h6 class="card-text" style="font-size: 14px;">
							<span class="fw-bold ">상품명:</span>
							${goodsRetrieve.gName}</h6>
						<h6 class="card-text" style="font-size: 14px;">
							<span class="fw-bold ">가격:</span>
							${goodsRetrieve.gPrice}</h6>
						<h6 class="card-text" style="font-size: 14px;">
							<span class="fw-bold ">상품옵션:</span>
							<select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
							</select>
							<select class="select_change" name="gColor" id="gColor" style="font-size: 12px;">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
							</select>
						</h6>
						<h6 class="card-text" style="font-size: 14px;">
							<span class="fw-bold ">주문수량:</span>
							<input type="text" name="gAmount" value="1" id="gAmount" style="font-size: 14px;">
							<img src="images/up.PNG" id="up" style="width: 20px; height: 20px;"> 
							<img src="images/down.PNG" id="down" style="width: 20px; height: 20px;">
						</h6>
						<button class="btn btn-primary mt-3" style="padding: 5px 10px; font-size: 14px;">구매</button>
						<button class="btn btn-primary mt-3" id="cartBtn" style="padding: 5px 10px; font-size: 14px;">장바구니</button>
					</div>
				</div>
			</div>
		</form>

		<!-- 오른쪽: 후기 작성 및 후기 목록 (위아래로 분할) -->
		<div style="flex: 0 0 50%; padding: 10px;">
			<!-- 후기 작성 폼 -->
			<form action="writeFeedback" method="post" class="column g-3 m-4" style="border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; padding: 15px; margin-bottom: 20px;">
				<input type="hidden" name="gCode" value="${goodsRetrieve.gCode}" >
				<input type="hidden" name="userid" value="${login.userid}" >
				<h5 style="margin-bottom: 15px; font-size: 16px;">후기 작성</h5>
				
				<!-- 사용자 이름과 후기 입력란을 가로로 배치 -->
				<div style="display: flex; align-items: center; margin-bottom: 15px;">
					<div style="margin-right: 10px; font-size: 14px;">
						${login.username} 님 :
					</div>
					<input type="text" name="gContext" placeholder="후기를 입력하세요." style="width: 70%; padding: 8px; font-size: 14px; margin-right: 10px;">
					<button type="submit" style="padding: 6px 12px; font-size: 14px;">작성</button>
				</div>
			</form>

			<!-- 후기 목록 -->
			<h5 style="margin-bottom: 10px;">후기 목록</h5>
			<div style="border: 1px solid #ddd; border-radius: 8px; padding: 15px; background-color: #f9f9f9; max-height: 300px; overflow-y: auto;">
				<!-- 후기 항목 예시 -->
				<div style="margin-bottom: 10px;">
					<span style="font-weight: bold;">홍길동:</span>
					<span style="font-size: 14px;">이 제품 너무 좋아요! 적극 추천합니다.</span>
				</div>
				<div style="margin-bottom: 10px;">
					<span style="font-weight: bold;">김영희:</span>
					<span style="font-size: 14px;">생각보다 더 좋습니다. 가격 대비 성능 최고!</span>
				</div>
				<!-- 추가적인 후기 항목을 여기에 나열 -->
			</div>
		</div>
	</div>
	<hr>
</div>
