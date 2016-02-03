<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>


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
				<h2>게시판 과제 사이트</h2>
				<p> 이 게시판은 3가지 게시판으로 구성되어 있습니다.</p>
				<p>
				    1. 공지사항 : 관리자만 입력, 수정, 삭제 가능한 게시판입니다. 단 일반 회원 및 방문자는 읽기만 가능합니다.<br>
				    2. 회원게시판: 이 게시판은 일반 회원이면 누구나 글을 쓸수가 있습니다. 단 수정 및 삭제는 자기가 입력한 글에 한합니다.<br>
				              	
				    3. 자유 게시판: 익명 게시판으로써  접속하는 사람은 누구나 익명으로 글을 쓸수가 있습니다.<br> 단 글의 삭제는 비밀번호가
				    			요구되기 때문에 비밀번호를 잃어버려서는 안됩니다. 
				</p>
				<p>  관리자는 임의로 회원게시판의 글을 삭제할 수 있습니다. 단 자유게시판의 글은 삭제할 수 없습니다.<br>
					※ 관리자 아이디 : admin
					              비밀번호 : admin
				<p>
			</div>
		</div>
	</div>


</body>
</html>