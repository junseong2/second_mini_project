<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>

<script>
  $(document).ready(function(){
      $("#idDupulicatedcheck").on("click", function(event){
          event.preventDefault();
          $.ajax({ url:"idCheck", method:"get", dataType :'text',
              data: { userid: $("#userid").val() },          
              success:function(responseText){
                  $("#idcheck").text(responseText).removeClass("text-danger text-success")
                                .addClass(responseText.includes("사용 가능") ? "text-success" : "text-danger");
              }, error:function(){
                  $("#idcheck").text("오류 발생").addClass("text-danger");
              }
          });
      });

      $("#passwd2").on("keyup", function(){
          var pw = $("#passwd").val(), pw2 = $("#passwd2").val();
          $("#pwdcheck").text(pw === pw2 ? "비밀번호 일치" : "비밀번호 불일치")
                        .removeClass("text-danger text-success")
                        .addClass(pw === pw2 ? "text-success" : "text-danger");
      });
      $("#email3").on("change", function(){ $("#email2").val($(this).val()); });
      $("form").on("submit", function(){ this.action = "signup"; this.method = "post"; });
      $("#reset").on("click", function(){ window.location.href = "/minipj2/main"; });
  });
</script>

<div
	class="container d-flex justify-content-center align-items-center vh-80">
	<div class="card shadow-lg p-4" style="width: 400px;">
		<h3 class="text-center mb-4">회원가입</h3>

		<form autocomplete="off">
			<div class="row">
				<!-- 왼쪽 컬럼: 기본 정보 -->
					<div class="mb-2">
						<div class="input-group">
							<input type="text" class="form-control shadow-sm" id="userid"
								name="userid" required autocomplete="off" placeholder="아이디">
							<button type="button" class="btn btn-primary"
								id="idDupulicatedcheck">중복확인</button>
						</div>
						<small id="idcheck" class="d-block mt-1"></small>
					</div>
					<div class="mb-2">
						 <input type="password"
							class="form-control shadow-sm" name="passwd" id="passwd" required
							autocomplete="off" placeholder="비밀번호">
					</div>
					<div class="mb-2">
						 <input type="password"
							class="form-control shadow-sm" name="passwd2" id="passwd2"
							autocomplete="off" placeholder="비밀번호 확인"> <small id="pwdcheck"
							class="d-block mt-1"></small>
					</div>
					<div class="mb-2">
						 <input type="text"
							class="form-control shadow-sm" name="username" id="username"
							required autocomplete="off" placeholder="이름">
					</div>
										<div class="mb-2">
						<div class="input-group">
							<select name="phone1" class="form-select">
								<option value="010">010</option>
								<option value="011">011</option>
							</select> <input type="text" name="phone2" class="form-control" required
								autocomplete="off" placeholder="전화번호"> <input type="text" name="phone3"
								class="form-control" required autocomplete="off">
						</div>
					</div>
			
				<div class="mb-2">
					<div class="input-group">
						<input type="text" name="email1" class="form-control"
							autocomplete="off" placeholder="이메일"> <span class="input-group-text" >@</span>
						<input type="text" name="email2" id="email2" class="form-control"
							placeholder="직접입력" autocomplete="off"> <select
							name="email3" class="form-select" id="email3">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.com">google.com</option>
						</select>
					</div>
				</div>

				<!-- 오른쪽 컬럼: 주소 입력 -->
				
					<div class="mb-2">
						<div class="input-group">
							<input type="text" name="post" class="form-control"
								id="sample4_postcode" autocomplete="off" placeholder="우편번호">
							<button type="button" class="btn btn-primary"
								onclick="sample4_execDaumPostcode()">검색</button>
						</div>
					</div>
					<div class="mb-2">
						 <input type="text"
							name="addr1" class="form-control" id="sample4_roadAddress"
							autocomplete="off" placeholder="도로명 주소">
					</div>
					<div class="mb-2">
						 <input type="text"
							name="addr2" class="form-control" id="sample4_jibunAddress"
							autocomplete="off" placeholder="지번 주소">
					</div>
					<small id="guide" class="text-muted"></small>

			</div>

			<!-- 가입/취소 버튼 -->
			<div class="mt-3 d-flex justify-content-center gap-2">
				<button type="submit" class="btn btn-success btn-lg">가입하기</button>
				<button type="reset" id="reset" class="btn btn-warning btn-lg">취소</button>
			</div>
		</form>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullRoadAddr = data.roadAddress;
                var extraRoadAddr = '';
                if(data.bname && /[동|로|가]$/g.test(data.bname)) extraRoadAddr += data.bname;
                if(data.buildingName && data.apartment === 'Y') extraRoadAddr += (extraRoadAddr ? ', ' : '') + data.buildingName;
                document.getElementById("sample4_roadAddress").value = fullRoadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                document.getElementById("sample4_postcode").value = data.zonecode;
            }
        }).open();
    }
</script>
