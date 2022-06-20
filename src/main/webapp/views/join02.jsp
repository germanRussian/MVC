<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" type="text/css" href="views/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
    <div class="jointit w100 tC"><b>회원가입</b></div>

    <div class="pd16">
		<form method="post" action="Join02">
		<input type="hidden" name="uid" id="uid">
	        <div>
	            <h4>이름</h4>
	            <input type="text" name="uname">
	        </div>
	
	        <div>
	            <h4>학교</h4>
	            <input type="text" name="schoolname">
	        </div>
	
	        <div>
	            <h4>학년/반</h4>
	            <input type="text" name="gradeclass">
	        </div>
	
	        <div class="pnum">
	            <div><h4 class="inline">휴대폰번호</h4> <span>(※휴대폰 번호가 ID로 설정됩니다.)</span></div>
	            <input type="text" id="phone1"> - <input type="text" id="phone2"> - <input type="text" id="phone3">
	        </div>
	
	        <div>
	            <h4 class="inline">비밀번호</h4> <span>(※최대 12자리)</span>
	            <input type="password" name="upw" maxlength='12'>
	        </div>
	
	        <div>
	            <h4>비밀번호 확인</h4>
	            <input type="password" maxlength='12'>
	        </div>
	
	        <div>
	            <h4>노선</h4>
	            <div class="sltbox">
	                <select name="route">
	                    <option value="A노선">A노선</option>
	                    <option value="B노선">B노선</option>
	                    <option value="C노선">C노선</option>
	                </select>
	            </div>
	        </div>
	        
	        <div>
	            <h4 class="inline">탑승장소</h4> <span>(※노선을 먼저 선택해주세요)</span>
	            <div class="sltbox">
	                <select name="boardingplace">
	                    <option value="A장소">A장소</option>
	                    <option value="B장소">B장소</option>
	                    <option value="C장소">C장소</option>
	                </select>
	            </div>
	        </div>
	        
	        <div class="jw100 tC">
	            <button type="submit">가입하기</button>
	        </div>
        </form>
    </div>
<script>
$(document).ready(function(){
	$("button[type=submit]").on("click", function(){
		var p1 = $("#phone1").val();
		var p2 = $("#phone2").val();
		var p3 = $("#phone3").val();
		$("#uid").val(p1+p2+p3);
		return true;
	});
});
</script>    
</body>
</html>






