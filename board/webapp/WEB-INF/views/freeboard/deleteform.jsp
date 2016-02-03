<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!doctype html>
<html>
<head>
<title>삭제 화면</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/freeboard.css"
	rel="stylesheet" type="text/css">

<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

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
				<div id="guestbook" class="delete-form well">
					<form method="post"
						action="${pageContext.request.contextPath}/freeboard/delete">
						<input type='hidden' name="no" value="${no }">
						<input type="password" name="password" placeholder="비밀번호" class="span8 " style="margin: 5px;"> 
						<input type="submit" value="확인" class="btn">
					</form>
					<a href="${pageContext.request.contextPath}/freeboard/">되돌리기</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>