

<%@page import="domain.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<%-- <%
LoginVO vo = (LoginVO) request.getAttribute("vo");
%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
	<div class="jointit w100 tC">
		<b>내정보수정</b>
	</div>
<div class="pd16">
		<form method="post" action="">
			<input type="hidden" name="uid" id="uid"
				value="${vo.uname }<%-- <%=vo.getUid()%> --%>"> <br> <br>
			<div>
				<h4>이름</h4>
				<input type="text" name="uname" id="uname"
					value="${vo.uname }<%-- <%=vo.getUname()%> --%>">
			</div>
			<br>
			<div>
				<h4>학교</h4>
				<input type="text" name="schoolname" id="uschool"
					value="${vo.schoolname }<%-- <%=vo.getSchoolname()%> --%>">
			</div>
			<br>
			<div>
				<h4>학년/반</h4>
				<input type="text" name="gradeclass" id="ugrade"
					value="${vo.gradeclass }<%-- <%=vo.getGradeclass()%> --%>">
			</div>
			<br>
			<div>
				<h4 class="inline">휴대폰 번호</h4>
				<span>(※ 확인만 가능합니다. 휴대폰 번호 변경시, 재가입 필요.)</span> <input type="text"
					name="uid" id="uid" value="${vo.uid }<%-- <%=vo.getUid()%> --%>"
					readonly="readonly">
			</div>
			<br>
			<div>
				<h4 class="inline">비밀번호 수정 및 확인</h4>
				<span>(※최대 12자리)</span> <input type="text" name="upw" maxlength='12'
					id="upw" value="">
			</div>
			<br>
			<div>
				<h4>노선</h4>
				<div class="sltbox">
					<select name="route" id="busroot">
						<option value="A노선"
							<c:if test="${'A노선' eq vo.route}">selected</c:if>>A노선</option>
						<%-- <%="A노선".equals(vo.getRoute()) ? "selected" : ""%> --%>

						<option value="B노선"
							<c:if test="${'A노선' eq vo.route}">selected</c:if>>B노선</option>

						<%-- <%="B노선".equals(vo.getRoute()) ? "selected" : ""%> --%>
						<option value="C노선"
							<c:if test="${'A노선' eq vo.route}">selected</c:if>>C노선</option>

						<%-- <%="C노선".equals(vo.getRoute()) ? "selected" : ""%> --%>
					</select>
				</div>
			</div>
			<br>
			<div>
				<h4 class="inline">탑승장소</h4>
				<span>(※노선을 먼저 선택해주세요)</span>
				<div class="sltbox">
					<select name="boardingplace" id="place">
						<!-- 3항 연산자를 사용하여, 데이터에 저장된 값과 value 값을 비교하여 참이면, 내정보수정 페이지에 해당 정보를 뿌려줌. -->
						<%-- <%= "C장소".equals(vo.getBoardingplace()) ? "selected" : "" %> --%>
						<option value="A장소"
							<c:if test="${'A장소' eq vo.boardingplace}">selected</c:if>>
							A장소</option>
						<option value="B장소"
							<c:if test="${'B장소' eq vo.boardingplace}">selected</c:if>>
							B장소</option>
						<option value="C장소"
							<c:if test="${'C장소' eq vo.boardingplace}">selected</c:if>>
							C장소</option>
					</select>
				</div>
			</div>

			<div class="jw100 tC">
				<button type="submit">수정하기</button>
			</div>
		</form>
	</div>
	<script>
		function chkName(t) {
			var nameCheck = /^[가-힣]{2,6}$/;
			if (!nameCheck.test(t)) {
				return false;
			}
			return true;
		}

		$(document).ready(function() {
			$("button[type=submit]").on("click", function() {

				return true;
			});

			$("button").click(function() {

				/* 이름 */
				if ($("#uname").val() == '') {
					alert("이름을 입력해주세요.");
					$('#uname').focus();
					return false;
				}
				if (!chkName($('#uname').val())) {
					console.log("잘못됨" + $('#uname').val());
					alert("올바른 형식의 이름을 입력하세요");
					$('#uname').val('');
					$('#uname').focus();
					return false;
				}

				/* 학교 */
				if ($("#uschool").val() == '') {
					alert("학교를 입력해주세요.");
					$("#uschool").focus();
					return false;
				}

				/* 학년/반 */
				if ($("#ugrade").val() == '') {
					alert("학년 / 반을 확인해주세요.");
					return false;
				}

				/* 비밀번호 수정 및 확인 */
				if ($("#upw").val() == '') {
					alert("비밀번호 수정 또는 재입력해주세요.");
					return false;
				}

				/* 노선 */
				if ($("#busroot").val() == '노선') {
					alert("노선을 확인해주세요.");
					return false
				}
				if ($("#place").val() == '탑승장소') {
					alert("탑승장소를 확인해주세요.");
					return false
				}

			})

		});
	</script>
</body>
</html>






