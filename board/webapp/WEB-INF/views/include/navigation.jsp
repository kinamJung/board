<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


  <div class='span2 sidebar'>
        <h3>메뉴</h3>
        <ul class="nav nav-tabs nav-stacked">
          <li><a href="${pageContext.request.contextPath}/" title="메인">메인</a></li>
          <li><a href="${pageContext.request.contextPath}/board/1" title="공지사항">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/board/2" title="회원 게시판">회원 게시판</a></li>
          <li><a href="${pageContext.request.contextPath}/freeboard/" title="자유 게시판">자유 게시판</a></li>
        </ul>
 </div>