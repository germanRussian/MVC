
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 잘못된 경로 출입 방지 / 모든 페이지에 작성되어야한다. -->
<%
if (session.getAttribute("sessId") == null) {
	response.sendRedirect("login.jsp");
}

/* DB연결 */

request.setCharacterEncoding("utf-8");
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";


StringBuffer sql = new StringBuffer();
sql.append(" SELECT *  FROM g_member");
sql.append(" where uid = ? ");


Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String name =""; 
String phone = "";
String schoolName = "";
String gradeClass = "";
String route = "";
String boardingPlace = "";




try {
	//드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql.toString());
	//값 설정(쿼리 문 '?'에 들어 갈 값)
	stmt.setString(1,(String)session.getAttribute("sessId"));
	// 출력
	rs = stmt.executeQuery();

	/* 한건에 해당하는 것만 내용을 가져올 것이기 때문에 if문 사용 while문은 여러건을 가져올때.*/
	if (rs.next()) {
		 name = rs.getString("uname");
		schoolName = rs.getString("schoolname");
		phone = rs.getString("uid");
		gradeClass = rs.getString("gradeclass");
		route = rs.getString("route");
		boardingPlace = rs.getString("boardingplace");
	}
} catch (Exception e) {
	e.getLocalizedMessage();

} finally {
	//닫기
	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (conn != null) conn.close();

}


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script>
/* 마이페이지에서 위도 경도값을 맵페이지로 줄것이다. */
var lat;//위도
var lon;//경도

	if (navigator.geolocation) {
		//위치 정보를 얻기
		navigator.geolocation.getCurrentPosition(function(pos) {
			lat = pos.coords.latitude;     // 위도
	    	lon = pos.coords.longitude; // 경도
	    	
	    	map = document.getElementById("map");
	    	map.href = map.href+"?lat="+lat+"&lon="+lon;
		});
	} else {
		alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	}
</script>

</head>

<body class="page02">
	<div class="b01 pd16">
		<div class="oH w100">
			<div class="name fL">
				<b><%= name %></b>님 안녕하세요!<%-- <%=session.getAttribute("sessName")%> --%>
			</div>
			<div class="fR">
				<button onclick="location.href='mymodi.jsp'">내정보수정</button>
				<!-- 로그아웃시 세션 다 제거 / a 태그를 활용한다. -->
				<a href="logout.jsp" class="blue"> 로그아웃</a>
				<!--평소에는 내정보수정 버튼만 보이고, 수정 중일때만 완료버튼 표시-->
			</div>
		</div>

		<table>
			<tr>
				<td>이름</td>
				<td><%= name %></td><%-- <%=session.getAttribute("sessName")%> --%>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><%= phone %></td>
			</tr>
			<tr>
				<td>학교</td>
				<td><%= schoolName %></td>
			</tr>
			<tr>
				<td>학년반</td>
				<td><%= gradeClass %></td>
			</tr>
			<tr>
				<td>노선</td>
				<td><%= route %></td>
			</tr>
			<tr>
				<td>탑승장소</td>
				<td><%= boardingPlace %></td>
			</tr>
		</table>
	</div>

	<div class="b02 pd16">
		<a href="bus.jsp" class="mb16 qrbtn"> <img src="./img/img01.png">QR
			승하차 체크하기<img src="./img/ico_arrow.png" class="fR">
		</a>
		<div class="mb16">
			<img src="./img/img02.png">잔여 이용 횟수 <span class="fR"><b id="txtHint"></b>회</span>
		</div>
		<a href="map.jsp" class="mb16" id="map"> <img src="./img/img03.png">실시간
			버스 위치<img src="./img/ico_arrow2.png" class="fR">
		</a> <a href="line.jsp"> <img src="./img/img05.png">버스 노선 안내<img
			src="./img/ico_arrow2.png" class="fR">
		</a>
	</div>


	<div class="cscenter">
		가람광광여행사 고객센터 <span>054-251-3800</span><br>
		<a href="privacy.jsp">[개인정보처리방침]</a><br>
	</div>

	<div class="FAB">
		<ul class="ulFl">
			<li class="on"><a href="mypage.jsp"><img
					src="./img/ico01_on.png">
				<p>내정보</p></a></li>
			<li><a href="bus.jsp"><img src="./img/ico02.png">
				<p>버스탑승</p></a></li>
			<li><a href="list.jsp"><img src="./img/ico03.png">
				<p>이용내역</p></a></li>
		</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	//ajax를 사용
		setTimeout(function coupon() {
			
			
					const xmlhttp = new XMLHttpRequest();
					xmlhttp.onload = function() {
						document.getElementById("txtHint").innerHTML = this.responseText;
					}
					
					xmlhttp.open("GET", "getCoupon.jsp");
					xmlhttp.send();
					
					
					setTimeout(coupon, 1000);//반복 시간
				}, 0);//시작 시간
	</script>
</body>
</html>
