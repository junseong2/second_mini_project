<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container">
   <div class="row mb-3" style="margin-top:30px">
   	
   	<h4>회원님의 ID는 "<span style="color:blue; font-weight:700">${userid }</span>" 입니다!</h4>
   	
   	<!-- 버튼들을 중앙에 배치할 div 추가 -->
    <div style="margin-top:15px">
	    <a href="loginForm">로그인 하러가기</a> &nbsp;&nbsp;
	    <a href="updatepw">비밀번호 재설정하기</a>
    </div>
  </div>
</div>
