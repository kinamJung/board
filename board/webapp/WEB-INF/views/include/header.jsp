
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<div class='container'>
	<h1>오 나의 게시판</h1>
	<c:choose>
		<c:when test="${ not empty authUser}">
			<h6 align="right">${authUser.userID}님 환영합니다.</h6>
		</c:when>
		<c:otherwise>
			<br>
		</c:otherwise>
	</c:choose>

	<div class='navbar navbar-inverse'>
		<div class='navbar-inner nav-collapse' style="height: auto;">
			<ul class="nav">
				<c:choose>
					<c:when test="${ empty authUser }">
						<li><a
							href="${pageContext.request.contextPath}/user/loginform">로그인</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/joinform">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
