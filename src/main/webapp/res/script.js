function footerPosition() {
	$('footer').attr('style', 'position: fixed; bottom: 0;');
	if($('header').height() + $('#gnb').height() + $('#body').height() + $('footer').height() >=  $(window).height())
		$('footer').removeAttr('style', '');
}

function chkToday() { //오늘 날짜 이후 선택 불가
	$('#usrBDate').attr('max', new Date().toISOString().substring(0, 10));
}

function idChk(job) { //중복인지 아닌지
	switch(job) {
		case 1: msg = '사용'; break;
		case 2: msg = '조회';
	}
	
	if($('#usrId').val().length != 0) {
		if($('#usrId').val().search(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,4}$/) < 0) 
			$('#usrIdChk').html('<span class="text-danger">' + msg + ' 불가</span>');
		else
			$('#usrIdChk').html('<span class="text-success">' + msg + ' 가능</span>');
	} else $('#usrIdChk').empty();
}

function pwChk(job) {
	pw = $('#usrPw').val();
	
	switch(job) {
		case 1: msg = '사용'; break;
		case 2: msg = '조회'; break;
		case 3: msg = '변경';
	}
	
	if(pw.length != 0) {
		if(pw.length < 6 || 10 < pw.length || pw.search(/\s/) != -1 || pw.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/) != -1 
				|| pw.search(/[0-9]/) < 0 || pw.search(/[a-zA-Z]/) < 0 || pw.search(/[~!@#$%^&*()_+|<>?:{}]/) < 0)
			$('#usrPwChk').html('<span class="text-danger">' + msg + ' 불가</span>');
		else
			$('#usrPwChk').html('<span class="text-success">' + msg + ' 가능</span>');
	} else if(job == 3) {
		$('#usrPwChk').html('<span class="text-danger">필수 입력</span>');
	} else $('#usrPwChk').empty();
}

function pwAgainChk(job) {	
	if($('#usrPw').val().length != 0 && $('#usrPwAgain').val().length != 0) {
		if($('#usrPwAgain').val() == $('#usrPw').val())
			$('#usrPwAgainChk').html('<span class="text-success">일치</span>');
		else
			$('#usrPwAgainChk').html('<span class="text-danger">불일치</span>');
	} else if($('#usrPwAgain').val().length != 0) {
		$('#usrPwAgainChk').html('<span class="text-danger">불일치</span>');
		$('#usrPwChk').empty();
	} else if(job == 3) {
		$('#usrPwAgainChk').html('<span class="text-danger">필수 입력</span>');
	} else $('#usrPwAgainChk').empty();
}

function phoneChk(job) { //중복인지 아닌지
	switch(job) {
		case 1: msg = '사용'; break;
		case 2: msg = '조회'; break;
		case 3: msg = '변경';
	}

	$('#usrPhone').val($('#usrPhone').val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')); // 대시 없애기
	telNum = $('#usrPhone').val();
	
	if(telNum.length != 0) {
		if((8 < telNum.length && telNum.length < 12 && telNum.startsWith('0')) 
				|| (9 < telNum.length && telNum.length < 12 && telNum.startsWith('01')))
			$('#usrPhoneChk').html('<span class="text-success">' + msg + ' 가능</span>');
		else
			$('#usrPhoneChk').html('<span class="text-danger">' + msg + ' 불가</span>');
	} else if(job == 3) {
		$('#usrPhoneChk').html('<span class="text-danger">필수 입력</span>');
	} else $('#usrPhoneChk').empty();
}

function nameChk(job) { //중복인지 아닌지
	switch(job) {
		case 1: msg = '사용'; break;
		case 2: msg = '조회';
	}
	name = $('#usrName').val();
	
	if(name.length != 0) {
		if(name.length < 2 || name.search(/\s/) != -1 || name.search(/[가-힣]/) < 0 
				|| name.search(/[ㄱ-ㅎㅏ-ㅣ0-9a-zA-Z~!@#$%^&*()_+|<>?:{}]/) != -1)
			$('#usrNameChk').html('<span class="text-danger">' + msg + ' 불가</span>');
		else
			$('#usrNameChk').html('<span class="text-success">' + msg + ' 가능</span>');
	} else $('#usrNameChk').empty();
}

function nickChk(job) { //중복인지 아닌지, 비어있는 지 아닌 지, GM으로 시작하는 지
	$('#usrNickChk').empty();
	nick = $('#usrNick').val();
	
	switch(job) {
		case 1: msg = '사용'; break;
		case 2: msg = '변경';
	}
	
	if(nick.length != 0) {
		if(nick.length < 2 || nick.search(/[가-힣0-9a-zA-Z]/) < 0 || 6 < nick.length
				|| nick.search(/[ㄱ-ㅎㅏ-ㅣ~!@#$%^&*()_+|<>?:{}]/) != -1 || nick.search(/\s/) != -1 || nick.startsWith('GM')) 
			$('#usrNickChk').append('<span class="text-danger">' + msg + ' 불가</span>');
		else
			$('#usrNickChk').append('<span class="text-success">' + msg + ' 가능</span>');
	} else if(job == 2) {
		$('#usrNickChk').html('<span class="text-danger">필수 입력</span>');
	} else $('#usrNickChk').empty();
}

function switchClsIcon() { //대표 클래스 아이콘 변경
	if($('#clsIcon').attr('alt') == '운동 아이콘') {
		$('#clsIcon').attr('src', '#');
		$('#clsIcon').attr('alt', '공부 아이콘');
		$('#usrClsIcon').attr('value', 'studyIcon');
	} else {
		$('#clsIcon').attr('src', '#');
		$('#clsIcon').attr('alt', '운동 아이콘');
		$('#usrClsIcon').attr('value', 'exerciseIcon');
	}
}

function clsLimit() { //보유 클래스 수가 9개면 검색 버튼 비활성화, 0개라면 빼기 버튼 비활성화
	$('#usrClsNameChk').html('&nbsp;');
	$('#clsSrchBtn').attr('disabled', true);
	$('#clsRmvBtn').attr('disabled', true);
	
	if($('div[id^="usrClsList"] label').length == 9) {
		$('#usrClsNameChk').append('<span class="text-success">등록 가능한 수의 클래스를 전부 등록했습니다.</span>');
		$('#clsRmvBtn').removeAttr('disabled');
	} else if($('div[id^="usrClsList"] label').length == 0) {
		$('#usrClsNameChk').append('<span class="text-danger">클래스를 1개 이상 등록하세요.</span>');
		$('#clsSrchBtn').removeAttr('disabled');
	} else {
		$('#clsRmvBtn').removeAttr('disabled');
		$('#clsSrchBtn').removeAttr('disabled');
	}
}

/* 클래스 등록 관련 함수 */

function clsSrchBtnClick() { //클래스 검색 버튼 누를 시 선택했던 내 클래스 체크 해제
	$('#usrClsName:checked').prop('checked', false);
	$('#clsList').html('<tr><td colspan="3">2글자 이상 입력 후 검색해주세요.</td></tr>');
	$('#clsListAmnt').html('&nbsp;');
}

function rmvCls() { //클래스 빼기 버튼 누를 시 1개 이상 체크했는 지 확인
	$('#usrClsNameChk').html('&nbsp;');
	$('#clsSrchBtn').removeAttr('disabled');
	
	if($('#usrClsName:checked').length != 0)
		$('#usrClsName:checked').parent('label').remove();
	else
		$('#usrClsNameChk').append('<span class="text-danger">클래스를 1개 이상 선택해주세요.</span>');
}

function clsNameInChk() { //검색창에 2글자 이상 입력
	$('#srchClsBtn').attr('disabled', true);
	
	if(2 <= $('#clsNameIn').val().length)
		$('#srchClsBtn').removeAttr('disabled');
}

function srchCls() {
	clsIn = $('#clsNameIn').val();
	$('#clsNameIn').val('');
	
	if(clsIn == '운동') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="등산" name="exerciseCls" id="clsName"></td>' +
				'<td>등산</td>' +
				'<td>유산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="마라톤" name="exerciseCls" id="clsName"></td>' +
				'<td>마라톤</td>' +
				'<td>유산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="보디빌딩" name="exerciseCls" id="clsName"></td>' +
				'<td>보디빌딩</td>' +
				'<td>무산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="스트렝스" name="exerciseCls" id="clsName"></td>' +
				'<td>스트렝스</td>' +
				'<td>무산소</td>' +
			'</tr>');
	} else if(clsIn == '유산소') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="등산" name="exerciseCls" id="clsName"></td>' +
				'<td>등산</td>' +
				'<td>유산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="마라톤" name="exerciseCls" id="clsName"></td>' +
				'<td>마라톤</td>' +
				'<td>유산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="걷기" name="exerciseCls" id="clsName"></td>' +
				'<td>걷기</td>' +
				'<td>유산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="달리기" name="exerciseCls" id="clsName"></td>' +
				'<td>달리기</td>' +
				'<td>유산소</td>' +
			'</tr>');
	} else if(clsIn == '무산소') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="데드리프트" name="exerciseCls" id="clsName"></td>' +
				'<td>데드리프트</td>' +
				'<td>무산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="AB롤아웃" name="exerciseCls" id="clsName"></td>' +
				'<td>AB롤아웃</td>' +
				'<td>무산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="보디빌딩" name="exerciseCls" id="clsName"></td>' +
				'<td>보디빌딩</td>' +
				'<td>무산소</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="스쿼트" name="exerciseCls" id="clsName"></td>' +
				'<td>스쿼트</td>' +
				'<td>무산소</td>' +
			'</tr>');
	} else if(clsIn == '공부') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="TOEFL" name="studyCls" id="clsName"></td>' +
				'<td>TOEFL</td>' +
				'<td>언어</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="JLPT" name="studyCls" id="clsName"></td>' +
				'<td>JLPT</td>' +
				'<td>언어</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="GTQ" name="studyCls" id="clsName"></td>' +
				'<td>GTQ</td>' +
				'<td>자격증</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="간호사" name="studyCls" id="clsName"></td>' +
				'<td>간호사</td>' +
				'<td>자격증</td>' +
			'</tr>');
	} else if(clsIn == '언어') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="TOEFL" name="studyCls" id="clsName"></td>' +
				'<td>TOEFL</td>' +
				'<td>언어</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="TOEIC" name="studyCls" id="clsName"></td>' +
				'<td>TOEIC</td>' +
				'<td>언어</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="HSK" name="studyCls" id="clsName"></td>' +
				'<td>HSK</td>' +
				'<td>언어</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="JLPT" name="studyCls" id="clsName"></td>' +
				'<td>JLPT</td>' +
				'<td>언어</td>' +
			'</tr>');
	} else if(clsIn == '코딩') {
		$('#clsList').html(
			'<tr>' +
				'<td><input type="checkbox" value="Java" name="studyCls" id="clsName"></td>' +
				'<td>Java</td>' +
				'<td>코딩</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="Java Script" name="studyCls" id="clsName"></td>' +
				'<td>Java Script</td>' +
				'<td>코딩</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="Kotlin" name="studyCls" id="clsName"></td>' +
				'<td>Kotlin</td>' +
				'<td>코딩</td>' +
			'</tr>' +
			'<tr>' +
				'<td><input type="checkbox" value="CSS" name="studyCls" id="clsName"></td>' +
				'<td>CSS</td>' +
				'<td>코딩</td>' +
			'</tr>');
	} else {
		$('#clsList').html(
			'<tr><td colspan="3"><span class="text-danger font-weight-bold">' +
				'「' + clsIn + '」</span>에 대한 검색결과가 없습니다.' +
			'</td></tr>')
	}
	$('#clsListAmnt').text('총 ' + document.querySelectorAll('#clsList #clsName').length + '건 검색');
}

