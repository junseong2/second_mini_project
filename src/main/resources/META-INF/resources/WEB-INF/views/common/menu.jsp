<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>

<style>
/* BOWLING_ALL과 JUNSEONG에 글씨를 두껍게 적용하고 초록색으로 변경 */
.nav-link.font-weight-bold {
	font-weight: bold;
	color: green; /* 초록색 글씨 */
}

/* BOWLING_ALL과 JUNSEONG을 세로로 나열 */
.category-container {
	display: flex;
	flex-direction: column; /* 세로로 나열 */
}

/* BOWLING_ALL과 하위 항목들(BALL, BAG, TSHIRT, GUARD)을 가로로 나열 */
.bowling-all-container {
	display: flex;
	flex-direction: row; /* 가로로 나열 */
	align-items: center; /* 세로 중앙 정렬 */
}

/* 하위 항목들 간의 간격을 조금 두기 */
.bowling-all-container .nav-item {
	margin-right: 15px;
}

/* 검색창을 오른쪽에 붙이기 위한 스타일 */
.search-container {
	display: flex;
	justify-content: flex-end; /* 오른쪽으로 정렬 */
	width: 100%;
}

.search-container form {
	display: flex;
	align-items: center;
}
</style>

<script>
$(document).ready(function(){
    // 폼 제출 시
    $("#search").on("click", function(){
        var f = $("#search")[0];
        f.action="search";
        f.method="post";
    });
}); // end ready
</script>

<!-- menu.jsp -->
<header>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-expand-lg">
				<div class="navbar-collapse">
					<ul class="navbar-nav">
						<div class="category-container">
							<!-- 세로 배치 -->
							<div class="bowling-all-container">
								<!-- BOWLING_ALL과 하위 카테고리 가로 배치 -->
								<!-- BOWLING_ALL 카테고리 -->
								<li class="nav-item"><a class="nav-link font-weight-bold"
									href="main?gCategory=bowling">BOWLING_ALL</a></li>
								<!-- BOWLING_ALL 하위 항목들 -->
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=bowling_ball">BALL</a></li>
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=bowling_tshirt">TSHIRT</a></li>
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=bowling_bag">BAG</a></li>
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=bowling_guard">GUARD</a></li>
							</div>
							<div class="bowling-all-container">
								<!-- BOWLING_ALL과 하위 카테고리 가로 배치 -->
								<!-- BOWLING_ALL 카테고리 -->
								<li class="nav-item"><a class="nav-link font-weight-bold"
									href="main?gCategory=basketball">BASKETBALL_ALL</a></li>
								<!-- BOWLING_ALL 하위 항목들 -->
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=basketball_ball">BALL</a></li>
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=basketball_tshirt">UNIFORM</a></li>
								<li class="nav-item"><a class="nav-link"
									href="main?gCategory=basketball_bag">BAG</a></li>
							</div>
						</div>
					</ul>

					<!-- 검색 폼을 오른쪽에 배치 -->
					<div class="search-container">
						<form id="search">
							<ul class="navbar-nav">
								<li class="nav-item">
									<input type="text" name="search"
									autocomplete="off"
									placeholder="검색할 키워드를 입력하세요."
									style="border-radius: 20px; width: 300px; height: 110%; padding:10px">
									<button type="submit" class="btn btn-success"
										style="border-radius: 10px; height: 100%; margin-bottom:7px">검색</button></li>
							</ul>
						</form>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>
