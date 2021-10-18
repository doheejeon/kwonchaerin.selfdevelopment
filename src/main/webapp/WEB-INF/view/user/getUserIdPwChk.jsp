<title>갓겜:아이디와 비밀번호 찾기</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#usrIn h6[id$='Chk'] {
	top: 25%;
	right: 3%;
	z-index: 1;
}

.w-90 {
	width: 90%;
}

#findUsrIdBtn,
#getUsrPwBtn {
	font-size: 1.3rem;
}

.form-control {	
	  height: calc(1.8em + 1rem + 2px);
}
</style>

<script>
function bDateChk() {
	$('#usrBDateChk').empty();
	birthday = $('#usrBDate').val();

	if(birthday.length != 0)
		$('#usrBDateChk').html('<span class="text-success">조회 가능</span>');
	else
		$('#usrBDateChk').html('<span class="text-danger">조회 불가</span>');
}

function name2Chk() { //DB에 일치 값이 있는 지
	$('#usrName2Chk').empty();
	name = $('#usrName2').val();
	
	if(name.length >= 2)
		$('#usrName2Chk').html('<span class="text-success">조회 가능</span>');
	else 
		$('#usrName2Chk').html('<span class="text-danger">조회 불가</span>');
}

function phone2Chk() { //입력한 ID와 연결된 전화번호와 일치하는지
	$('#usrPhone2Chk').empty();
	$('#usrPhone2').val($('#usrPhone2').val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')); // 대시 없애기
	telNum = $('#usrPhone2').val();
	
	if(telNum.length >= 10)
		$('#usrPhone2Chk').html('<span class="text-success">조회 가능</span>');
	else
		$('#usrPhone2Chk').html('<span class="text-danger">조회 불가</span>');
}

function findIdChk() { //input 값 봤을 때 이상 없는 지.
	$('#findUsrIdBtn').attr('disabled', true);
	allInput = document.querySelectorAll('#findUsrId h6 span').length;
	goodInput = document.querySelectorAll('#findUsrId h6 .text-success').length;
	wrongInput = document.querySelectorAll('#findUsrId h6 .text-danger').length;
	
	if(allInput - goodInput == 0 && wrongInput < 1 && 3 <= allInput)
			$('#findUsrIdBtn').removeAttr('disabled');
}

function getPwChk() { //input 값 봤을 때 이상 없는 지.
	$('#getUsrPwBtn').attr('disabled', true);
	allInput = document.querySelectorAll('#getUsrPw h6 span').length;
	goodInput = document.querySelectorAll('#getUsrPw h6 .text-success').length;
	wrongInput = document.querySelectorAll('#getUsrPw h6 .text-danger').length;
	
	if(allInput - goodInput == 0 && wrongInput < 1 && 3 <= allInput)
			$('#getUsrPwBtn').removeAttr('disabled');
}

$(document).ready(function() {
	sessionStorage.removeItem('find');
	
	$('#findUsrIdBtn').click(function() {
		sessionStorage.setItem('find', 'id');
	})
	
	$('#getUsrPwBtn').click(function() {
		sessionStorage.setItem('find', 'pw');
	})
})
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container text-nowrap'>
		<div class='row mt-5'>
			<div class='col mt-4 my-3'>
				<h1>아이디 찾기</h1>
			</div>
			<div class='col mt-4 my-3'>
				<h1>비밀번호 재발급</h1>
			</div>
		</div>
		<div class='row border-top border-bottom'>
			<div class='col border-right'>
				<div class='row m-0 mt-4 justify-content-center'>
					<form id='findUsrId' class='w-90' action='06.html'>
						<div class='col'>
							<div class='row my-2' id='usrIn'>
								<input type='text' class='form-control'id='usrName'
									placeholder=' 이름' onchange='nameChk(2); findIdChk();'>
								<h6 class='font-wieght-bold' id='usrNameChk'></h6>
							</div>
							<div class='row my-2' id='usrIn'>
								<input type='tel' class='form-control' id='usrPhone'
									placeholder=' 전화번호' onchange='phoneChk(2); findIdChk();'>
								<h6 class='font-wieght-bold' id='usrPhoneChk'></h6>
							</div>
							<div class='row my-2' id='usrIn'>
								<input type='text' class='form-control' onfocus='(this.type="date")' onblur='(this.type="text")'
									onchange='bDateChk(); findIdChk();' id='usrBDate' placeholder=' 생년월일'>
								<h6 class='font-wieght-bold' id='usrBDateChk'></h6>
							</div>
							<div class='row mt-3 mb-3'>
								<input class='btn btn-secondary w-100 form-control' id='findUsrIdBtn'
									title='가입 정보와 동일한 이름, 전화번호, 생년월일을 입력하세요.' value='아이디 찾기'>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class='col'>
				<div class='row m-0 mt-4 justify-content-center'>
					<form id='getUsrPw' class='w-90' action='06.html'>
						<div class='col'>
							<div class='row my-2' id='usrIn'>
								<input type='email' class='form-control' id='usrId'
									placeholder=' ID(email@example.com)' onchange='idChk(2); getPwChk();'>
								<h6 class='font-wieght-bold' id='usrIdChk'></h6>
							</div>
							<div class='row my-2' id='usrIn'>
								<input type='text' class='form-control' id='usrName2'
									placeholder=' 이름' onchange='name2Chk(); getPwChk();'>
								<h6 class='font-wieght-bold' id='usrName2Chk'></h6>
							</div>
							<div class='row my-2' id='usrIn'>
								<input type='tel' class='form-control' id='usrPhone2'
									placeholder=' 전화번호' onchange='phone2Chk(); getPwChk();'>
								<h6 class='font-wieght-bold' id='usrPhone2Chk'></h6>
							</div>
							<div class='row mt-3 mb-3'>
								<input class='btn btn-secondary w-100 form-control' id='getUsrPwBtn'
									title='가입 정보와 동일한 ID, 이름, 전화번호를 입력하세요.' value='비밀번호 재발급'>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>