function chkCls() { //클래스 검색창에서 클래스 선택을 0개 하면 추가 버튼 비활성화
	$('#addClsBtn').attr('disabled', true);
	
	if($('#clsName:checked').length != 0)
		$('#addClsBtn').removeAttr('disabled');
}

function addCls() { //클래스 검색창에서 추가 버튼 클릭 시, 선택수 + 보유 클래스 수가 9개 초과면 추가 실패창, 9개 이하면 추가하기
	$('#clsName:checked').each(function() { //보유한 게 있는 지 중복 검사
		parents = $('#usrClsSetting').text();
		selectCls = $(this).val();
		if(parents.search(selectCls) != -1) {
			$('#clsSrchModal').modal('hide');
			$('#addUsrClsFailModal2').modal('show');
			$('#clsName:checked').prop('checked', false);
		}
	})

	if(9 < $('#clsName:checked').length + document.querySelectorAll('#usrClsName').length) {
		$('#clsSrchModal').modal('hide');
		$('#addUsrClsFailModal').modal('show');
		$('#clsName:checked').prop('checked', false);
	} else {
		$('#clsName:checked').each(function() {
			if(document.querySelectorAll('#usrClsList1 #usrClsName').length < 3) {
				$('#usrClsList1').append(
					'<label for=' + $(this).val() + '>' +
						'<input type="checkbox" name="usrClsName" value=' + $(this).val() + ' id="usrClsName">' +
						$(this).val() +
						'<input type="text" value=' + $(this).val() + ' hidden="true" readonly>' +
					'</label>')
			} else if(document.querySelectorAll('#usrClsList2 #usrClsName').length < 3) {
				$('#usrClsList2').append(
					'<label for=' + $(this).val() + '>' +
						'<input type="checkbox" name="usrClsName" value=' + $(this).val() + ' id="usrClsName">' +
						$(this).val() +
						'<input type="text" value=' + $(this).val() + ' hidden="true" readonly>' +
					'</label>')
			} else if(document.querySelectorAll('#usrClsList3 #usrClsName').length < 3) {
				$('#usrClsList3').append(
					'<label for=' + $(this).val() + '>' +
						'<input type="checkbox" name="usrClsName" value=' + $(this).val() + ' id="usrClsName">' +
						$(this).val() +
						'<input type="text" value=' + $(this).val() + ' hidden="true" readonly>' +
					'</label>')
			}
			
			$(this).prop('checked', false);
		})
	}
}

