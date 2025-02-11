<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
	  
	  // 로그인 처리
	  $("form").on("submit", function(){
		  this.action="auth";   //LoginServlet
		  this.method="post"         // doPost
	  });
	  
	  //취소 버튼 누르면 홈
	  $("#reset").on("click",function(){
		 window.location.href="/minipj2/main"; 
	  });
  });//end ready
</script>
<div class="container">
	<div>${errorMessage }</div>
    <form class="row g-3 m-4">
		  <div class="row mb-3">
		    <label for="userid" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="userid" name="userid">
		    </div>
		  </div>
		 <div class="row mb-3">
		    <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-auto">
		      <input type="password" class="form-control" name="passwd" id="passwd">
		    </div>
		  </div>
  		  <div class="col-12">
		    <a href="findid">아이디 찾기</a> &nbsp;
		    <a href="findpw">비밀번호 찾기</a>
		  </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-success">로그인</button>
		    <button type="reset" id="reset" class="btn btn-warning">취소</button>
		  </div>
 </form>
</div> 
