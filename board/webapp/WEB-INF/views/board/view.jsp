<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>

<!DOCTYPE html>
<html>
<head>
<title>MySite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.request.contextPath}/assets/css/member_board.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

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
				<div id="board" class="board-form">
					<table class="tbl-ex">
						<tr>
							<th colspan="2"><h3>글보기</h3></th>
						</tr>
						<tr>
							<td class="">제목</td>
							<td>${boardVo.title}</td>
						</tr>
						<tr>
							<td class="">첨부파일</td>
							<td><c:forEach items="${uploadFileList}" var="file"
									varStatus="status">
									<a href="${pageContext.request.contextPath }${file.fileName}">
										${ file.originFileName } </a>
									<br>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td class="">내용</td>
							<td>
								<div class="view-content">
									${fn:replace(boardVo.content,crlf,'<br/>')}</div> <c:forEach
									items="${uploadFileList}" var="file" varStatus="status">
									<c:if
										test="${ file.mineType == 'jpg' || file.mineType == 'JPG' || file.mineType == 'png' || file.mineType == 'gif' }">
										<img src="${pageContext.request.contextPath }${file.fileName}">
									</c:if>
									<br>
								</c:forEach>
							</td>
						</tr>
					</table>
					<div class="bottom">
						<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/viewpaging?index=${index}&search=${search}&division=${boardVo.division}'">글목록 </button>
						
						<c:choose>
							<c:when
								test="${ not empty authUser and authUser.userRole eq '1'}">
								<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm?groupNo=${boardVo.groupNo}&orderNo=${boardVo.orderNo}&depth=${boardVo.depth}&division=${boardVo.division}'">답글달기 </button>
								<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/modifyform?no=${boardVo.no}&groupNo=${boardVo.groupNo}&depth=${boardVo.depth}&orderNo=${boardVo.orderNo}&division=${boardVo.division}'">글수정</button>
								
							</c:when>
							<c:when
								test="${ not empty authUser and boardVo.division eq '2' }">
								<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm?groupNo=${boardVo.groupNo}&orderNo=${boardVo.orderNo}&depth=${boardVo.depth}&division=${boardVo.division}'">답글달기 </button>
								<c:if
									test="${ boardVo.memberNo == authUser.no or authUser.userRole eq '1' }">
									<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/modifyform?no=${boardVo.no}&groupNo=${boardVo.groupNo}&depth=${boardVo.depth}&orderNo=${boardVo.orderNo}&division=${boardVo.division}'">글수정</button>
								</c:if>
							</c:when>

						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>