/* 인풋값 이상있는 지 없는 지 */
function chkInput(num) { //input 값 봤을 때 이상 없는 지.
	$('#nextStepBtn').attr('disabled', true); 
	allInput = document.querySelectorAll('h6 span').length;
	goodInput = document.querySelectorAll('h6 .text-success').length;
	wrongInput = document.querySelectorAll('h6 .text-danger').length;
	
	if(allInput - goodInput == 0 && wrongInput < 1 && num <= allInput)
		$('#nextStepBtn').removeAttr('disabled');
}

window.onload = function(){
	$(footerPosition);
	$(window).resize(function() {
		$(footerPosition);
	})
	$(chkToday);
}

/*
b = business 업무	(회원, 클래스, 퀘스트, 보상, 게시글, 댓글)
f = function 기능	(추가, 수정, 삭제, 신고)
result = 결과		(성공, 실패, 확인, 중단, 중단확인)
id = 체크박스 아이디

예)
b = usr / f = add / result = suc
유저 추가 성공
*/

/* b를 가지고 f 작업을 하기 전에 id 값의 체크박스가 체크되어있는 지 */
/* 나중에 여기에 펑션값에 database 리턴값 관련 파라미터 넣기 */
function isChecked(b, f, id) {
	switch(f) {
	case "추가":
		$("#" + id + ":checked").prop('checked', false); break;
	case "수정":
		if($("#" + id + ":checked").length != 1)
			modal(b, f, '실패2');
		else if(b == "내가 쓴 게시글" || b == "내가 쓴 댓글")
			modal(b, f, '진행');
		else $("#fixProcModal").modal('show'); break;
	case "신고": case "삭제":
		if($("#" + id + ":checked").length == 0)
			modal(b, f, '실패3');
		else modal(b, f, '확인'); break;
	default:
		if($("#" + id + ":checked").length == 0)
			modal(b, f, '실패3');
		else modal(b, f, '성공'); break;
	}
}

