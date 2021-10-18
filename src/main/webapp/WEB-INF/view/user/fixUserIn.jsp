<title>갓겜:회원정보변경</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#clsIcon {
	width: 7.5rem;
	height: 7.5rem;
}

#switchClsIconBtn {
	left: 5.85rem;
}

#usrClsSetting label {
	width: 5rem;
}
</style>

<script>
$(document).ready(function() {
	$(clsLimit);
	pwChk(3);
	pwAgainChk(3);
})
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container'>
		<div class='row my-5'>
			<div class='col'>
				<div class='row my-2'>
					<h2>회원정보변경</h2>
				</div>
				<hr>
				<div class='row ml-3 mt-4'>
					<h3 class='text-muted'>본인확인 ></h3>
					<pre> </pre><h3 class='font-weight-bold'>정보변경</h3>
				</div>
				<div class='row ml-3 mt-4'>
					<small class='h6'> 이름 변경은 직접 메일로 직접 문의주시길 바랍니다. (신분증 첨부 필수)<br> 정보를 변경하고자 하는 정보만 새로 입력하시기 바랍니다.</small>
				</div>
				<form id='fixUsr' class='mt-3' action='#'>
					<div class='row mx-5 justify-content-center text-nowrap'>
						<div class='col-5'>
							<div class='row mt-3 mb-2'>
								<label for='usrId' class='col-2 pl-1 mt-1 mr-3 font-weight-bold'>ID</label>
								<input type='text' class='col form-control'
									name='usrIn' id='usrId' value='user@user.com' readonly>
							</div>
							<div class='row'>
								<label for='usrName' class='col-2 pl-1 mt-1 mr-3 font-weight-bold'>이름</label>
								<input type='text' class='col form-control'
									name='usrIn' id='usrName' value='김회원' readonly>
							</div>
							<div class='row justify-content-end mt-1'>
								<a href='mailto:godgamez@gmail.com' onclick='window.open(this.href, "_blank", "width=500px, height=800px, toolbars=no, scrollbars=yes"); return false;'>
									<small class='text-right text-muted ml-2'>
										이름 변경 문의 하기 <i class='far fa-question-circle'></i> 
									</small>
								</a>
							</div>
							<div class='row mt-3' id='usrIn'>
								<label for='usrNick' class='col-2 pl-1 mt-1 mr-3 font-weight-bold'>별명</label>
								<input type='text' class='col form-control'
									name='usrIn' id='usrNick' onchange='nickChk(3); chkInput(2);' value='김회원1v'>
								<h6 class='font-wieght-bold' id='usrNickChk'></h6>
							</div>
							<div class='row justify-content-end mt-1'>
								<small class='text-right text-muted ml-2'>
									영문 대소문자/숫자/한글 2자 이상
								</small>
							</div>
						</div>
						<div class='col-1'></div>
						<div class='col-5'>
							<div class='row mt-3 mb-2' id='usrIn'>
								<label for='usrPw' class='col-3 pl-1 mt-1 mr-3 font-weight-bold'>PW</label>
								<input type='password' class='col form-control'
									name='usrIn' id='usrPw' onchange='pwChk(3); pwAgainChk(3); chkInput(2);' required>
								<h6 class='font-wieght-bold' id='usrPwChk'></h6>
							</div>
							<div class='row' id='usrIn'>
								<label for='usrPwAgain' class='col-3 pl-1 mt-1 mr-3 font-weight-bold'>PW 확인</label>
								<input type='password' class='col form-control'
									name='usrIn' id='usrPwAgain' onchange='pwAgainChk(3); chkInput(2);' required>
								<h6 class='font-wieght-bold' id='usrPwAgainChk'></h6>
							</div>
							<div class='row justify-content-end mt-1'>
								<small class='text-right text-dark ml-2'>
										영문 대소문자+숫자+특수문자 6~10자
								</small>
							</div>
							<div class='row mt-3' id='usrIn'>
								<label for='usrPwAgain' class='col-3 pl-1 mt-1 mr-3 font-weight-bold'>전화번호</label>
								<input type='tel' class='col form-control' name='usrIn' id='usrPhone'
									placeholder=' 전화번호를 입력해주세요.' onchange='phoneChk(3); chkInput(2);' value='01012345678'>
								<h6 class='font-wieght-bold' id='usrPhoneChk'></h6>
							</div>
						</div>
					</div>
					<div class='row mt-3 mx-5 justify-content-around'>
						<div class='col-11'>
							<div class='row'>
								<label for='usrCls' class='col-2 pl-1 mt-1 mr-3 font-weight-bold'>CLASS</label>
							</div>
							<div class='row ml-5' id='usrClsSetting'>
								<div class='col m-0'>
									<img src='#' class='border' alt='공부 아이콘' id='clsIcon'>
									<button type='button' class='btn btn-secondary' id='switchClsIconBtn' onclick='switchClsIcon()'>
										<i class='fas fa-arrows-alt-h'></i>
									</button>
									<input type='text' hidden='true' id='usrClsIcon' value='studyIcon'>
								</div>
								<div class='col' id='usrClsList1'>
									<label for='JSTL'>
										<input type='checkbox' name='usrClsName' value='JSTL' id='usrClsName'>
										JSTL
										<input type='text' value='JSTL' hidden='true' readonly>
									</label>
									<label for='TOEFL'>
										<input type='checkbox' name='usrClsName' value='TOEFL' id='usrClsName'>
										TOEFL
										<input type='text' value='TOEFL' hidden='true' readonly>
									</label>
									<label for='TOEIC'>
										<input type='checkbox' name='usrClsName' value='TOEIC' id='usrClsName'>
										TOEIC
										<input type='text' value='TOEIC' hidden='true' readonly>
									</label>
								</div>
								<div class='col' id='usrClsList2'>
									<label for='Java'>
										<input type='checkbox' name='usrClsName' value='Java' id='usrClsName'>
										Java
										<input type='text' value='Java' hidden='true' readonly>
									</label>
									<label for='Kotlin'>
										<input type='checkbox' name='usrClsName' value='Kotlin' id='usrClsName'>
										Kotlin
										<input type='text' value='Kotlin' hidden='true' readonly>
									</label>
									<label for='C++'>
										<input type='checkbox' name='usrClsName' value='C++' id='usrClsName'>
										C++
										<input type='text' value='C++' hidden='true' readonly>
									</label>
								</div>
								<div class='col' id='usrClsList3'>
									<label for='달리기'>
										<input type='checkbox' name='usrClsName' value='달리기' id='usrClsName'>
										달리기
										<input type='text' value='달리기' hidden='true' readonly>
									</label>
									<label for='수영'>
										<input type='checkbox' name='usrClsName' value='수영' id='usrClsName'>
										수영
										<input type='text' value='수영' hidden='true' readonly>
									</label>
									<label for='웨이트'>
										<input type='checkbox' name='usrClsName' value='웨이트' id='usrClsName'>
										웨이트
										<input type='text' value='웨이트' hidden='true' readonly>
									</label>
								</div>
								<div class='col align-self-end'>
									<button type='button' class='btn btn-secondary text-center float-right'
										data-toggle='modal' data-target='#clsSrchModal' id='clsSrchBtn'
										onclick='clsLimit(); clsSrchBtnClick(); chkInput(2);' disabled>
										<i class='fas fa-plus'></i>
									</button>
									<button type='button' class='btn btn-outline-secondary text-center float-right'
										onclick='clsLimit(); rmvCls(); chkInput(2);' id='clsRmvBtn' disabled>
										<i class='fas fa-minus'></i>
									</button>
								</div>
							</div>
							<div class='row justify-content-end'>
								<h6 class='font-wieght-bold mr-3 mt-1' id='usrClsNameChk'>&nbsp;</h6>
							</div>
						</div>
					</div>
					<div class='row mt-4 justify-content-center'>
						<button type='button' class='btn btn-outline-secondary col-5 mr-1' onclick='modal("회원", "정보 변경", "중단")'>
							이전
						</button>
						<button type='button' class='btn btn-secondary col-5'
							onmouseover='clsSrchBtnClick()' onclick='modal("회원", "정보 변경", "성공")' id='nextStepBtn' disabled>
							변경하기
						</button>
					</div>
				</form>
				<hr>
				<div class='row mb-5'>
					<div class='col'>
						<h6 class='small text-muted'>이전 단계로 돌아갈 시, 변경사항이 저장되지 않습니다.</h6>
					</div>
				</div>
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

<div id='clsSrchModal' class='modal fade' onmousemove='chkCls()' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>클래스 검색</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<div class='row' onmousemove='clsNameInChk()'>
					<input type='text' class='form-control col my-3 ml-3' id='clsNameIn'>
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
				<button class='btn btn-secondary col ml-0' data-dismiss='modal' onclick='addCls()' id='addClsBtn' disabled>
					추 가
				</button>
			</div>
		</div>
	</div>
</div>

<div id='addUsrClsFailModal' class='modal fade' tabindex='-1'>
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

<div id='addUsrClsFailModal2' class='modal fade' tabindex='-1'>
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
