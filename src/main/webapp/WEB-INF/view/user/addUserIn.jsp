<title>갓겜:회원가입</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#clsIcon {
	width: 10rem;
	height: 10rem;
}

#switchClsIconBtn {
	top: 0rem;
	left: 7.45rem;
}

#usrClsSetting label {
	width: 6rem;
	margin-left: 1rem;
}
</style>

<script>
$(chkToday);
$(clsLimit);

function addUsr() {
	$('#enterData').submit();
}
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container'>
		<div class='row' onmousedown='clsLimit(); chkInput(0);'>
			<div class='col'>
				<div class='row mt-5'>
					<p class='text-muted font-weight-bold'>회원가입 STEP 2</p>
				</div>
				<div class='row my-1'>
					<h2 class='text-muted'>약관 동의 > </h2><pre> </pre>
					<h2 class='font-weight-bold'>정보 입력</h2><pre> </pre>
					<h2 class='text-muted'> > 가입 완료</h2>
				</div>
				<hr>
				<form id='enterData' action='04.html' class='text-nowrap'>
					<div class='row mt-1 ml-3 justify-content-between'>
						<h4>ACCOUNT</h4>
						<h6 class='small font-wieght-bold mr-3'>＊ = 필수입력사항</h6>
					</div>
					<div class='row mx-5'>
						<div class='col mt-4'>
							<div class='row mb-4' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='text' class='form-control' name='usrIn' id='usrId'
									placeholder=' ID로 사용할 이메일 주소를 입력하세요.' onchange='idChk(1); chkInput(0);' required>
								<h6 class='font-wieght-bold' id='usrIdChk'></h6>
							</div>
							<div class='row mb-2' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='password' class='form-control' name='usrIn' id='usrPw'
									placeholder=' 비밀번호를 입력하세요.' onchange='pwChk(1); pwAgainChk(1); chkInput(0);' required>
								<h6 class='font-wieght-bold' id='usrPwChk'></h6>
								<small class='text-dark ml-2'>
									- 영문 대소문자, 숫자, 특수문자를 혼합하여 6~10자의 비밀번호를 입력해주세요. (띄어쓰기 금지)
								</small>
							</div>
							<div class='row mb-2' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='password' class='form-control' name='usrIn' id='usrPwAgain'
									placeholder=' 위에 입력한 비밀번호와 동일한 비밀번호를 입력해주세요.' onchange='pwAgainChk(1); chkInput(0);' required>
								<h6 class='font-wieght-bold' id='usrPwAgainChk'></h6>
							</div>
						</div>
					</div>
					<hr>
					<div class='row mt-1 ml-3 justify-content-between'>
						<h4>PERSONAL INFO</h4>
						<h6 class='small font-wieght-bold mr-3'>＊ = 필수입력사항</h6>
					</div>
					<div class='row mx-5'>
						<div class='col mt-4 mr-3'>
							<div class='row mb-2' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='text' class='form-control' name='usrIn' id='usrName'
									placeholder=' 이름을 입력하세요.' onchange='nameChk(1); chkInput(0);' required>
								<h6 class='font-wieght-bold' id='usrNameChk'></h6>
								<small class='text-dark ml-2'>
									- 2자 이상의 한글을 입력하세요.<br>
									- 띄어쓰기를 입력하지 마세요.
								</small>
							</div>
							<div class='row mb-2' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='text' class='form-control' onfocus='(this.type="date")' onblur='(this.type="text")'
									name='usrIn' id='usrBDate' placeholder=' 생년월일을 입력하세요.' onchange='chkInput(0)' required>
							</div>
						</div>
						<div class='col mt-4 ml-3'>
							<div class='row mb-2' id='usrIn'>
								<input type='text' class='form-control' name='usrIn' id='usrNick'
									placeholder=' 별명을 입력하세요.' onchange='nickChk(1); chkInput(0);'>
								<h6 class='font-wieght-bold' id='usrNickChk'></h6>
								<small class='text-dark ml-2'>
									- 한글, 영어, 숫자를 2~6자 입력하세요.<br>
									- 미입력 시 이름 + 순차번호가 별명이 됩니다.
								</small>
							</div>
							<div class='row mb-2' id='usrIn'>
								<h6 class='font-wieght-bold' id='must'>*</h6>
								<input type='tel' class='form-control' name='usrIn' id='usrPhone'
									placeholder=' 전화번호를 입력해주세요.' onchange='phoneChk(1); chkInput(0);' required>
								<h6 class='font-wieght-bold' id='usrPhoneChk'></h6>
							</div>
						</div>
					</div>
					<hr>
					<div class='row mt-1 pl-2 justify-content-between'>
						<h4>＊CLASS</h4>
						<h6><a class='small font-wieght-bold text-dark font-italic mr-3' href='/kwonchaerin.selfdevelopment/guide/aboutUs#classGuide' target='_blank'>
							클래스란? >
						</a></h6>
					</div>
					<small class='text-dark ml-3'>
						- 최대 9개 선택 가능합니다.
					</small>
					<div class='row mx-5'>
						<div class='col mt-4 mb-4'>
							<div class='row' id='usrClsSetting' onmousedown='clsLimit(); chkInput(0);'>
								<div class='col ml-0 pl-0 w-25'>
									<img src='#' class='border' alt='공부 아이콘' id='clsIcon'>
									<button type='button' class='btn btn-secondary' id='switchClsIconBtn' onclick='switchClsIcon()'>
										<i class='fas fa-arrows-alt-h'></i>
									</button>
									<input type='text' hidden='true' id='usrClsIcon' value='studyIcon'>
								</div>
								<div class='col-3' id='usrClsList1'>
									<label for='JSTL'>
										<input type='checkbox' name='usrClsName' value='JSTL' id='usrClsName'>
										JSTL
										<input type='text' value='JSTL' hidden='true' readonly>
									</label>
								</div>
								<div class='col-3' id='usrClsList2'>
								</div>
								<div class='col-3' id='usrClsList3'>
								</div>
								<div class='col align-self-end mx-2'>
									<button type='button' class='btn btn-secondary text-center float-right d-inline-block'
										data-toggle='modal' data-target='#clsSrchModal' id='clsSrchBtn'
										onclick='clsLimit(); clsSrchBtnClick(); chkInput(0);' disabled>
										<i class='fas fa-plus'></i>
									</button>
									<button type='button' class='btn btn-outline-secondary text-center float-right d-inline-block'
										onclick='rmvCls(); chkInput(0);' id='clsRmvBtn' disabled>
										<i class='fas fa-minus'></i>
									</button>
								</div>
							</div>
							<div class='row justify-content-end'>
								<h6 class='font-wieght-bold mr-4 mt-1 mb-0' id='usrClsNameChk'>&nbsp;</h6>
							</div>
						</div>
					</div>
					<hr>
					<div class='row mx-3 justify-content-around'>
						<button class='btn btn-outline-secondary col mr-1' data-toggle='modal' data-target='#addUsrCnclModal'>이전</button>
						<button class='btn btn-secondary col' id='nextStepBtn' title='필수사항 입력 후 다음 단계로 진행할 수 있습니다.' onclick='sendMail(); addUsr();' disabled>다음</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

