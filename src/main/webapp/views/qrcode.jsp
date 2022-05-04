<%@page import="java.util.Date"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page05 tC">
	<div class="mXY">
		<div class="qrcode">
			<div class="qrimg" style="padding: 0">
			<!-- qr code 부문 -->
				<%
				String savedFileName = "";
				String qrMsg = new Date().toString(); //"{'name':'이종혁'}";
				//한글깨짐방지
				String data = new String(qrMsg.getBytes("UTF-8"), "ISO-8859-1");

				File path = new File(application.getRealPath("/") + "garam/qrImages/");
				savedFileName = UUID.randomUUID().toString().replace("-", "");

				//폴더생성
				if (!path.exists())
					path.mkdirs();

				//폴더 속 파일 삭제
				File[] delFile = path.listFiles();
				if (delFile != null) {
					for (int i = 0; i < delFile.length; i++) {
						delFile[i].delete();
					}
				}
				/* out.print(delFile.length); - 파일 갯수 확인 */

				QRCodeWriter writer = new QRCodeWriter();
				BitMatrix qrCode = writer.encode(data, BarcodeFormat.QR_CODE, 200, 200);
				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
				File file = new File(path, savedFileName + ".png");
				ImageIO.write(qrImage, "PNG", file);
				%>
				<img
					src="<%=request.getContextPath() + "/garam/qrImages/" + savedFileName + ".png"%>">
			</div>

			<span>잔여횟수</span>
			<div class="count">
				<b id="txtHint"></b>회
			</div>
		</div>
		<img src="views/img/logo_bt.png" class="mt40">
	</div>

	<div class="FAB">
		<ul class="ulFl">
			<li><a href="mypage.jsp"><img src="views/img/ico01.png">
					<p>내정보</p></a></li>
			<li class="on"><a href="02_bus.jsp"><img
					src="views/img/ico02_on.png">
					<p>버스탑승</p></a></li>
			<li><a href="list.jsp"><img src="views/img/ico03.png">
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

