<title>갓겜:퀘스트 관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#classTitle{
	margin-top:2em;
}

#qstQty {
	font-size:10;
}

#imgViewer, #userImgViewer {
	border-color:#E0E0E0;
	background-color: #e9e9e9;
	width:25em;
	height: 20em;
}

#allQstList table thead {
	border-top: 0.1rem solid;
	border-color: secondary;
}

#completedList table thead {
	border-top: 0.1rem solid;
	border-color: secondary;
}

#modalTable {
	text-align:center;
	margin-top:1em;
}

#modalTable th{
	margin-top:1em;
}

#previewImg {
	background-color: #e9e9e9;
	margin: 1em;
	width: 20em;
	height: 15em;
}

#yesBtn {
	width: 5em;
}

#idSrch button,
#qstSch button {
	width: 35%;
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#qstSch input,
#idSrch input {
	width: 65%;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

#paginationDiv button {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
	width: 5rem;
	border-top: 0;
}

#fixQstBtn  {
	border-bottom-right-radius: 0;
}

#addQstBtn  {
	border-bottom-left-radius: 0;
}

#qstImgBtn, #usrQstImgBtn{
	text-decoration: underline;
}

@media (max-width: 768px) {
	#adminGnb {
		height: calc(100% + 30rem);
	}
}

#clsSrchModal {
	z-index: 1051;
}
</style>

<script>
$(document).ready(function() { 
	$('#qstDetail .btn').click(function() {
		parent = $(this).closest('#qstDetail');
		qstId = parent.children('#qstId').text();
		qstName = parent.children('#qstName').text();
		qstImgSrc = parent.children('#qstImg').children('input').val();
				
		$('#qstImgDetailModal #previewImgMsg').text(qstId + ' ' + qstName);
		$('#qstImgDetailModal #qstImgDetail').attr('src', qstImgSrc);
		
		$('#qstImgDetailModal').modal();
	})
	
	$('#usrQstDetail .btn').click(function() {
		parent = $(this).closest('#usrQstDetail');
		usrId = parent.children('#usrId').text();
		qstName = parent.children('#usrqstName').text();
		completeDate = parent.children('#completedDate').text();
		qstImgSrc = parent.children('#usrQstImg').children('#usrQstImgUrl').val();
		
				
		$('#qstImgDetailModal #previewImgMsg').text(usrId + '이 ' + completeDate + '에 깬 ' + qstName);
		$('#qstImgDetailModal #usrQstImgDetail').attr('src', qstImgSrc);
		
		$('#qstImgDetailModal').modal();
	})
})

function showImg(input) {
	if(input.files[0]) {
		let reader = new FileReader();
		reader.readAsDataURL(input.files[0])
		
		reader.addEventListener('load', () => {
			$('#previewImg').attr('src', reader.result)
		}, false)
	}
}

function addQst() {
	if($('#qstChk:checked').length >= 1)
		modal("퀘스트", "추가", "실패");
	else $('#addProcModal').modal();
}

