<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
    // 로그인 처리
    $("form").on("submit", function(){
      this.action="findid";   // findid
      this.method="post";    // doPost
    });
  });
</script>

<!-- 아이디 찾기 폼 -->
<h4 style="margin-top:10px">${errorMessage }</h4>
<div id="findIdForm" style="display: flex; justify-content: center; align-items: center; height: 50vh;">
    <div style="width: 100%; max-width: 700px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9;">
        <h3 class="text-center">아이디 찾기</h3>
        <form>
            <!-- 이름 입력 부분 -->
            <div class="row mb-3" style="margin-top:20px">
                <label for="username" class="col-sm-2 col-form-label">이름</label>
                <div class="col-auto">
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
            </div>

            <!-- 휴대폰 번호 입력 부분 -->
            <div class="row mb-3">
                <label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
                <div class="col-auto">
                    <div class="input-group">
                        <select class="form-select" id="phone1" name="phone1">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                        </select>
                        <input type="text" class="form-control" id="phone2" name="phone2" required placeholder="중간자리">
                        <input type="text" class="form-control" id="phone3" name="phone3" required placeholder="뒷자리">
                    </div>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">아이디 찾기</button>
            </div>
        </form>
    </div>
</div>
