<title>갓겜:회원 관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#usrSrchOpt {
	height: 2.3rem;
	width: 6rem;
}

#usrSrchBtn {
	height: 2.3rem;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

#usrSrchIn {
	height: 2.3rem;
	border-radius: 0;
	width: 10rem;
}

#pUsrBtn, #outUsrBtn, #noobUsrBtn, #gmUsrBtn {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	width: 2.8rem;
	text-align: center;
}

.btn-group .btn {
	border-top: 0;
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.modal-dialog .modal-fullsize {
	max-width: 120%;
	height: 50%;
	margin: 0;
	padding: 0;
}

.modal .modal-center {
	text-align: center;
}

@media screen and (min-width: 768px) { 
	.modal .modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog .modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle; 
}

#usrClsList {
	position: relative;
	height: 5rem;
}

#usrClsList label {
	width: 5rem;
}

#usrClsList #addClsBtn {
	position: absolute;
	top: 0;
	right: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	width: 2.5rem;
	height: 2.5rem;
}

#usrClsList #rmvClsBtn {
	position: absolute;
	top: 2.5rem;
	right: 0;
	border-top-right-radius: 0;
	border-top-left-radius: 0;
	width: 2.5rem;
	height: 2.5rem;
}

textarea {
	resize: none;
}

#usrDetail {
	cursor: pointer;
}
</style>
<script>
$(document).ready(function() {
	$('table #usrDetail').click(function() {
		$('#getUsrModal').modal('show');
	})
	
	$('#getUsrModalBtn #fixUsrInBtn').click(function() {
		$(getUser);
		
		$('#getUsrModalBtn #fixUsrBtn').click(function() {
			$(fixUser);
		});
		
		$('#getUsrModalBtn #fixUsrCnclBtn').click(function() {
			$(fixUserCancel);
		});
	});
})

function getUser() {
	$('#getUsrModal #usrId').removeAttr('disabled');
	$('#getUsrModal #usrPw').removeAttr('disabled');
	$('#getUsrModal #usrName').removeAttr('disabled');
	$('#getUsrModal #nickname').removeAttr('disabled');
	$('#getUsrModal #birthday').removeAttr('disabled');
	$('#getUsrModal #phoneNum').removeAttr('disabled');
	$('#getUsrModal #usrClss').removeAttr('disabled');
	$('#getUsrModal #addClsBtn').removeAttr('disabled');
	$('#getUsrModal #rmvClsBtn').removeAttr('disabled');
	$('#getUsrModal #usrClsName').removeAttr('hidden');
	
	$('#getUsrModal #getUsrModalBtn').html(
		"<button type='button' class='btn btn-outline-secondary' id='fixUsrCnclBtn' onclick='fixUserCancel()'>취소</button>" +
		"<button type='button' class='btn btn-secondary' id='fixUsrBtn' onclick='fixUser()'>저장</button>"		
	);
}

function fixUser() {
	$('#getUsrModal #usrId').attr('disabled', true);
	$('#getUsrModal #usrPw').attr('disabled', true);
	$('#getUsrModal #usrName').attr('disabled', true);
	$('#getUsrModal #nickname').attr('disabled', true);
	$('#getUsrModal #birthday').attr('disabled', true);
	$('#getUsrModal #phoneNum').attr('disabled', true);
	$('#getUsrModal #usrClss').attr('disabled', true);
	$('#getUsrModal #addClsBtn').attr('disabled', true);
	$('#getUsrModal #rmvClsBtn').attr('disabled', true);
	$('#getUsrModal #usrClsName').attr('hidden', true);
	
	$('#getUsrModal #getUsrModalBtn').html(
		"<button type='button' class='btn btn-outline-secondary' id='fixUsrInBtn' onclick='getUser()'>수정</button>"
	);
}