$(() => {
	$('input').change(function() {
		showImg(this)
	})
	
	$('#fileButton').click(() => {
		let data = new FormData($('form')[0])
		
		$.ajax({
			method: 'post',
			data,
			processData: false,
			contentType: false,
			success: result => $('#msg').text('')
		})
	})
})
</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>

	<div id='underHead' class='row w-100'>
	
	<%@ include file='../include/gnb.jsp' %>	
		
		<div class='col' id='adminBody'>
			<div class='row ml-1 mt-3'>
				<div class='col'><!-- 퀘스트 조회 -->
					<div class='row justify-content-between mb-0' id='classTitle'>
						<div>
							<b>퀘스트 조회</b>
							<a href='/kwonchaerin.selfdevelopment/admin/quests' target='_self' class='small text-muted' id='redo'><i class="fas fa-redo"></i></a>
						</div>
						<p class='text-muted text-center mb-0 mr-3' id='qstQty'>총 80건</p>
					</div><hr>
					
					<div class='row mt-1 mb-0 justify-content-between'>
						<div class='col-6 mb-0'>
							<nav class='nav nav-tabs'>
								<a class='nav-link active btn-outline-secondary' data-toggle='tab' href='#allQstList'>전체</a>
								<a class='nav-link btn-outline-secondary' data-toggle='tab' href='#stdQstList'>공부</a>
								<a class='nav-link btn-outline-secondary' data-toggle='tab' href='#exrQstList'>운동</a>
							</nav>
						</div>
						<form class='col-5 mb-0 mr-3 float-right' id='qstSch'>
							<div class='row'>
								<input type='text' class='form-control' placeholder='퀘스트명을 입력하세요.'>
								<button type='button' class='btn btn-secondary'>검색</button>
							</div>
						</form>
					</div>
					
					<div class='row'>
						<div class='col'>
							<div class='tab-content'>
								<div class='tab-pane fade show active' id='allQstList'>
									<table class='table table-sm table-hover table-secondary border text-nowrap mb-0 text-center'>
										<thead>
											<tr>
												<th id='checkCol'>
													<input type='checkbox' id='checkall1'/>
												</th>
												<th>퀘스트ID</th>
												<th>이미지</th>
												<th>퀘스트명</th>
												<th>클래스명</th>
												<th>수행 중</th>
											</tr>
										</thead>
										<tbody>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU001
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													알고리즘껌이즘
												</td>
												<td id='qstClsName'>
													공부/코딩/JAVA
												</td>
												<td id='usrProcessingQty'>
													5
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU002
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													JLPT필수문법
												</td>
												<td id='qstClsName'>
													공부/언어/JLPT
												</td>
												<td id='usrProcessingQty'>
													1
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU001
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													토익고득점
												</td>
												<td id='qstClsName'>
													공부/언어/TOEIC
												</td>
												<td id='usrProcessingQty'>
													2
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU003
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													오늘도 득근
												</td>
												<td id='qstClsName'>
													운동/무산소/웨이트트레이닝
												</td>
												<td id='usrProcessingQty'>
													0
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU001
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													토익고득점
												</td>
												<td id='qstClsName'>
													공부/언어/TOEIC
												</td>
												<td id='usrProcessingQty'>
													2
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU110
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													오늘도득근
												</td>
												<td id='qstClsName'>
													운동/무산소/웨이트트레이닝
												</td>
												<td id='usrProcessingQty'>
													2
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU102
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													런데이8주
												</td>
												<td id='qstClsName'>
													공부/유산소/러닝
												</td>
												<td id='usrProcessingQty'>
													0
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU020
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													매일30페이지
												</td>
												<td id='qstClsName'>
													공부/취미/독서
												</td>
												<td id='usrProcessingQty'>
													2
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU001
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													매일그림
												</td>
												<td id='qstClsName'>
													공부/취미/그림
												</td>
												<td id='usrProcessingQty'>
													3
												</td>
											</tr>
											<tr id='qstDetail'>
												<td id='checkCol'><input type='checkbox' id='qstChk' name='check1'></td>
												<td id='qstId'>
													QU231
												</td>
												<td id='qstImg'>
													<input type='text' value='#' hidden='true' id='qstImgUrl'>
													<button type='button' class='btn btn-sm' id='qstImgBtn'>
														보기
													</button>
												</td>
												<td id='qstName'>
													응애아기프로그래머
												</td>
												<td id='qstClsName'>
													공부/코딩/C++
												</td>
												<td id='usrProcessingQty'>
													2
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class='tab-pane fade' id='stdQstList'>공부퀘스트 리스트</div>
								<div class='tab-pane fade' id='exrQstList'>운동퀘스트 리스트</div>
							</div>
						</div>
					</div>
					
					<div class='row mt-0' id='paginationDiv'>
						<div class='col-4 d-flex justify-content-start h-25'>
							<button type='button' id='delQstBtn' class='btn btn-outline-secondary' 
								onClick='isChecked("선택한 퀘스트", "삭제" ,"qstChk")'>삭제</button>
						</div>	
						<div class='col-4 d-flex justify-content-center text-nowrap'>
							<nav>
								<ul class='pagination border-0 text-dark' id='qstPagination'>
									<li class='page-item'> 
										<a class='page-link' href='#' tabindex='-1'>
											<span class='text-dark'>&laquo;</span> 
										</a>
									</li>
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>1</a></li> 
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>2</a></li>
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>3</a></li>
									<li class='page-item'> 
										<a class='page-link' href='#'>
											<span class='text-dark'>&raquo;</span> 
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class='col-4 d-flex justify-content-end h-25'>
							<button type='button' id='fixQstBtn' class='btn btn-outline-secondary' onClick='isChecked("선택한 퀘스트", "수정", "qstChk")'>수정</button>				
							<button type='button' id='addQstBtn' class='btn btn-secondary' onClick='addQst()'>추가</button>
						</div>
					</div>
				</div>
				<!-- 회원 퀘스트 -->
				<div class='col'> <!-- 회원 퀘스트 -->
					<div class='row justify-content-between mb-0' id='classTitle'>
						<div>
							<b>회원 퀘스트</b>
							<a href='/kwonchaerin.selfdevelopment/admin/quests' target='_self' class='small text-muted' id='redo'><i class="fas fa-redo"></i></a>
						</div>
						<p class='text-muted text-center mr-3 mb-0'id='qstQty'>총 5880건</p>
					</div>
					<hr>
					<div class='row mt-1 mb-0 justify-content-between'>
						<div class='col-6 mb-0'>
							<nav class='nav nav-tabs'>
								<a class='nav-link btn-outline-secondary' data-toggle='tab' href='#progressingList'>수행 중</a>
								<a class='nav-link active btn-outline-secondary' data-toggle='tab' href='#completedList'>수행 완료</a>
							</nav>
						</div>
						<form class='col-5 mb-0 mr-3' id='idSrch'>
							<div class='row'>
								<input type='text' class='form-control' placeholder='회원 ID를 입력하세요.'>
								<button type='button' class='btn btn-secondary'>검색</button>
							</div>
						</form>
					</div>
					
					<div class='row'>
						<div class='col'>
							<div class='tab-content'>
								<div class='tab-pane fade show active' id='completedList'>
									<table class='table table-sm table-hover table-secondary border text-nowrap mb-0 text-center'>
										<thead>
											<tr>
												<th id='checkCol'>
													<input type='checkbox' id='checkall2'/>
												</th>
												<th>회원ID</th>
												<th>퀘스트명</th>
												<th>제출사진</th>
												<th>완료일</th>
											</tr>
										</thead>
										<tbody>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													1010@email.com
												</td>
												<td id='usrQstName'>
													알고리즘껌이즘
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													00bb@mail.com
												</td>
												<td id='usrQstName'>
													왼손은거들뿐
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													user@user.com
												</td>
												<td id='usrQstName'>
													토플고득점
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													godofcoding@code.com
												</td>
												<td id='usrQstName'>
													알고리즘껌이즘
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													help@mail.com
												</td>
												<td id='usrQstName'>
													알고리즘껌이즘
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													basketball@email.com
												</td>
												<td id='usrQstName'>
													왼손은거들뿐
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													picshing@mail.com
												</td>
												<td id='usrQstName'>
													매일그림
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													domi@mail.com
												</td>
												<td id='usrQstName'>
													왼손은거들뿐
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													lovelove@mail.net
												</td>
												<td id='usrQstName'>
													주말등산
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
											<tr id='usrQstDetail'>
												<td id='checkCol'><input type='checkbox' id='idChk' name='check2'></td>	
												<td id='usrId'>
													holdon@user.com
												</td>
												<td id='usrQstName'>
													왼손은거들뿐
												</td>  
												<td id='usrQstImg'>
													<input type='text' value='#' hidden='true' id='usrQstImgUrl'>
													<button type='button' class='btn btn-sm' id='usrQstImgBtn'>
														보기
													</button>
												</td>
												<td id='completedDate'>
													20-01-01
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class='tab-pane fade' id='progressingList'>수행중 리스트 공간입니다.</div>
							</div>
						</div>
					</div>
					<div class='row mt-0' id='paginationDiv'>
						<div class='col-3 d-flex justify-content-start h-25'>
							<button type='button' id='delQstBtn' class='btn btn-outline-secondary' 
								onClick='isChecked("선택한 퀘스트", "삭제" ,"idChk")'>삭제</button>
						</div>
						<div class='col d-flex justify-content-center text-nowrap'>
							<nav>
								<ul class='pagination border-0' id='qstPagination'>
									<li class='page-item'> 
										<a class='page-link' href='#' tabindex='-1'>
											<span class='text-dark'>&laquo;</span> 
										</a>
									</li>
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>1</a></li> 
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>2</a></li>
									<li class='page-item'><a class='page-link border-0 text-dark' href='#'>3</a></li>
									<li class='page-item'> 
										<a class='page-link' href='#'>
											<span class='text-dark'>&raquo;</span> 
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class='col-2'> <!-- 페이지네이션 줄맞춤용도 -->
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<!-- qstImgPreview Modal -->
<div id='qstImgDetailModal' class='modal fade' tabindex='-2' role='dialog'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header modal-header-sm'>
				<span class='mt-2' id='previewImgMsg'></span>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<div class='modal-body'>
				<div class='row justify-content-center'>
					<img id='imgViewer' src='#' alt='퀘스트 이미지'> 
				</div>
			</div>
		</div>
	</div>
