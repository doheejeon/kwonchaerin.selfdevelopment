<title>갓겜:아이디와 비밀번호 찾기</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<script>
function checkWork() {
	if(sessionStorage.getItem('find') == 'id') {
		$('#workName').text('아이디 찾기');
		$('#workContent').text('회원님의 ID는 us**@user.com 입니다.');
		$('#workTip').remove();
	} else if(sessionStorage.getItem('find') == 'pw') {
		$('#workName').text('비밀번호 재발급');
		$('#workContent').html('회원님의 이메일로 임시 비밀번호를 발급했습니다.<br>빠른 시일 내에 비밀번호를 변경하여 주세요.');
		$('#workTip').html('<small class="mr-5">메일함에서 확인되지 않는다면 스팸 메일함을 확인해주세요.<br></small>' +
			'<a href="#" class="small text-dark font-weight-bold font-italic mr-5" onclick="sendTempPw()"><i class="far fa-paper-plane"></i> 메일 재발송</a>')
	}
	sessionStorage.removeItem('find');
}

$(checkWork);

function sendTempPw() {
	base = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.`~!@#$%^&*()_-=+[]{}|:;<>?';
	password = '';
	
	for(i = 0; i < 6; i++)
		password += base.charAt(Math.floor(Math.random() * base.length));
	
	console.log(password);
}
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container'>
		<div class='row mt-5'>
			<div class='col'>
				<div class='row'>
					<h1 id='workName' class='mt-4 my-3'></h1>
				</div>
				<hr>
				<div class='row mt-5 mx-5 mb-3'>
					<div class='col'>
						<h4 class='font-weight-bold text-center my-3' id='workContent'></h4>
						<h6 class='text-right mt-4 mx-5' id='workTip'></h6>
					</div>
				</div>
				<div class='row mt-5 mb-4 mx-3 justify-content-around'>
					<a class='btn btn-outline-secondary col mr-1' href='/kwonchaerin.selfdevelopment/'>메인</a>
					<a class='btn btn-secondary col' href='/kwonchaerin.selfdevelopment/user/login'>로그인</a>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>