<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
    // 로그인 처리
    $("form").on("submit", function(){
      this.action="findpw";   // findid
      this.method="post";    // doPost
    });
  });
</script>

<!-- 아이디 찾기 폼 -->
<h4 style="margin-top:10px">${errorMessage }</h4>
<div id="findIdForm" style="display: flex; justify-content: center; align-items: center; height: 50vh;">
    <div style="width: 100%; max-width: 700px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9;">
        <h3 class="text-center">비밀번호 찾기</h3>
        <form action="findid" method="post">
            <!-- 아이디 입력 부분 -->
            <div class="row mb-3" style="margin-top:20px">
                <label for="username" class="col-sm-2 col-form-label">아이디</label>
                <div class="col-auto">
                    <input type="text" class="form-control" id="userid" name="userid" required>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">비밀번호 찾기</button>
            </div>
        </form>
    </div>
</div>