</div>
<!-- addProcModal-->
<div id='addProcModal' class='modal fade' tabindex='-2'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 추가</b></h6>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<form class='modal-body'>
				<div class='contatiner ml-3' id='modalTable'>
					<div class='row'>
						<div class='col'>
							<table>
								<tbody>
									<tr>
										<th>퀘스트명</th>
										<td><input type='text' placeholder='2글자 이상의 한글로 입력하세요.' class='text-center form-control float-left ml-3'/></td>
									</tr>
									<tr>
										<th>클래스명</th>
										<td><button type='button' onmouseover='clsSrchBtnClick()' class='btn border btn-block form-control ml-3 float-left' id='qstSrch' >
											검색하기<i class="fas fa-search float-right"></i></button></td>
									</tr>
									<tr>
										<th>난이도</th>
										<td class='float-left'>
											<input type='radio' name='difficulty' class='ml-3' value='1'/>1
											<input type='radio' name='difficulty' class='ml-3' value='2'/>2
											<input type='radio' name='difficulty' class='ml-3' value='3'/>3
											<input type='radio' name='difficulty' class='ml-3' value='4'/>4
											<input type='radio' name='difficulty' class='ml-3' value='5'/>5
										</td>
									</tr>
									<tr>
										<th rowspan='5'>이미지</th>
										<td><span class='mt-1 ml-3 text-muted float-left' id='msg'>100MB 이하의 JPG, PNG파일을 제출해주세요.</span></td>
									</tr>
									<tr>
										<td><input type='file' class='pl-3' name='attachFile' id='fileButton' accept='.jpg, .png'/></td>
									</tr>	
									<tr>
										<td><img id='previewImg' class='w-100'/></td>
									</tr>											
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
			<div class='modal-footer justify-content-center'>
				<button type='button' class='btn btn-outline-secondary' onClick='modal("퀘스트", "추가", "중단")'>취소</button>
				<button type='button' class='btn btn-outline-secondary' onClick='modal("퀘스트", "추가", "성공")'data-dismiss='modal'>추가</button>
			</div>
		</div>
	</div>
