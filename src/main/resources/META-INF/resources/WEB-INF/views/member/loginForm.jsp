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

<style>

  #idform {
    position: absolute; /* 부모를 기준으로 절대 위치 */
    top: 50%; /* 화면 중앙에 위치하도록 설정 */
    left: 50%;
    transform: translate(-50%, -50%); /* 정확한 중앙 배치를 위한 변환 */
    width: 100%;
    max-width: 700px; /* 폼의 최대 너비 제한 */
    padding: 20px;
    background-color: #fcf7e8;
    border-radius: 20px; /* 폼 모서리 둥글게 */

  }
  
  .row .mb-3 {
  	display:flex;
  	justify-content:center;
  	align-items:center;
  }
  
</style>


<div class="container">
    <form class="row g-3 m-4" id="idform">
		  <div class="row mb-3">
		    <label for="userid" class="col-sm-2 col-form-label"><span style="font-weight:700">아이디</span></label>
		    <div class="col-auto">
		      <input autocomplete="off" type="text" class="form-control" id="userid" name="userid">
		    </div>
		  </div>
		 <div class="row mb-3">
		    <label for="password" class="col-sm-2 col-form-label"><span style="font-weight:700">비밀번호</span></label>
		    <div class="col-auto">
		      <input type="password" class="form-control" name="passwd" id="passwd">
		    </div>
		  </div>
  		  <div class="col-12">
		    <a href="findid">아이디 찾기</a> &nbsp;
		    <a href="updatepw">비밀번호 재설정하기</a>
		  </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-success">로그인</button>
		    <button type="reset" id="reset" class="btn btn-warning">취소</button>
		  </div>
 </form>
</div> 
