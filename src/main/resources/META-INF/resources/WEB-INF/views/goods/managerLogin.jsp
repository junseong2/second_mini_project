<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
      // 로그인 처리
      $("form").on("submit", function(event){
          var managerConfirm = $("#managerConfirm").val();
          if (managerConfirm === '1234') {
              this.action = "manager";
              this.method = "post";
          } else {
              event.preventDefault();
              alert("아이디 또는 비밀번호가 잘못되었습니다.");
          }
      });

      // 취소 버튼 → 홈으로 이동
      $("#reset").on("click", function(){
          window.location.href = "/minipj2/main";
      });
  });
</script>

<div class="container d-flex justify-content-center align-items-center vh-80">
    <div class="card shadow-lg p-4" style="width: 400px;">
        <h3 class="text-center mb-4">관리자 로그인</h3>
        <form autocomplete="off">
            <div class="mb-3">
                                <label for="managerConfirm" class="form-label fw-semibold text-dark">🔒 관리자 암호</label>
                <input type="password" class="form-control shadow-sm w-80" id="managerConfirm" name="managerConfirm">
            </div>
            <div class="mt-3 d-flex justify-content-center gap-2">
                <button type="submit" class="btn btn-success btn-lg">로그인</button>
                <button type="reset" id="reset" class="btn btn-warning btn-lg">취소</button>
            </div>
        </form>
    </div>
</div>
