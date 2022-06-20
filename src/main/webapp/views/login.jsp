

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Cookie[] cookies = request.getCookies();

String cookieId = "";
String cookiePw = "";

for (Cookie cookie : cookies) {
	System.out.println(cookie.getName() + "/" + cookie.getValue());
	if("userId".equals(cookie.getName())){
		cookieId = cookie.getValue();
	}
	if("userPW".equals(cookie.getName())){
		cookiePw = cookie.getValue();
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page01 tC">
	<div class="mXY">
		<img src="views/img/logo.png">


		<div class="a01">
			<form action="" method="post">
				<div>
					<span>ID</span><input type="text" name="uid" value="<%=cookieId %>">
				</div>
				<div>
					<span>PW</span><input type="password" name="upw" value="<%=cookiePw %>">
				</div>

				<br> <span>ID / PW 저장</span><input type="checkbox" name="saveId"
					id="saveId" value="saveId" <%="".equals(cookieId)?"":"checked" %>> <br> <br>
				<div style="clear: both;"></div>

				<button>Log in</button>
			</form>
		</div>

		<div class="cscenter">
			<a href="views/join01.jsp">회원가입</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#saveId").on("click", function() {
				if ($("#saveId").is(":checked")) {
					alert("아이디 저장!");
				}
			});
		});
	</script>
</body>
</html>