function isRadioChecked(b, f, id, id2) {
	if($("#" + id + ":checked").length != 1 && $("#" + id2 + ":checked").length != 1)
		modal(b, f, '실패9');
	else modal(b, f, '완료');
}

/*
b를 가지고 f 작업을 했을 때 result에 따라 모달 내용이 바뀐다.
진행 : 특정 작업을 진행하기 위해 이동 - 예를 들어 마이페이지에서 내가 쓴 게시글 수정
성공, 실패 : 기본적인 성공 실패 모달
실패2 : 수정 시 체크를 0개 혹은 2개 이상 했을 때
실패3 : 삭제, 신고 등 여러 작업 시 체크를 0개 했을 때
실패4 : 선택항목 중 존재하지 않는 게 포함되어 있을 때
실패5 : 진행하고자 하는 작업이 이미 완료된 항목이 선택에 포함되어있을 때
실패6 : 회원이 활동 정지 당한 상태일 때
실패7 : 회원이 뉴비일 때 (메일인증 받지 않았을 때)
실패8 : 가입하지 않은 사용자일 때
실패9 : admin의 쿠폰 발급 선택값 없을 때
확인 : 삭제, 신고 등의 작업을 다시 한번 묻기
완료 : 보상 쿠폰 사용 완료, 퀘스트 제출 완료와 같이 특정 업무에 사용
중단 : 이전으로 돌아가거나 수정/추가 등의 작업을 캔슬할 때 사용
중단2 : '중단'에 대한 부차적인 모달로, 직접 사용은 지양
 */
