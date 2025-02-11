<%@page import="com.exam.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"


    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- taglib 추가 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
	    	var f = $("#cartForm")[0];
	    	f.action="cartAdd";
	    	f.method="GET";
	    });

	  $("#buyBtn").on("click", function(){
	    	//event.preventDefault();
  	        alert("이후 페이지 내 결제 및 취소 버튼 클릭 외의 경로로 이동하면 상품은 자동으로 장바구니에 추가됩니다.");
	    	var f = $("#cartForm")[0];
	    	f.action="buyGoods"; //수정
	    	f.method="GET";
        	
	    });
	  
	  
	
  });//end ready
</script> 

<div class="container">
	<div>${errorMessage }</div>
	<div class="row" style="display: flex;">
		<!-- 왼쪽: 상품 정보 -->
		<form id="cartForm" class="row g-3 m-4" style="flex: 0 0 45%; padding: 15px;">

		    <input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
		    <div class="row">
		        <div class="card" style="width:100%; padding: 10px;">
		            <img src="images/items/${goodsRetrieve.gImage}" class="card-img-top" alt="...">
		            <div class="card-body" style="padding: 10px;">
		                <h6 class="card-title" style="font-size: 14px;">
		                    <span class="fw-bold">제품코드:</span>  
		                    ${goodsRetrieve.gCode}
		                </h6>
		                <h6 class="card-text" style="font-size: 14px;">
		                    <span class="fw-bold">상품명:</span>
		                    ${goodsRetrieve.gName}
		                </h6>
		                <h6 class="card-text" style="font-size: 14px;">
		                    <span class="fw-bold">가격:</span>
		                    ${goodsRetrieve.gPrice}
		                </h6>
		                <h6 class="card-text" style="font-size: 14px;">
		                    <span class="fw-bold">상품옵션:</span>
		                    
		                    <!-- 상품 gCode가 BALL을 포함한 경우 -->
		                    <c:if test="${fn:contains(goodsRetrieve.gCode, 'BALL')}">
		                        <!-- 사이즈와 색상 선택을 비활성화 -->
		                        <select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;">
		                            <option selected value="기본">기본</option>
		                        </select>
		                        <select class="select_change" name="gColor" id="gColor" style="font-size: 12px;">
		                            <option selected value="기본">기본</option>
		                        </select>
		                    </c:if>
		                    
            		        <!-- 상품 gCode가 TSHIRT인 경우 -->
		                    <c:if test="${fn:contains(goodsRetrieve.gCode, 'TSHIRT')}">
		                        <!-- 사이즈 선택 O, 색상 선택 X 무조건 기본 -->
		                        <select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;" required>
		                            <option value="" disabled selected>사이즈선택</option> <!-- 기본값으로 선택되지 않게 설정 -->
		                            <option  value="90">90</option>
		                            <option  value="95">95</option>
		                            <option  value="100">100</option>
		                            <option  value="110">110</option>
		                            <option  value="120">120</option>
		                            <option  value="130">130</option>
		                        </select>
		                        <select class="select_change" name="gColor" id="gColor" style="font-size: 12px;">
		                            <option selected value="기본">기본</option>
		                        </select>
		                    </c:if>
		                    
		                    <!-- 상품 gCode가 BAG인 경우 -->
		                    <c:if test="${fn:contains(goodsRetrieve.gCode, 'BOWLBAG')}">
		                        <!-- 사이즈 선택 X, 색상 선택 O -->
		                        <select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;">   
		                            <option selected value="기본">기본</option>
		                            
		                        </select>
		                        <select class="select_change" name="gColor" id="gColor" style="font-size: 12px;" required>
		                            <option value="" disabled selected required>색상 선택</option> <!-- 기본값으로 선택되지 않게 설정 -->
		                            <option  value="GREEN">GREEN</option>
		                            <option  value="RED">RED</option>
		                            <option  value="BLUE">BLUE</option>
		                            <option  value="BLACK">BLACK</option>
		                        </select>
		                    </c:if>
		                    
		                    <!-- 상품 gCode가 BALL을 포함한 경우 -->
		                    <c:if test="${fn:contains(goodsRetrieve.gCode, 'BASKETBAG')}">
		                        <!-- 사이즈와 색상 선택을 비활성화 -->
		                        <select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;">
		                            <option selected value="기본">기본</option>
		                        </select>
		                        <select class="select_change" name="gColor" id="gColor" style="font-size: 12px;">
		                            <option selected value="기본">기본</option>
		                        </select>
		                    </c:if>
		
		                    <!-- 상품 gCode가 ball, tshirt를 포함하지 않은 경우 -->
		                    <c:if test="${!fn:contains(goodsRetrieve.gCode, 'BALL') && !fn:contains(goodsRetrieve.gCode, 'TSHIRT') && !fn:contains(goodsRetrieve.gCode, 'BOWLBAG') && !fn:contains(goodsRetrieve.gCode, 'BASKETBAG')}">
		                        <!-- 사이즈와 색상 선택 활성화 -->
		                        <select class="select_change" size="1" name="gSize" id="gSize" style="font-size: 12px;" required>
		                            <option value="" disabled selected>사이즈선택</option> <!-- 기본값으로 선택되지 않게 설정 -->
		                            <option value="L">L</option>
		                            <option value="M">M</option>
		                            <option value="S">S</option>
		                        </select>
		                        <select class="select_change" name="gColor" id="gColor" style="font-size: 12px;" required>
		                            <option value="" disabled selected>색상선택</option> <!-- 기본값으로 선택되지 않게 설정 -->
		                            <option value="BLACK">BLACK</option>
		                            <option value="RED">RED</option>
		                            <option value="BLUE">BLUE</option>
		                        </select>
		                    </c:if>
		                </h6>
		                <h6 class="card-text" style="font-size: 14px;">
		                    <span class="fw-bold">주문수량:</span>
		                    <input type="text" name="gAmount" value="1" id="gAmount" style="font-size: 14px;">
		                    <img src="images/up.PNG" id="up" style="width: 20px; height: 20px;"> 
		                    <img src="images/down.PNG" id="down" style="width: 20px; height: 20px;">
		                </h6>
		                <button class="btn btn-primary mt-3" id="buyBtn" style="padding: 5px 10px; font-size: 14px;">구매</button>
		                <button class="btn btn-primary mt-3" id="cartBtn" style="padding: 5px 10px; font-size: 14px;">장바구니</button>
		            </div>
		        </div>
		    </div>

		</form>


		<!-- 오른쪽: 후기 작성 및 후기 목록 (위아래로 분할) -->
		<div style="flex: 0 0 50%; padding: 10px;">
			<!-- 후기 작성 폼 -->

			<!-- 로그인 상태 체크 -->
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="username"/>
			    <!-- 로그인된 사용자만 후기 작성 폼을 볼 수 있도록 조건부로 표시 -->
			    <form id="feedbackForm" action="writeFeedback" method="post" class="column g-3 m-4" style="width:100%; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; padding: 15px; margin-bottom: 20px">
			        <input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
			        <input type="hidden" name="userid" value="${username}">
			        <h5 style="font-size: 14px; color: green; padding: 10px; margin-bottom:15px; font-size:1.2rem; font-weight:700">후기 작성</h5>
			
			        <!-- 사용자 이름과 후기 입력란을 가로로 배치 -->
			        <div style="display: flex; align-items: center; margin-bottom: 15px;">
			            <div style="margin-right: 10px; font-size: 14px;">
			                <strong>${username}</strong> 님 :
			            </div>
			            <input autocomplete="off" type="text" name="gContext" placeholder="후기를 입력하세요." style="width: 70%; padding: 8px; font-size: 14px; margin-right: 10px;">
			            <button type="submit" style="padding: 6px 12px; font-size: 14px;" class="btn btn-success">작성</button>
			        </div>
			    </form>
			</sec:authorize>

			<!-- 로그인 안된 경우 -->
			<sec:authorize access="isAnonymous()"> 
			    <form id="feedbackForm" action="writeFeedback" method="post" class="column g-3 m-4" style="width:100%; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; padding: 15px; margin-bottom: 20px">
			        <input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
			        <input type="hidden" name="userid" value="${login.userid}">
			        <h5 style="font-size: 14px; color: red; padding: 10px; margin-bottom:15px; font-size:1.2rem; font-weight:700">후기 작성 (불가능)</h5>
			
			        <!-- 사용자 이름과 후기 입력란을 가로로 배치 -->
			        <div style="display: flex; align-items: center; margin-bottom: 15px;">
			            <input type="text" name="gContext" placeholder="후기 작성을 위해서는 로그인 하셔야 합니다." style="width: 70%; padding: 8px; font-size: 14px; margin-right: 10px;" disabled>
			            <button type="submit" style="padding: 6px 12px; font-size: 14px;" class="btn btn-success" disabled>작성</button>
			        </div>
			    </form>
			</sec:authorize>

			<!-- 후기 목록 -->

			<h5 style="width:100%; font-size: 14px; color: green; padding: 10px; margin-bottom:10px; font-size:1.2rem; font-weight:700; margin-left:24px">후기 목록</h5>
			<div style="width:100%; border: 1px solid #ddd; margin-left:24px; border-radius: 8px; padding: 15px; background-color: #f9f9f9; max-height: 300px; overflow-y: auto;">
		        <!-- 후기 목록이 비어있는 경우 -->
			    <c:if test="${empty feedback}">
			        <div style="font-size: 14px; color: gray;">아직 등록된 후기가 없습니다.</div>
			    </c:if>
			    
			    <!-- 후기 항목 반복 시작 -->
			    <c:forEach var="feed" items="${feedback}">
			        <div style="margin-bottom: 10px; width:100%">
			            <span style="font-weight: bold;">${feed.userid}님 : </span>
			            <span style="font-size: 14px;">${feed.gContext} / </span> <!-- 후기에 대한 내용을 출력 -->
			            <span style="font-size: 14px;">${feed.feedbackdate}</span> <!-- 후기에 대한 내용을 출력 -->
			            
			        </div>
			    </c:forEach>
			    <!-- 후기 항목 반복 끝 -->

			</div>
			
		</div>
	</div>
	<hr>
</div>
