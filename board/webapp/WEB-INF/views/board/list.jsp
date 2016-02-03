<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 게시판</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
 <link
	href="${pageContext.request.contextPath}/assets/css/member_board.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	
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
				<div id="board">
					<table class="tbl-ex">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
							<th>작성일</th>
							<th >삭제여부</th>
						</tr>
						<c:set value="${fn:length(list) }" var="count"></c:set>
						<c:forEach items="${list }" var="vo" varStatus="status">
							<tr>
								<td>${vo.articleSequence }</td>
								<td class="title" style="padding-left:${( vo.depth - 1 )*10 }px">
									<c:if test="${vo.depth > 1 }">
										<img
											src="${pageContext.request.contextPath }/assets/images/ico-reply.gif">
									</c:if> <a
									href="${pageContext.request.contextPath}/board/view?no=${vo.no}&search=${search}&index=${index}&division=${division}">${vo.title}</a>
								</td>
								<td>${vo.name}</td>
								<td>${vo.viewCount}</td>
								<td>${vo.regDate}</td>
								<td align="center">
									<c:if test="${ (vo.memberNo eq authUser.no) or (authUser.userRole eq '1') }">
										<a href="${pageContext.request.contextPath}/board/delete?no=${vo.no}&division=${division }" class=""> 
											<font color="red">삭제</font>
										</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="row">
		        <div class="span12">
		            <form id="custom-search-form" class="form-search form-horizontal pull-right" 
		            	action="${pageContext.request.contextPath}/board/viewpaging"
						method="get">
		            	<input type="hidden" name="index" value="1"> 
						<input type="hidden" name="size" value="${size }"> 
						<input type="hidden" name="division" value="${division}"> 
		                <div class="input-append span12">
		                    <input type="text" class="search-query mac-style" placeholder="Search" id="kwd" name="search" value="${search}">
		                    <button type="submit" class="btn"><i class="icon-search"></i></button>
		                </div>
		            </form>
		        </div>
		        
					<%-- <form class="bottom"
						action="${pageContext.request.contextPath}/board/viewpaging"
						method="get">
						<input type="hidden" name="index" value="1"> 
						<input type="hidden" name="size" value="${size }"> 
						<input type="hidden" name="division" value="${division}"> 
						
						<input type="submit" value="찾기">
						<input type="text" id="kwd" name="search" value="${search}"> 
					</form> --%>
					<div class="pager">
						<ul>
							<c:if test="${startpage > 1 }">
								<li class="pg-prev"><a
									href="${pageContext.request.contextPath}/board/viewpaging?index=${startpage-1}&search=${search}">◀
										이전</a></li>
							</c:if>

							<c:forEach begin="${startpage}" end="${ endpage}"
								varStatus="status">

								<c:choose>
									<c:when test="${ status.index <= size }">
										<li><a
											href='${pageContext.request.contextPath}/board/viewpaging?index=${status.index}&search=${search}&division=${division }'>
												<c:choose>
													<c:when test="${status.index == index }">
														<font color="red">${status.index}</font>
													</c:when>
													<c:otherwise>
														<font color="black"> ${status.index}</font>
													</c:otherwise>
												</c:choose>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="disable">${status.index }</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${endpage < size }">
								<li class="pg-next"><a
									href="${pageContext.request.contextPath}/board/viewpaging?index=${endpage+1}&search=${search}">다음▶</a>
								</li>
							</c:if>
						</ul>
					</div>
					
					<c:choose>
						<c:when test="${division eq '1' }">
							<c:if test="${ authUser.userRole eq '1' }">
								<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm?groupNo=0&division=${division }'">글쓰기 </button>
							</c:if>
						</c:when>
						<c:when test="${division eq '2' }">
							<c:if test="${not empty authUser }">
								<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm?groupNo=0&division=${division }'">글쓰기 </button>
							</c:if>
						</c:when>
						<c:when test="${division eq '3' }">
							<button class="btn btn-default btn-cons btn-left" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm?groupNo=0&division=${division }'">글쓰기 </button>
						</c:when>
					</c:choose>


				</div>
			</div>
		</div>
</div>

		
</body>
</html>