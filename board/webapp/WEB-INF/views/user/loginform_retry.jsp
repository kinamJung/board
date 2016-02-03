<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html>
<head>
<title>회원 가입</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/login.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/include/header.jsp" />
	</header>

		<div class='container'>

		<div id='content' class='row-fluid'>
			<nav>
				<c:import url="/WEB-INF/views/include/navigation.jsp">
				</c:import>
			</nav>
			<div class='span8 main'>
				<form action="${pageContext.request.contextPath}/user/login"
					method="post" name="Login_Form" class="form-signin">
					<h4 class="form-signin-heading">로그인을 실패하였습니다.</h4>
					<hr class="colorgraph">
					<br> <input type="text" class="form-control" name="id"
						placeholder="아이디" required="" autofocus="" /> <input
						type="password" class="form-control" name="password"
						placeholder="패스워드" required="" /> <input
						class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
				</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>