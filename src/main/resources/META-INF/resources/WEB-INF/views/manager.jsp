<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP_HOME</title>
<style type="text/css">
    .App {
	  text-align: center;
	  font-size: 16px;
	}
	
    label, input, button {
    margin: 10px;
    padding: 5px;
    }

	footer {
	    bottom: 0;
	    position: absolute;
	    width: 90%;
	    height: 40px;
	}
 </style>
<link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" >
<script src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 <div class="App">
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<jsp:include page="common/menu.jsp" flush="true" />
	<hr>
	    <c:if test="${not empty message}">
	        <script type="text/javascript">
	            alert("${message}");  // 전달된 message 값을 alert로 띄운다.
	        </script>
  		</c:if>
	<jsp:include page="goods/manager.jsp" flush="true" />
 </div>
</body>
</html>