<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
	$(document).ready(function(){
		  
		  // 로그인 창으로 가기
		  $("#gotoLogin").on("click", function(){
			  window.location.href="/minipj2/loginForm"
		  });
		  
		  // 취소 버튼 누르면 홈
		  $("#changePW").on("click", function(){
			 window.location.href="/minipj2/updatepw"; 
		  });
	});
</script>

<style>

 /* container 스타일 */
    .containers {
    	top:100px;
        background-color: #f8f9fa; /* 연한 회색 배경 */
        padding: 60px; /* 여백 추가 */
        border-radius: 10px; /* 둥근 모서리 */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
        max-width: 500px; /* 최대 너비 */
        margin: 70px auto; /* 중앙 정렬 */
        font-family: 'Arial', sans-serif; /* 폰트 스타일 */
    }

    /* 제목 스타일 */
    .containers h4 {
        font-weight: 600; /* 제목 글씨 굵게 */
        color: #333; /* 짙은 회색 글씨 */
        text-align: center; /* 중앙 정렬 */
    }

    /* 버튼을 중앙에 정렬 */
    .containers .btn {
        margin: 10px 0; /* 버튼 간 여백 */
    }


.btn-light-secondary {
    background-color: #e8e6df; /* 연한 회색 */
    border-color: #e8e6df;
    color: #495057; /* 텍스트 색상 */
    font-weight:600;
    font-size:15px;
}	

.btn:hover {
    background-color: #0056b3; /* hover 상태에서 버튼 색상 */
    border-color: #0056b3;
}


</style>

<div class="containers" style="">
   <div class="row mb-3" style="margin-top:30px">
   	
   	<h4>회원님의 ID는 "<span style="color:blue; font-weight:700">${userid }</span>" 입니다!</h4>
   	
   	<!-- 버튼들을 중앙에 배치할 div 추가 -->
    <div style="margin-top:15px">
    	<button class="btn btn-success" id="gotoLogin">로그인 하러가기</button>
    	<button class="btn btn-warning" id="changePW">비밀번호 재설정하기</button>
    	<!-- 
	    <a href="loginForm">로그인 하러가기</a> &nbsp;&nbsp;
	    <a href="updatepw">비밀번호 재설정하기</a>
	     -->
    </div>
  </div>
</div>
