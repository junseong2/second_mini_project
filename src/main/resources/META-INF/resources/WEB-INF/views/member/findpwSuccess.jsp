<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container">
   <div class="row mb-3" style="margin-top:30px">
   	
   	<h4>회원님의 비밀번호는 "${passwd }" 입니다!</h4>
   	
   	<!-- 버튼들을 중앙에 배치할 div 추가 -->
    <div class="col-auto d-flex justify-content-center" style="margin-top:15px">
        <!-- <button type="button" class="btn btn-success mx-2">로그인 하러가기</button>
        <button type="button" class="btn btn-warning mx-2">비밀번호 찾기</button> -->
	    	<a href="loginForm">로그인 하러가기</a> &nbsp;
    </div>
  </div>
</div>