function fixUserCancel() {
	$('#getUsrModal #usrId').attr('disabled', true);
	$('#getUsrModal #usrPw').attr('disabled', true);
	$('#getUsrModal #usrName').attr('disabled', true);
	$('#getUsrModal #nickname').attr('disabled', true);
	$('#getUsrModal #birthday').attr('disabled', true);
	$('#getUsrModal #phoneNum').attr('disabled', true);
	$('#getUsrModal #usrClss').attr('disabled', true);
	$('#getUsrModal #addClsBtn').attr('disabled', true);
	$('#getUsrModal #rmvClsBtn').attr('disabled', true);
	$('#getUsrModal #usrClsName').attr('hidden', true);

	$('#getUsrModal #getUsrModalBtn').html(
		"<button type='button' class='btn btn-outline-secondary' id='fixUsrInBtn' onclick='getUser()'>수정</button>"
	);
	
	$('#getUsrModal').modal('hide');
}
</script>
<div class='h-100'>
	<%@ include file='../include/header.jsp' %>

	<div id='underHead' class='row w-100'>
		
		<%@ include file='../include/gnb.jsp' %>
		
		<div class='col' id='adminBody'>
			<div class='row mt-3 mx-3 justify-content-between'>
				<h4>
					회원 목록
					<a type='button' class='small text-muted' id='listUsrsBtn'>
						<i class='fas fa-redo'></i>
					</a>
				</h4>
				<small class='text-muted'><br>총 112건</small>
			</div>
			<hr>
			<div class='row mt-2'>
				<div class='col-6 d-flex justify-content-start'>
					<nav class='nav nav-tabs border-0'>
						<a id='pUsrBtn' data-toggle='tab' href='#pUsrBoard' class='nav-link btn btn-outline-secondary active border-0 text-nowrap' title='PLAYER'>P</a>
						<a id='oUsrBtn' data-toggle='tab' href='#oUsrBoard' class='nav-link btn btn-outline-secondary border-0 text-nowrap' title='OUT'>O</a>
						<a id='nUsrBtn' data-toggle='tab' href='#nUsrBoard' class='nav-link btn btn-outline-secondary border-0 text-nowrap' title='NOOB'>N</a>
						<a id='mUsrBtn' data-toggle='tab' href='#mUsrBoard' class='nav-link btn btn-outline-secondary border-0 text-nowrap' title='GM'>M</a>
					</nav>
				</div>
				<div class='col-6 d-flex justify-content-end text-nowrap'>
					<select class="form-select" aria-label="usrSrchOpt" id='usrSrchOpt'>
					  <option selected disabled>검색 조건</option>
					  <option value="usrName">이름</option>
					  <option value="usrId">ID</option>
					  <option value="usrCode">코드</option>
					</select>
					<input type='text' class='form-control' placeholder='2글자 이상 입력하세요.' id='usrSrchIn'>
					<button type='button' class='btn btn-secondary' id='usrSrchBtn'>
						<i class="fas fa-search"></i> 검색
					</button>
				</div>
			</div>
			<div class='row mt-0'>
				<div class='col'>
					<div class='tab-content'>
						<div class='tab-pane fade show active' id='pUsrBoard'>
							<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
								<thead>
									<tr class='text-nowrap text-center'>
										<th id='checkCol'>
											<input type='checkbox' id='checkall1'>
										</th>
										<th width='8%'>포지션</th>
										<th width='15%'>ID</th>
										<th width='10%'>이름</th>
										<th width='15%'>별명</th>
										<th width='12%'>생년월일</th>
										<th width='8%'>레벨</th>
										<th width='10%'>골드</th>
									</tr>
								</thead>
								<tbody class='small'>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='010'>
										</td>
										<td id='usrPosition'>N</td>
										<td id='usrId'>aaa@email.com</td>
										<td id='usrName'>박희선</td>
										<td id='usrNick'>바키선22</td>
										<td id='usrBirthDate'>99-11-11</td>
										<td id='usrLv'>0</td>
										<td id='gold'>464</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='009'>
										</td>
										<td id='usrPosition'>O</td>
										<td id='usrId'>bbb@email.com</td>
										<td id='usrName'>안석필</td>
										<td id='usrNick'>v앙떠기v</td>
										<td id='usrBirthDate'>60-01-01</td>
										<td id='usrLv'>0</td>
										<td id='gold'>0</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='008'>
										</td>
										<td id='usrPosition'>P</td>
										<td id='usrId'>ccc@email.com</td>
										<td id='usrName'>김혜원</td>
										<td id='usrNick'>김혜원</td>
										<td id='usrBirthDate'>88-08-08</td>
										<td id='usrLv'>19</td>
										<td id='gold'>110</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='007'>
										</td>
										<td id='usrPosition'>P</td>
										<td id='usrId'>ddd@email.com</td>
										<td id='usrName'>김창석</td>
										<td id='usrNick'>땽뗘기</td>
										<td id='usrBirthDate'>01-10-30</td>
										<td id='usrLv'>34</td>
										<td id='gold'>2222</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='006'>
										</td>
										<td id='usrPosition'>N</td>
										<td id='usrId'>eee@email.com</td>
										<td id='usrName'>홍순자</td>
										<td id='usrNick'>순자는귀여워</td>
										<td id='usrBirthDate'>00-12-04</td>
										<td id='usrLv'>0</td>
										<td id='gold'>165</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='005'>
										</td>
										<td id='usrPosition'>P</td>
										<td id='usrId'>fff@email.com</td>
										<td id='usrName'>남궁민기</td>
										<td id='usrNick'>MINKI</td>
										<td id='usrBirthDate'>99-12-10</td>
										<td id='usrLv'>2</td>
										<td id='gold'>1132</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='004'>
										</td>
										<td id='usrPosition'>P</td>
										<td id='usrId'>ggg@email.com</td>
										<td id='usrName'>강진홍</td>
										<td id='usrNick'>jinjin</td>
										<td id='usrBirthDate'>99-05-08</td>
										<td id='usrLv'>4</td>
										<td id='gold'>2001</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check1' id='usrCode' value='003'>
										</td>
										<td id='usrPosition'>P</td>
										<td id='usrId'>hhh@email.com</td>
										<td id='usrName'>변예송</td>
										<td id='usrNick'>YES옹</td>
										<td id='usrBirthDate'>54-06-18</td>
										<td id='usrLv'>1</td>
										<td id='gold'>0</td>
									</tr>
								</tbody>
							</table>
							<div class='row text-nowrap'>
								<div class='col-5'>
									<div class='btn-group'>
										<button class='btn btn-outline-secondary'>삭제</button>
										<button class='btn btn-outline-secondary'>인증</button>
										<button class='btn btn-outline-secondary'>복구</button>
									</div>
								</div>
								<div class='col-2 d-flex justify-content-center'>
									<ul class='pagination'>
										<li class='page-item'> 
											<a class='page-link' href='#' tabindex='-1'>
												<span class='text-dark'>&laquo;</span> 
											</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>1</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>2</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>3</a>
										</li>
										<li class='page-item'> 
											<a class='page-link' href='#'>
												<span class='text-dark'>&raquo;</span> 
											</a>
										</li>
									</ul>
								</div>
								<div class='col-5'>
									<div class='btn-group float-right'>
										<button class='btn btn-secondary' data-toggle='modal' data-target='#usrAddModal'>추가</button>
									</div>
								</div>
							</div>
						</div>
						<div class='tab-pane fade show' id='oUsrBoard'>
							<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
								<thead>
									<tr class='text-nowrap text-center'>
										<th id='checkCol'>
											<input type='checkbox' id='checkall2'>
										</th>
										<th width='8%'>포지션</th>
										<th width='15%'>ID</th>
										<th width='10%'>이름</th>
										<th width='15%'>별명</th>
										<th width='12%'>생년월일</th>
										<th width='8%'>레벨</th>
										<th width='10%'>골드</th>
									</tr>
								</thead>
								<tbody class='small'>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check2' id='usrCode' value='009'>
										</td>
										<td id='usrPosition'>O</td>
										<td id='usrId'>bbb@email.com</td>
										<td id='usrName'>안석필</td>
										<td id='usrNick'>v앙떠기v</td>
										<td id='usrBirthDate'>60-01-01</td>
										<td id='usrLv'>0</td>
										<td id='gold'>0</td>
									</tr>
								</tbody>
							</table>
							<div class='row text-nowrap'>
								<div class='col-5'>
									<div class='btn-group'>
										<button class='btn btn-outline-secondary'>삭제</button>
										<button class='btn btn-outline-secondary'>복구</button>
									</div>
								</div>
								<div class='col-2 d-flex justify-content-center'>
									<ul class='pagination'>
										<li class='page-item'> 
											<a class='page-link' href='#' tabindex='-1'>
												<span class='text-dark'>&laquo;</span> 
											</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>1</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>2</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>3</a>
										</li>
										<li class='page-item'> 
											<a class='page-link' href='#'>
												<span class='text-dark'>&raquo;</span> 
											</a>
										</li>
									</ul>
								</div>
								<div class='col-5'>
									<div class='btn-group float-right'>
										<button class='btn btn-secondary' data-toggle='modal' data-target='#usrAddModal'>추가</button>
									</div>
								</div>
							</div>
						</div>
						<div class='tab-pane fade show' id='nUsrBoard'>
							<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
								<thead>
									<tr class='text-nowrap text-center'>
										<th id='checkCol'>
											<input type='checkbox' id='checkall3'>
										</th>
										<th width='8%'>포지션</th>
										<th width='15%'>ID</th>
										<th width='10%'>이름</th>
										<th width='15%'>별명</th>
										<th width='12%'>생년월일</th>
										<th width='8%'>레벨</th>
										<th width='10%'>골드</th>
									</tr>
								</thead>
								<tbody class='small'>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check3' id='usrCode' value='010'>
										</td>
										<td id='usrPosition'>N</td>
										<td id='usrId'>aaa@email.com</td>
										<td id='usrName'>박희선</td>
										<td id='usrNick'>바키선22</td>
										<td id='usrBirthDate'>99-11-11</td>
										<td id='usrLv'>0</td>
										<td id='gold'>464</td>
									</tr>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check3' id='usrCode' value='006'>
										</td>
										<td id='usrPosition'>N</td>
										<td id='usrId'>eee@email.com</td>
										<td id='usrName'>홍순자</td>
										<td id='usrNick'>순자는귀여워</td>
										<td id='usrBirthDate'>00-12-04</td>
										<td id='usrLv'>0</td>
										<td id='gold'>165</td>
									</tr>
								</tbody>
							</table>
							<div class='row text-nowrap'>
								<div class='col-5'>
									<div class='btn-group'>
										<button class='btn btn-outline-secondary'>인증</button>
									</div>
								</div>
								<div class='col-2 d-flex justify-content-center'>
									<ul class='pagination'>
										<li class='page-item'> 
											<a class='page-link' href='#' tabindex='-1'>
												<span class='text-dark'>&laquo;</span> 
											</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>1</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>2</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>3</a>
										</li>
										<li class='page-item'> 
											<a class='page-link' href='#'>
												<span class='text-dark'>&raquo;</span> 
											</a>
										</li>
									</ul>
								</div>
								<div class='col-5'>
									<div class='btn-group float-right'>
										<button class='btn btn-secondary' data-toggle='modal' data-target='#usrAddModal'>추가</button>
									</div>
								</div>
							</div>
						</div>
						<div class='tab-pane fade show' id='mUsrBoard'>
							<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
								<thead>
									<tr class='text-nowrap text-center'>
										<th id='checkCol'>
											<input type='checkbox' id='checkall4'>
										</th>
										<th width='8%'>포지션</th>
										<th width='15%'>ID</th>
										<th width='10%'>이름</th>
										<th width='15%'>별명</th>
										<th width='12%'>생년월일</th>
										<th width='8%'>레벨</th>
										<th width='10%'>골드</th>
									</tr>
								</thead>
								<tbody class='small'>
									<tr id='usrDetail'>
										<td id='checkCol'>
											<input type='checkbox' name='check4' id='usrCode' value='010'>
										</td>
										<td id='usrPosition'>GM</td>
										<td id='usrId'>agggg@email.com</td>
										<td id='usrName'>권력자</td>
										<td id='usrNick'>권력22</td>
										<td id='usrBirthDate'>93-11-11</td>
										<td id='usrLv'>99</td>
										<td id='gold'>99999</td>
									</tr>
								</tbody>
							</table>
							<div class='row text-nowrap'>
								<div class='col-5'>
									<div class='btn-group'>
										<button class='btn btn-outline-secondary'>삭제</button>
									</div>
								</div>
								<div class='col-2 d-flex justify-content-center'>
									<ul class='pagination'>
										<li class='page-item'> 
											<a class='page-link' href='#' tabindex='-1'>
												<span class='text-dark'>&laquo;</span> 
											</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>1</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>2</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>3</a>
										</li>
										<li class='page-item'> 
											<a class='page-link' href='#'>
												<span class='text-dark'>&raquo;</span> 
											</a>
										</li>
									</ul>
								</div>
								<div class='col-5'>
									<div class='btn-group float-right'>
										<button class='btn btn-secondary' data-toggle='modal' data-target='#usrAddModal'>추가</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->


