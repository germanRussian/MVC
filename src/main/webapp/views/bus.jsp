

<%@page import="domain.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
   
<%-- <%
LoginVO bus = (LoginVO)request.getAttribute("vo");

%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스탑승</title>
<link rel="stylesheet" type="text/css" href="views/style.css">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body class="page03">
	<div class="c01 pd16">
		<div class="tC title">
			<h2>버스탑승</h2>
		</div>
		<ul class="ulFl school">
			<li class="on" id="schoolin">등교</li>
			<li id="schoolout">하교</li>
		</ul>
	</div>

	<div class="pd16 pdb">
		<div id="goSchool">
			<div class="mb16 select">
				<img src="views/img/img04.png">출발지
				<div class="fR">
					<select name="start">
						<option value="">우방비치타운</option>
						<option value="">포항동부초등학교</option>
						<option value="">노인복지회관</option>
					</select> <img src="views/img/ico05.png">
				</div>
			</div>

			<div class=" select">
				<img src="views/img/img04.png">도착지 <span class="fR">${vo.schoolname}<%-- <%=bus.getSchoolname() %> --%></span>
				<!--등교 도착지는 학교로 고정-->
			</div>


		</div>


		<div id="goHome">
			<div class="mb16 select">
				<img src="views/img/img04.png">출발지 <span class="fR">${vo.schoolname}<%-- <%=bus.getSchoolname() %> --%></span>
			</div>

			<div class=" select">
				<img src="views/img/img04.png">도착지
				<div class="fR">
					<select name="start">
						<option value="">우방비치타운</option>
						<option value="">포항동부초등학교</option>
						<option value="">노인복지회관</option>
					</select> <img src="views/img/ico05.png">
				</div>

				<!--등교 도착지는 학교로 고정-->
			</div>


		</div>
	</div>
	<button class="mX mt40" onclick="location.href='qrcode.jsp'">QR
		Code 실행</button>
		


	<div class="FAB">
		<ul class="ulFl">
			<li><a href="MyPage"><img src="views/img/ico01.png">
					<p>내정보</p></a></li>
			<li class="on"><a href="Bus"><img
					src="views/img/ico02_on.png">
					<p>버스탑승</p></a></li>
			<li><a href="List"><img src="views/img/ico03.png">
					<p>이용내역</p></a></li>
		</ul>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			$("#goHome").hide();
			$("#schoolin").click(function() {
				$("#schoolin").addClass("on");
				$("#schoolout").removeClass("on");

				$("#goSchool").show();
				$("#goHome").hide();
				console.log("등교합니다.");
			});

			$("#schoolout").click(function() {
				$("#schoolout").addClass("on");
				$("#schoolin").removeClass("on");

				$("#goSchool").hide();
				$("#goHome").show();
				console.log("하교합니다.");
			});

		});
	</script>
</body>
</html>