<!-- 모달 -->
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

<div id='addUsrCnclModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>돌아가기</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<p>이전 단계로 돌아가시겠습니까?</p>
				<small>
					이전 단계로 돌아갈 시<br>
					현재 진행단계의 변경사항이 저장되지 않습니다.
				</small>
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-outline-secondary' data-dismiss='modal'>아니요</button>
				<a href='/kwonchaerin.selfdevelopment/user/join/step1' class='btn btn-secondary'>&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</a>
			</div>
		</div>
	</div>
</div>

<div id='clsSrchModal' class='modal fade' onmousemove='chkCls()' tabindex='-2'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>클래스 검색</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<div class='row'>
					<input type='text' class='form-control col my-3 ml-3' id='clsNameIn' oninput='clsNameInChk();'>
					<button class='btn btn-outline-secondary my-3 mr-3 ml-2'
						id='srchClsBtn' onclick='srchCls()' title='2글자 이상 입력하세요.'>
						검 색
					</button>
				</div>
				<div class='row justify-content-start'>
					<small class='font-wieght-bold text-dark font-italic ml-3' id='clsListAmnt'>
					&nbsp;
					</small>
				</div>
				<div class='row'>
					<div class='col'>
						<table class='table border text-center'>
							<thead>
								<tr>
									<th>선택</th>
									<th>이름</th>
									<th>분류</th>
								</tr>
							</thead>
							<tbody id='clsList'>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class='modal-footer'>
				<button class='btn btn-outline-secondary col mr-2' data-dismiss='modal'>취 소</button>
				<button class='btn btn-secondary col ml-0' data-dismiss='modal' onclick='addCls(); chkInput(0);' id='addClsBtn'>
					추 가
				</button>
			</div>
		</div>
	</div>
</div>

<div id='addUsrClsFailModal' class='modal fade' tabindex='-3'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>클래스 등록 실패</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				현재 등록 가능한 클래스 수보다<br>
				선택한 클래스 수가 더 많습니다.
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-secondary' data-dismiss='modal'> 확 인 </button>
			</div>
		</div>
	</div>
</div>

<div id='addUsrClsFailModal2' class='modal fade' tabindex='-4'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>클래스 등록 실패</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				이미 가지고 있는 클래스가<br>
				선택한 클래스에 포함되어 있습니다.
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-secondary' data-dismiss='modal'> 확 인 </button>
			</div>
		</div>
	</div>
</div>