<div id='usrAddModal' class='modal fade modal-fullsize modal-center' tabindex='-1'>
	<div class='modal-dialog modal-fullsize'>
		<div class='modal-content modal-fullsize'>
			<div class='modal-header'>
				<h6>회원 추가</h6>
				<button type='button' class='close' data-dismiss='modal'>
					<small>×</small>
				</button>
			</div>
			<div class='modal-body'>
				<form>
					<div class='row small justify-content-end mr-1 mb-2'>
						<select class="form-select" aria-label="usrSrchOpt" id='position' required>
						  <option value="GM" selected>GM</option>
						  <option value="NOOB">NOOB</option>
						</select>
					</div>
					<div class='row'>
						<div class='col'>
							<table class='border-0 small text-nowrap w-100'>
								<tr>
									<td width='10%'>
										<label for='usrId'>ID </label>
									</td>
									<td width='25%' id='usrId'>
										<input type='email' class='form-control' id='usrId' required>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='usrPw'>PW </label>
									</td>
									<td width='50%' id='usrPw'>
										<input type='text' class='form-control' id='usrPw' required>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>이메일 - 유일값</small>
									</td>
									<td width='5%'></td>
									<td width='65%' colspan='2' class='text-right'>
										<small>6~10자, 영문 + 특수문자 + 숫자 혼합</small>
									</td>
								</tr>
								<tr>
									<td width='10%'>
										<label for='usrName'>이름 </label>
									</td>
									<td width='25%' id='usrName'>
										<input type='text' class='form-control' id='usrName' required>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='nickname'>별명 </label>
									</td>
									<td width='50%' id='nickname'>
										<input type='text' class='form-control' id='nickname' required>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>2자 이상의 한글</small>
									</td>
									<td width='5%'></td>
									<td width='65%' colspan='2' class='text-right'>
										<small>2~6자, 한글 + 영문 + 숫자 가능 - 유일값</small>
									</td>
								</tr>
								<tr>
									<td width='10%'>
										<label for='birthday'>생일 </label>
									</td>
									<td width='25%' id='birthday'>
										<input type='date' class='form-control' id='birthday' required>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='phoneNum'>전화 </label>
									</td>
									<td width='50%' id='phoneNum'>
										<input type='tel' class='form-control' id='phoneNum' required>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>가입일 이전의 날짜</small>
									</td>
									<td width='5%'></td>
									<td width='65%' colspan='2' class='text-right'>
										<small>10~11자 - 숫자</small>
									</td>
								</tr>
								<tr>
									<td colspan='5'>
										<label for='usrClss'>클래스명 </label>
									</td>
								</tr>
								<tr>
									<td colspan='5'>
										<div class='form-control' id='usrClsList'>
											<button type='button' class='btn btn-secondary' id='addClsBtn'>
												<i class="fas fa-plus"></i>
											</button>
											<button type='button' class='btn btn-outline-secondary' id='rmvClsBtn'>
												<i class="fas fa-minus"></i>
											</button>
										</div>
									</td>
								</tr>
							</table>
							<hr>
							<table class='border-0 small text-nowrap w-100'>
								<tr>
									<td width='10%'>
										<label for='usrLv'>레벨 </label>
									</td>
									<td width='30%' id='usrLv'>
										<input type='text' class='form-control' value='0' id='usrLv' readonly>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='usrExp'>&nbsp;&nbsp;경험치</label>
									</td>
									<td width='30%' id='usrExp'>
										<input type='text' class='form-control' value='0%' id='usrExp' readonly>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<hr>
					<div class='row justify-content-end mt-1 mr-1' id='addUsrBtn'>
						<button type='button' class='btn btn-outline-secondary' id='addUsrBtn'>추가</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div id='getUsrModal' class='modal fade modal-fullsize modal-center' tabindex='-1'>
	<div class='modal-dialog modal-fullsize'>
		<div class='modal-content modal-fullsize'>
			<div class='modal-header'>
				<h6>회원 조회 및 수정</h6>
				<div class='justify-content-end'>
					<small id='usrCode' class='mr-2'>038</small>
					<small id='position' class='mr-2'>PLAYER</small>
					<small id='regDate' class='mr-2'>2019-12-14 가입</small>
				</div>
			</div>
			<div class='modal-body'>
				<form>
					<div class='row'>
						<div class='col'>
							<table class='border-0 small text-nowrap w-100'>
								<tr>
									<td width='10%'>
										<label for='usrId'>ID </label>
									</td>
									<td width='25%' id='usrId'>
										<input type='email' class='form-control' value='iii@email.com' id='usrId' required disabled>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='usrPw'>PW </label>
									</td>
									<td width='50%' id='usrPw'>
										<input type='text' class='form-control' value='qQqQ1!1!' id='usrPw' required disabled>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>이메일 - 유일값</small>
									</td>
									<td width='5%'></td>
									<td width='50%' colspan='2' class='text-right'>
										<small>6~10자, 영문 + 특수문자 + 숫자 혼합</small>
									</td>
								</tr>
								<tr>
									<td width='10%'>
										<label for='usrName'>이름 </label>
									</td>
									<td width='25%' id='usrName'>
										<input type='text' class='form-control' value='김갑수' id='usrName' required disabled>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='nickname'>별명 </label>
									</td>
									<td width='50%' id='nickname'>
										<input type='text' class='form-control' value='김갑수' id='nickname' required disabled>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>2자 이상의 한글</small>
									</td>
									<td width='5%'></td>
									<td width='50%' colspan='2' class='text-right'>
										<small>2~6자, 한글 + 영문 + 숫자 가능 - 유일값</small>
									</td>
								</tr>
								<tr>
									<td width='10%'>
										<label for='birthday'>생일 </label>
									</td>
									<td width='25%' id='birthday'>
										<input type='date' class='form-control' value='1998-04-15' id='birthday' required disabled>
									</td>
									<td width='5%'></td>
									<td width='10%'>
										<label for='phoneNum'>전화 </label>
									</td>
									<td width='50%' id='phoneNum'>
										<input type='tel' class='form-control' value='01111111112' id='phoneNum' required disabled>
									</td>
								</tr>
								<tr>
									<td width='35%' colspan='2' class='text-right'>
										<small>가입일 이전의 날짜</small>
									</td>
									<td width='5%'></td>
									<td width='50%' colspan='2' class='text-right'>
										<small>10~11자 - 숫자</small>
									</td>
								</tr>
								<tr>
									<td colspan='5'>
										<label for='usrClss'>클래스명 </label>
									</td>
								</tr>
								<tr>
									<td colspan='5'>
										<div class='form-control' id='usrClsList'>
											<label for='JSTL'>
												<input type='checkbox' name='usrClsName' value='JSTL' id='usrClsName' hidden='true'>
												JSTL
												<input type='text' value='JSTL' hidden='true' readonly>
											</label>
											<label for='TOEFL'>
												<input type='checkbox' name='usrClsName' value='TOEFL' id='usrClsName' hidden='true'>
												TOEFL
												<input type='text' value='TOEFL' hidden='true' readonly>
											</label>
											<label for='TOEIC'>
												<input type='checkbox' name='usrClsName' value='TOEIC' id='usrClsName' hidden='true'>
												TOEIC
												<input type='text' value='TOEIC' hidden='true' readonly>
											</label>
											<label for='Java'>
												<input type='checkbox' name='usrClsName' value='Java' id='usrClsName' hidden='true'>
												Java
												<input type='text' value='Java' hidden='true' readonly>
											</label>
											<label for='Kotlin'>
												<input type='checkbox' name='usrClsName' value='Kotlin' id='usrClsName' hidden='true'>
												Kotlin
												<input type='text' value='Kotlin' hidden='true' readonly>
											</label>
											<br>
											<label for='C++'>
												<input type='checkbox' name='usrClsName' value='C++' id='usrClsName' hidden='true'>
												C++
												<input type='text' value='C++' hidden='true' readonly>
											</label>
											<label for='달리기'>
												<input type='checkbox' name='usrClsName' value='달리기' id='usrClsName' hidden='true'>
												달리기
												<input type='text' value='달리기' hidden='true' readonly>
											</label>
											<label for='수영'>
												<input type='checkbox' name='usrClsName' value='수영' id='usrClsName' hidden='true'>
												수영
												<input type='text' value='수영' hidden='true' readonly>
											</label>
											<label for='웨이트'>
												<input type='checkbox' name='usrClsName' value='웨이트' id='usrClsName' hidden='true'>
												웨이트
												<input type='text' value='웨이트' hidden='true' readonly>
											</label>
											<button class='btn btn-secondary' id='addClsBtn' disabled>
												<i class="fas fa-plus"></i>
											</button>
											<button class='btn btn-outline-secondary' id='rmvClsBtn' disabled>
												<i class="fas fa-minus"></i>
											</button>
										</div>
									</td>
								</tr>
							</table>
							<hr>
							<table class='border-0 small text-nowrap w-100'>
								<tr>
									<td width='10%'>
										<label for='usrLv'>레벨 </label>
									</td>
									<td width='30%' id='usrLv'>
										<input type='text' class='form-control' value='4' id='usrLv' readonly>
									</td>
									<td width='10%'></td>
									<td width='10%'>
										<label for='usrExp'>&nbsp;&nbsp;경험치</label>
									</td>
									<td width='30%' id='usrExp'>
										<input type='text' class='form-control' value='60%' id='usrExp' readonly>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<hr>
					<div class='row justify-content-end mt-1 mr-1' id='getUsrModalBtn'>
						<button type='button' class='btn btn-outline-secondary' id='fixUsrInBtn' onclick='getUser()'>수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>