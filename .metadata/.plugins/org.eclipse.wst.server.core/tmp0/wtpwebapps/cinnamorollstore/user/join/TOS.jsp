<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시나모롤 스토어</title>
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<script>
	function validateForm(form){
		if(!form.service_use.checked){
			alert("서비스 이용 약관 동의를 해주세요.");
			form.service_use.focus();
			return false;
		}
		if(!form.personal_info_process.checked){
			alert("개인정보 처리방침 동의를 해주세요.");
			form.personal_info_process.focus();
			return false;
		}
		if(!form.personal_info_use.checked){
			alert("개인정보 위탁 동의를 해주세요.");
			form.personal_info_use.focus();
			return false;
		}
		if(!form.marketing.checked){
			alert("마케팅 정보 제공 동의를 해주세요.");
			form.marketing.focus();
			return false;
		}
		return true;
	}
	
	function cancelJoin(){
		if(confirm("회원가입을 취소하시겠습니까?")){
			window.location.href="${path}/main.do";
		}else{
			return false;
		}
	}
</script>
</head>
<body>
	<div id="wrap">
	<%@ include file="../fixedBar/nav-before.jsp"%>
	<div class="login">
		<h2 id="join-title">시나모롤 스토어 서비스 약관 동의</h2>
		<form method="post" action="${path}/TOS.do" id="TOSForm" class="loginForm"
		onsubmit="return validateForm(this)">

			<h4 class="tos">
				서비스 이용 약관 동의(필수)<input type="checkbox" id="service_use" name="service_use"
					class="normal">
			</h4>
			<h4 class="tos">
				개인정보 처리방침 동의(필수)<input type="checkbox" id="personal_info_process"
					name="personal_info_process" class="normal">
			</h4>
			<h4 class="tos">
				개인정보 위탁 동의(필수)<input type="checkbox" id="personal_info_use"
					name="personal_info_use" class="normal">
			</h4>
			<h4 class="tos">
				마케팅 정보 제공 동의(필수)<input type="checkbox" id="marketing" name="marketing"
					class="normal">
			</h4>
			<h4 class="tos">
				전체 동의<input type="checkbox" id="all" name="TOS">
			</h4>
			<button type="submit" id="join-submit" class="login-submit">다음</button>
			<br>
			<button type="button" class="join-button" onclick="cancelJoin()">취소</button>
		</form>
	</div>
	<script>
    const checkAll = document.querySelector('#all');
    const checkBoxesNormal = document.querySelectorAll('.normal');
    const checkBoxChecked = Array.from(checkBoxesNormal, (checkbox) => checkbox);
    function paintCheckAll(y) {
        checkBoxChecked.map((e) => e.checked = y);
    }
    function onCheckAllClick() {
        checkAll.checked ? paintCheckAll(true) : paintCheckAll(false);
    }
    function onBoxClick() {
        let is_checked = true;
        checkBoxChecked.forEach((box) => {
            is_checked = box.checked && is_checked;
        });
        checkAll.checked = is_checked;
    }
    checkAll.addEventListener('click', onCheckAllClick);
    checkBoxesNormal.forEach((checkbox) => checkbox.addEventListener('click', onBoxClick));
    </script>
	<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>