function modal(b, f, result, ...msg) {
	$('#bFResultModal #modalTitle').empty();
	$('#bFResultModal #modalContent').empty();
	$('#bFResultModal #modalBtn').empty();
	
	modalTitle = b + '&nbsp;' + f + '&nbsp;' + result;
	modalContent = '<h5 class="mt-2">' + b;
	
	modalBtn = "#bFResultModal #modalBtn"; /* 모달 버튼이 들어갈 자리 */
	modalBtnMove = "<button class='btn btn-outline-secondary' onclick='moveTo(\"" + b + "\", \"" + f + "\")'> 확 인 </button>"; /* 클릭 시 이동하는 버튼 */
	modalBtnClose = "<button class='btn btn-outline-secondary' data-dismiss='modal'> 확 인 </button>"; /* 클릭 시 모달 닫기만 하는 버튼 */
	modalBtnProc = "<button class='btn btn-outline-secondary' data-dismiss='modal' onclick='finBusiness(\"" + b + "\", \"" + f + "\")'> 확 인 </button>"; /* 클릭 시 업무를 완료하는 버튼 */
	
	switch(result) {
	case "진행":
		modalContent += ' 페이지로 이동합니다.</h5>';
		$(modalBtn).html(modalBtnMove); break;
	case "성공":
		modalContent += '&nbsp;' + f + '에 ' + result + '하였습니다.</h5>';		
		if(f == "인증")
			$(modalBtn).html("<a class='btn btn-outline-secondary' href='mypage.html'>마이 페이지로 이동 <i class='fas fa-gamepad'></i></button>");
		else $(modalBtn).html(modalBtnProc); break;
	case "실패": case "실패2": case "실패3": case "실패4": case "실패5": case "실패6": case "실패7": case "실패8": case "실패9": case "실패10":
		modalTitle = b + '&nbsp;' + f + ' 실패';
		modalContent += '&nbsp;' + f + '에 실패하였습니다.</h5> <h6 class="text-danger mt-2">'
		$(modalBtn).html(modalBtnClose);
		if(result == "실패")
			modalContent = '<h5 class="mt-2">' + b + '&nbsp;' + f + '에 실패하였습니다.</h5>';
		else if(result == "실패2")
			modalContent += '수정할 항목 <b><u>하나를</u></b> 선택하세요.</h6>';
		else if(result == "실패3")
			modalContent += f + '할 항목을  <b><u>하나 이상</u></b> 선택하세요.</h6>';
		else if(result == "실패4")
			modalContent += '존재하지 않는 항목이 선택에 포함되어 있습니다.</h6>';
		else if(result == "실패5")
			modalContent += '이미 ' + f + ' 처리된 항목이 선택에 포함되어 있습니다.</h6>';
		else if(result == "실패6") {
			modalTitle = '서비스 이용 불가';
			modalContent += '활동이 정지된 회원은<br>' + b + '&nbsp;' + f + '작업을 할 수 없습니다.</h6>';
			$(modalBtn).html("<button class='btn btn-outline-secondary' data-dismiss='modal'>확 인 <i class='fas fa-exclamation-circle'></i></button>");
		} else if(result == "실패7") {
			modalTitle = '메일을 인증해주세요!';
			modalContent = '<h5 class="mt-2">해당 서비스를 이용하기 위해<br>메일을 인증해주세요.</h5>';
			$(modalBtn).html("<a class='btn btn-outline-secondary' href='../user/12.html'>인증하기 <i class='fas fa-external-link-alt'></i></button>");
		} else if(result == "실패8") {
			modalTitle = '용사님! 일어나세요!';
			modalContent = '<h5 class="mt-2">해당 서비스를 이용하기 위해<br>갓생살기 게임즈에 가입하세요!</h5>';
			$(modalBtn).html("<a class='btn btn-outline-secondary' href='../user/02.html'>가입하기 <i class='fas fa-hat-wizard'></i></button>");
		} else if(result == "실패9")
			modalContent += '발급할 쿠폰과 발급받을 대상을 <b><u>하나씩</u></b> 선택하세요.</h6>';
		else modalContent += msg + '</h6>'; break;
	case "확인":
		if(b == '클래스' || b == '퀘스트')
			modalContent += '를 정말 ' + f + '하시겠습니까?</h5>';
		else if(b == '댓글' || b == '게시글')
			modalContent += '을 ' + f + '하시겠습니까?</h5>';
		else modalContent += '을 정말 ' + f + '하시겠습니까?</h5>';
		$(modalBtn).html(
			"<button class='btn btn-outline-secondary' data-dismiss='modal'> 아니오 </button>" +
			"<button class='btn btn-secondary' onclick='modal(\"" + b + "\", \"" + f + "\", \"완료\")'> 예 </button>"); break;
	case "완료":
		if(b != '클래스' || b != '퀘스트' || b != '로고' || b != '이미지' || b != '로그')
			modalContent += '을 ' + f + '하였습니다.</h5>';
		else modalContent += '를 ' + f + '하였습니다.</h5>';
		if(b == '게시글' || b == '댓글') $(modalBtn).html(modalBtnProc);
		else $(modalBtn).html(modalBtnClose); break;
	case "중단":
		modalTitle = b + '&nbsp;' + f + ' 중단 확인';
		modalContent += '&nbsp;' + f + ' 작업을 정말 중단 하시겠습니까?</h5>' +
						'<h6 class="text-danger mt-2">중단할 시 작업 중인 내용이 저장되지 않습니다.</h6>';
		$(modalBtn).html(
			"<button class='btn btn-outline-secondary' data-dismiss='modal'> 아니오 </button>" +
			"<button class='btn btn-secondary' onclick='modal(\"" + b + "\", \"" + f + "\", \"중단2\")'> 예 </button>"); break;
	case "중단2":
		modalTitle = b + '&nbsp;' + f + ' 중단';
		modalContent += '&nbsp;' + f + ' 작업을 중단하였습니다.</h5>';
		if(b != '게시글' && (f == '추가' || f == '수정')) {
			$(modalBtn).html(modalBtnMove);
			if(f == '추가') $("#addProcModal").modal('hide');
			else $("#fixProcModal").modal('hide');
		} else
			$(modalBtn).html(modalBtnMove);
	}
	
	$('#bFResultModal #modalTitle').html(modalTitle);
	$('#bFResultModal #modalContent').html(modalContent);
	
	$('#bFResultModal').modal('show');
}

