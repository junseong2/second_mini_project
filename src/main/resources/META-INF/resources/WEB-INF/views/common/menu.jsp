<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
  // 폼 제출 시
	  $("form").on("submit", function(){
	    this.action = "search";   // orderDone
	    this.method = "post";        // doPost
	  });

}); // end ready
</script>
<!-- menu.jsp -->
 <header>
            <div class="container">
                <div class="row ">
                    <nav class="navbar navbar-expand-lg">
                        <div class="navbar-collapse">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="main?gCategory=top">top</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="main?gCategory=dress">dress</a>
                                </li>
                            </ul>
                              <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="main?gCategory=outer">outer</a>
                                </li>
                            </ul>
                             <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="main?gCategory=bottom">bottom</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="main?gCategory=bowling">bowling</a>
                                </li>
                            </ul>
                            <form>
                           		<ul class="navbar-nav">
	                                <li class="nav-item">
	                               		<input type="text" name="search" placeholder="검색할 키워드를 입력하세요." style="border-radius:20px; width:300px">
	                               		<button type="submit" class="btn btn-success">검색</button>
	                           		</li>
                            	</ul>
                            </form>
                   

                        </div>
                    </nav>
                </div>
            </div>
</header>