</div>

<!-- clsSrchModal -->
<div id='clsSrchModal' class='modal fade' onmousemove='chkClass()' tabindex='-1'>
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
				<input type='text' class='form-control col my-3 ml-3' id='clsSearch'>
				<button class='btn btn-outline-secondary my-3 mr-3 ml-2'>
					검 색
				</button>
			</div>
			<div class='row justify-content-start'>
				<small class='font-wieght-bold text-dark font-italic ml-3'>
					총 4건 검색
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
						<tbody>
							<tr>
								<td>
									<input type='checkbox' value='TOEFL' name='studyClass' id='className'>
								</td>
								<td>
									TOEFL
								</td>
								<td>
									언어
								</td>
							</tr>
							<tr>
								<td>
									<input type='checkbox' value='TOEIC' name='studyClass' id='className'>
								</td>
								<td>
									TOEIC
								</td>
								<td>
									언어
								</td>
							</tr>
							<tr>
								<td>
									<input type='checkbox' value='HSK' name='studyClass' id='className'>
								</td>
								<td>
									HSK
								</td>
								<td>
									언어
								</td>
							</tr>
							<tr>
								<td>
									<input type='checkbox' value='JLPT' name='studyClass' id='className'>
								</td>
								<td>
									JLPT
								</td>
								<td>
									언어
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class='modal-footer'>
			<button class='btn btn-outline-secondary col mr-2' data-dismiss='modal'>취 소</button>
			<button class='btn btn-secondary col ml-0' data-dismiss='modal' onclick='addClass()' id='addClassBtn' disabled>확 인</button>
			</div>
		</div>
	</div>