function finBusiness(b, f) {
	arr = ['회원', '메일', '클래스', '퀘스트', '쿠폰', '게시글', '댓글', '로고', '이미지', '로그', '약관'];
	
	for(i = 0; i < 11; i++) {
		b2 = arr[i];
		if(b.includes(b2)) {
			console.log(f.includes(b2))
			doBusiness(b2, f); return;
		}
	}
}

/*
진행 과 중단2 에 사용되는 함수이다.
 */
function moveTo(b, f) {
	if(b == "내가 쓴 게시글" || b == "내가 쓴 댓글" || b == "내가 쓴 게시물") location.href = "../community/02.html";
	else switch(b) {
			case "메일": case "회원":
				if(f != "가입") location.href = "mypage.html";
				else location.href = "/kwonchaerin.selfdevelopment/"; break;
			case "게시글": if(f == '수정') location.href = "02.html"; else location.href = "01.html"; break;
			default: 
				if(b != "댓글") location.href = "01.html";
				else location.reload();
		}
}

/* 전체선택 알고리즘 */
$(document).ready(function() {
	$('#checkCol input[id^="checkall"]').click(function() {
		if($(this).prop('checked'))
			$('input[name=check' + $(this).attr('id').substring(8) + ']').prop('checked', true);
		else
			$('input[name=check' + $(this).attr('id').substring(8) + ']').prop('checked', false);
	})
});



