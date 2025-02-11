<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
	  
	// 로그인 처리
	  $("form").on("submit", function(event){
	      var managerConfirm = $("#managerConfirm").val();
	      
	      // managerConfirm가 1234일 경우 로그인 성공 처리
	      if (managerConfirm === '1234') {
	          // action과 method를 서버에서 사용할 값으로 설정
	          this.action = "manager"; // manager로 보내도록 설정
	          this.method = "post";    // post 방식으로 보내기
	      } else {
	          // 잘못된 아이디/비밀번호 입력 시 리다이렉트 방지
	          event.preventDefault();
	          alert("아이디 또는 비밀번호가 잘못되었습니다.");
	      }
	  });

	  
	  //취소 버튼 누르면 홈
	  $("#reset").on("click",function(){
		 window.location.href="/minipj2/main"; 
	  });
  });//end ready
</script>
<div class="container">
	<h2>관리자 로그인</h2>
    <form class="row g-3 m-4">
		  <div class="row mb-3">
		    <label for="managerConfirm" class="col-sm-2 col-form-label">관리자 암호</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="managerConfirm" name="managerConfirm">
		    </div>
		  </div>

		  <div class="col-12">
		    <button type="submit" class="btn btn-success">로그인</button>
		    <button type="reset" id="reset" class="btn btn-warning">취소</button>
		  </div>
 </form>
</div> 