</div>
		
<!-- fixProcModal -->
<div id='fixProcModal' class='modal fade' tabindex='-2'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 수정</b></h6>
				<p class='float-right text-muted'>퀘스트 ID <b>Q010</b></p>
			</div>
			<form class='modal-body'>
				<div class='contatiner ml-3' id='modalTable'>
					<div class='row'>
						<div class='col'>
							<table>
								<tbody>
									<tr>
										<th>퀘스트명</th>
										<td><input type='text' placeholder='{퀘스트명}' class='text-center form-control float-left ml-3'/></td>
									</tr>
									<tr>
										<th>클래스명</th>
										<td><button type='button' onmouseover='clsSrchBtnClick()' class='btn border btn-block form-control ml-3 float-left' id='qstSrch' data-toggle='modal'>
											{기존 클래스명}<i class="fas fa-search float-right"></i></button></td>
									</tr>
									<tr>
										<th>난이도</th>
										<td class='float-left'>
											<input type='radio' name='difficulty' class='ml-3' value='1'/>1
											<input type='radio' name='difficulty' class='ml-3' value='2'/>2
											<input type='radio' name='difficulty' class='ml-3' value='3'/>3
											<input type='radio' name='difficulty' class='ml-3' value='4'/>4
											<input type='radio' name='difficulty' class='ml-3' value='5'/>5
										</td>
									</tr>
									<tr>
										<th rowspan='5'>이미지</th>
										<td><span class=' ml-3 text-muted float-left' id='msg'>{업로드된 파일이름}</span></td>
									</tr>
									<tr>
										<td><input type='file' class='pl-3' name='attachFile' id='fileButton' accept='.jpg, .png'/></td>
									</tr>	
									<tr>
										<td><img id='previewImg' class='w-100'/></td>
									</tr>											
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
			<div class='modal-footer justify-content-center'>
				<button type='button' class='btn btn-outline-secondary' onClick='modal("퀘스트", "수정", "중단")'>취소</button>
				<button type='button' class='btn btn-outline-secondary' onClick='modal("퀘스트", "수정", "성공")'data-dismiss='modal'>수정</button>
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