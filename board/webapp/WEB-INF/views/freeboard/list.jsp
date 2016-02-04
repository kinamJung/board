<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% 	
	pageContext.setAttribute("crlf", "\r\n"); 
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/freeboard.css"
	rel="stylesheet" type="text/css">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<title>오 나의 게시판</title>
</head>
<script type="text/javascript">
$(function() {

	$('#submit').click(function() {

		var name = $("#name").val();
		var password = $("#password").val();
		var message = $("textarea").val();
		if (name == "" || password == "" ) {
			alert("정보를 입력하세요.");
			return false;
		}

		if (message.length < 10) {
			alert("10자 이상 입력하세요.");
			return false;
		}

		return true;
	});
	
});
</script>

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
				<div id="guestbook">
					<div class="row">
						<div class="span15 well" style="padding-bottom:10">
				            <form accept-charset="UTF-8" action="${pageContext.request.contextPath}/freeboard/add" method="POST">
				            	<input class="span5" type="text" placeholder="아이디" id="name" name="name">
				            	<input class="span5" type="password" placeholder="비밀번호" id="password" name="password">
				                <textarea class="span15" id="message" name="message" placeholder="메세지를 입력하세요.(10자 이상)" rows="5"></textarea>
				                <input id="submit" type="submit" class="btn btn-info pull-right" value="메세지 남기기">
				                
				            </form>
				        </div>
					</div>
					
					<c:set var="count" value="${fn:length(list)}" />
					<c:forEach items="${list}" var="vo" varStatus="status">
					<div class="row well">
						<h3>[${count-status.index}]   ${vo.name}</h3>
						<p>${fn:replace(vo.message,crlf,'<br/>')}</p>
						
						<div class="badge badge-success pull-right">${vo.regDate }</div>
						
						<c:choose>
							<c:when test="${empty authUser || authUser.userRole == 2 }">
								<span class="label pull-right"><a
									href="${pageContext.request.contextPath}/freeboard/deleteform/${vo.no}">삭제</a></span>
							</c:when>
							<c:when test="${ authUser.userRole == 1 }">
								<span class="label pull-right"><a
									href="${pageContext.request.contextPath}/freeboard/delete?no=${vo.no}">삭제</a></span>
							</c:when>
						</c:choose>
						
						
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>