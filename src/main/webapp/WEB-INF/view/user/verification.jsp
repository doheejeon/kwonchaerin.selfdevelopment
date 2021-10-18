<title>갓겜:메일인증</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#usrPw {
	position: relative;
}

#usrPwChk {
	position: absolute;
	right: 0.5rem;
	top: 44%;
}
</style>

<script>
function sendMail(str) {
	authCode = '';
	for(i = 0; i < 5; i++)
		authCode += str.charAt(Math.floor(Math.random() * str.length));

	sessionStorage.setItem('authCode', authCode);
	console.log(sessionStorage.getItem('authCode'));
}

function authCodeIn() {
	if($('#authCode').val().length == 5)
		$('#authProcBtn').removeAttr('disabled');
	else $('#authProcBtn').attr('disabled', true);
}

function authProc() { /* 어떤 상황이냐면 모달이 안열림  */
	if($('#authCode').val() == sessionStorage.getItem('authCode')) {
		modal('메일', '인증', '성공');
	} else modal("메일", "인증", "실패");

	sessionStorage.removeItem('authCode');
	sessionStorage.removeItem('position');
}
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container'>
		<div class='row my-5'>
			<div class='col'>
				<div class='row my-1'>
					<h1>메일 인증</h1>
				</div>
				<hr>
				<div class='row ml-3 mt-4'>
					<small class='h5 mt-2'>
						 가입 시 입력한 메일 주소로 인증번호를 발송하였습니다.<br><br>
					 	 확인 후 아래에 입력해주세요.
					</small>
				</div>
				<div class='row ml-3 mt-4'>
					<h6 class='small'>
						메일함에서 확인되지 않는다면 스팸 메일함을 확인해주세요.<br>
						<a href='#' class='text-dark font-weight-bold' onclick='sendMail("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")'>
						<i class="far fa-paper-plane"> </i> 메일 재발송</a>
					</h6>
				</div>
				<div class='row mt-5 mx-5 justify-content-center'>
					<div class='col-9 mx-5'>
						<div class='row text-nowrap'>
							<label for='authCode' class='col-2 pl-1 mt-1 mr-3'>인증번호</label>
							<input type='text' class='form-control col' placeholder='5자를 입력하세요.'
								id='authCode' name='authCode' oninput='authCodeIn()' required>
						</div>
						<div class='row mt-5 justify-content-around'>
							<button class='btn btn-outline-secondary col mr-1' onclick='modal("메일", "인증", "중단")'>취소</button>
							<button class='btn btn-secondary col' onclick='authProc()' id='authProcBtn' disabled>인증하기</button>
						</div>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

<!-- 모달 -->
<div id='authSucModal' class='modal fade' tabindex='-3'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>메일 인증 성공</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<p>인증이 완료되었습니다!</p>
				<p>지금 바로 퀘스트에 도전하세요!</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<a href='/kwonchaerin.selfdevelopment/quest/board' class='btn btn-outline-secondary'>퀘스트 하러가기</a>
			</div>
		</div>
	</div>
</div>

<div id='bFResultModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 id='modalTitle'></h6>
				<h6><button type='button' class='btn btn-sm' data-dismiss='modal'>
					<i class="fas fa-times"></i>
				</button></h6>
			</div>
			<div class='modal-body text-center' id='modalContent'>
			</div>
			<div class='modal-footer justify-content-center' id='modalBtn'>
			</div>
		</div>
	</div>
</div>