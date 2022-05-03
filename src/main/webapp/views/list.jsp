<%@page import="domain.ListInfos"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.UseHistoryVO"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ListInfos List = (ListInfos) request.getAttribute("list");
Collection<UseHistoryVO> goList = List.getGoList();
Collection<UseHistoryVO> backList = List.getBackList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용내역</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page04">
	<div class="d01 pd16">
		<div class="tC title">
			<h2>이용내역</h2>
		</div>
		<ul class="ulFl school">
			<li class="on" id="schoolin">등교</li>
			<li id="schoolout">하교</li>
		</ul>
	</div>


	<!-- 등교 리스트 -->
	<ul class="list pd16" id="goSchoolList">
		<%
		{
		Iterator<UseHistoryVO> it = goList.iterator();
		while (it.hasNext()) {
			UseHistoryVO vo = it.next();
		%>
		<li>
			<div class="fL">
				<strong><%=vo.getStart()%> ~ <%=vo.getEnd()%></strong><br> <span><%=vo.getBpdate()%></span>
			</div>
			<div class="fR">
				<b><%=vo.getStatus()%></b>
			</div>
		</li>
		<%
		}
		}
		%>

	</ul>

	<!-- 하교 리스트 -->
	
	<ul class="list pd16" id="goHomeList">
		<%
		{
		Iterator<UseHistoryVO> it = backList.iterator();
		while (it.hasNext()) {
			UseHistoryVO vo = it.next();
		%>
		<li>
			<div class="fL">
				<strong><%=vo.getEnd()%> ~ <%=vo.getStart()%></strong><br> <span><%=vo.getBpdate()%></span>
			</div>
			<div class="fR">
				<b><%=vo.getStatus()%></b>
			</div>
		</li>
		<%
		}
		}
		%>

	</ul>
	




	<div class="FAB">
		<ul class="ulFl">
			<li><a href="MyPage"><img src="views/img/ico01.png">
				<p>내정보</p></a></li>
			<li><a href="Bus"><img src="views/img/ico02.png">
				<p>버스탑승</p></a></li>
			<li class="on"><a href="List"><img
					src="views/img/ico03_on.png">
				<p>이용내역</p></a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#schoolin").click(function() {
				$("#schoolin").addClass("on");
				$("#schoolout").removeClass("on");

				$("#goSchoolList").show();
				$("#goHomeList").hide();
				console.log("등교 내역입니다.");
			});

			$("#schoolout").click(function() {
				$("#schoolout").addClass("on");
				$("#schoolin").removeClass("on");

				$("#goSchoolList").hide();
				$("#goHomeList").show();
				console.log("하교 내역입니다.");
			});

		});
	</script>
</body>
</html>