/* 커뮤니티업무용 공통 함수 */
/*타이틀과 본문내용 2글자 이상씩 쓰면 등록의 disabled->able로 변환 _ community */
function onPostBtn() {
   if($('#contents').val().length >= 2 && $('#title').val().length >=2 && $('#selector option:selected').val() != 'chooseBoard')
      $('#pstUpBtn').removeAttr('disabled');
   else
      $('#pstUpBtn').attr('disabled', true);
}

function doBusiness(b, f) {
	if(b == "게시글") {
		switch(f) {
		case "등록": case "수정": /*$('#usrPstForm').submit();*/
			location.href = "02.html"; break;
		case "삭제": location.href = "01.html";
		}
	} else if(b == "댓글") {
		beforeCmtPst = $('#cmmCmtPst').val();
		$('#cmmCmtPst').attr('readonly');
		$('#cmmCmtPst').val('');
		
		switch(f) {
		case "등록": /*$('#cmtForm').submit();*/
			$('#cmtContents').append( //댓글 리스트를 서버에서 받아와서 추가해둔다.
				"<div id='usrCmt' class='my-2'>" +
					"<span class='badge text-light bg-secondary' id='usrLv'>7</span>" +
					"<a class='btn btn-sm p-1 m-0 font-weight-bold titleColor' href='../user/07.html' id='usrNick'>버거먹고싶당</a>" +
					"<div id='usrCmtBtns' class='btn-group float-right'>" +
						"<button type='button' id='cmtDelBtn' onclick='modal(\"댓글\", \"삭제\", \"확인\")' class='btn btn-sm text-secondary m-0' title='삭제'><i class='fas fa-times'></i></button>" +
						"<button type='button' id='cmtFixProcBtn' onclick='fixProcFn()' class='btn btn-sm text-secondary my-0 ml-1' title='수정'><i class='far fa-edit'></i></button>" +
						"<button type='button' id='cmtFixCnclBtn' onclick='modal(\"댓글\", \"수정\", \"중단\")' class='btn btn-sm text-secondary m-0' title='수정 취소' hidden=\"true\"><i class='fas fa-backspace'></i></i></button>" +
						"<button type='button' id='cmtFixSaveBtn' onclick='fixSaveFn()' class='btn btn-sm text-secondary my-0 ml-1' title='저장' hidden=\"true\"><i class='fas fa-save'></i></button>" +
					"</div>" +
	         		"<input name='usrCmt' id='usrCmt3' value='" + beforeCmtPst + "' class='m-0 pl-0 py-0 form-control-plaintext mr-2' readonly>" +
				"</div>");
		break;
		case "수정": /* 수정 취소 버튼 눌렀을 때 */
			$('#usrCmt #usrCmt3').val(beforeCmtPst);
			$('#cmtFixProcBtn').removeAttr('hidden');
			$('#cmtDelBtn').removeAttr('hidden');
			$('#cmtFixSaveBtn').attr('hidden', true);
			$('#cmtFixCnclBtn').attr('hidden', true);
			$('#usrCmt #usrCmt3').attr('readonly');
			$('#usrCmt #usrCmt3').attr('class', 'm-0 pl-0 py-0 form-control-plaintext mr-2'); break;
		case "삭제": /* 삭제 버튼 눌렀을 때 */
			$('#cmtFixProcBtn').removeAttr('hidden');
			$('#cmtDelBtn').removeAttr('hidden');
			$('#cmtFixSaveBtn').attr('hidden', true);
			$('#cmtFixCnclBtn').attr('hidden', true);
			$('#usrCmt #usrCmt3').closest("#usrCmt").remove();
		}
	}
}