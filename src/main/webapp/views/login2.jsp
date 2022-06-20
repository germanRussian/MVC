

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 자바 스크립트로 로그인 쿠키 만들기 -->

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
					<span>ID</span><input type="text" name="uid" value="" id="uidID">
				</div>
				<div>
					<span>PW</span><input type="password" name="upw" value="">
				</div>

				<br> <span>ID / PW 저장</span><input type="checkbox" name="saveId"
					id="saveId" value="saveId" > <br> <br>
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
			
			//document.cookie = "userID ="+encodeURIComponent("한글");
			//alert(document.cookie);
			
			//console.log(document.cookie.split('=')[1]);
			$('input[name=uid]').val(document.cookie.split('=')[1]);
			
			
			//쿠기가 있을때 체크 유지
			if(document.cookie.split('=')[1] != undefined && document.cookie.split('=')[1] != ""){
				$('#saveId').prop("checked", true);
			}
			
			
			$("#saveId").on("click", function() {
				if ($("#saveId").is(":checked")) {
					alert("아이디 저장!");
					
					
					let saveId = $("input[name = uid]").val();
					let expires = new Date(Date.now()+((60*60*24)*1000));//초*분*시*1000 =하루
					
					document.cookie = "userID = "+saveId+"; path=/; expires="+expires;
				}else {
					document.cookie = "chkId=; path=/; expires=-1";
				}
			});
			
			/*$("input[type=checkbox]").on("click", function(){
				if($("input[type=checkbox]").is(":checked")){
					alert("공공장소에서는 사용하지 마세요.");
				}
			}); */
		});
	</script>
</body>
</html>
