<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE >

<%
	String no = request.getParameter("no");
%>

<html>
<head>
<title>오 나의 게시판</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="${pageContext.request.contextPath}/assets/css/member_board.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	
	$(function() {

		$('#form-btn').click(function() {

			var title = $("#title").val();
			var content = $("textarea").val();
			if (title == "") {
				alert("제목을 입력하세요.");
				return false;
			}

			if (content.length < 10) {
				alert("10자 이상 입력하세요.");
				return false;
			}

			return true;
		});

		$('#cancel').click(function() {

			return false;
		});
	});
</script>
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
				<form id="board-write-form" class="board-form" method="post"
					action="${pageContext.request.contextPath}/board/write"
					enctype="multipart/form-data">
					<input type="hidden" name="groupNo" value="${boardVo.groupNo}">
					<input type="hidden" name="orderNo" value="${boardVo.orderNo }">
					<input type="hidden" name="depth" value="${boardVo.depth }">
					<input type="hidden" name="division" value="${boardVo.division }">

					<table class="tbl-ex">
						<tr>
							<th colspan="2">글쓰기</th>
						</tr>
						<tr>
							<td class="">제목</td>
							<td><input type="text" id="title" name="title" value="" class="span4"></td>
						</tr>
						<tr>
							<td class="">첨부파일</td>
							<td>
							<input type="file" name="uploadFile" class=""> <br>
							<input type="file" name="uploadFile">
							</td>
						</tr>
						<tr>
							<td class="">내용</td>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
					<button id="cancel" class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/${boardVo.division }'">취소</button>
					<input id="form-btn" class="btn btn-default btn-cons btn-left" type="submit" value="등록">
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>