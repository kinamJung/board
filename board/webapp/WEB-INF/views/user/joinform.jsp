<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html>
<head>
<title>오 나의 게시판</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/user.css"
	rel="stylesheet" type="text/css">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>


<script>
	var btnStatus = false;

	$(function() {
		$("#userID").change(function() {
			$("#image-checked").hide();
			$("#btn-checkemail").show();
			btnStatus = false
		});

		$('#join-form').submit(function() {

			var email = $("#userID").val();
			var name = $("#name").val();
			var password = $("#password").val();

			if (email == "" || name == "" || password == "") {
				alert("내용을 정확히 입력해주세요.");
				return false;
			}

			var check = $('#agree-prov').is(':checked');
			if (check == false) {
				alert("약관 동의해 주세요.");
				return false;
			}

			if (btnStatus == false) {
				alert("ID 중복 체크 확인해 주세요.")
				return false;
			}

			return true;

		});

		$("#btn-checkemail").click(function() {

			var userID = $("#userID").val();
			if (userID == "") {
				return;
			}

			$.ajax({
				url : "${pageContext.request.contextPath}/api/user/checkID",
				type : "get",
				dataType : "json",
				data :  encodeURI( "userID=" + userID),
				//contentType: "application/json"
				success : function(response) {
					console.log(response);
					if (response.result == "fail") {
						console.error(response.message);
						return;
					}
					if (response.data == false) {
						alert("이미 사용중인 이메일입니다.");
						var $userID = $("#userID");
						$userID.val("");
						$userID.focus();
						return;
					}
					$("#btn-checkemail").hide();
					$("#image-checked").show();
					btnStatus = true;
				},
				error : function(jqXHR, status, error) {
					console.error(status + " : " + error);
				}
			});

		});

	});
</script>

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
			<div class='span4 main'>
				
				<h2>회원가입</h2>
				<form id="join-form" method="post"
					action="${pageContext.request.contextPath}/user/join">
					<input type="hidden" name="userRole" value="2">
					<label>아이디</label>
					<div class="input-prepend input-append">
						<input type="text" id="userID" name="userID" class="span6">
						<img id="image-checked"	src="${pageContext.request.contextPath}/assets/images/checked.png" style="width: 12px; display: none">
						<button class="btn" type="button" id="btn-checkemail">ID중복체크</button>
					</div>
					<label>이름</label> 
					<input type="text" name="name" id="name"class="span7">
					<label>패스워드</label> 
					<input type="password" name="password" id="password" class="span7">
					<label>성별</label> 
					 여 <input type="radio" name="gender" value="female" checked="checked">
					남  <input type="radio" name="gender" value="male"> 
					<label>
						<input id="agree-prov" type="checkbox" name="agreeProv"> 사이트 가입 동의 
					</label> 
					<input type="submit" value="가입하기" class="btn btn-primary pull-right">
					<div class="clearfix">
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>