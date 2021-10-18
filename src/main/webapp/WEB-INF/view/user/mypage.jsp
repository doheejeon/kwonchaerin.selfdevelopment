<title>갓겜:마이페이지</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
.header {
	background: #0367A6;
	color: #F2F2F2;
}

/* imgBtn */
.imgBtn {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  cursor: pointer;
}

@media (prefers-reduced-motion: reduce) {
  .imgBtn {
    transition: none;
  }
}

.imgBtn:focus, .btn.focus {
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

/* 헤더 */
.clsIcon {
	width: 25%;
}

#usrClsIcon {
	width: 6.5rem;
	height: 6.5rem;
}

.usrInfo {
	width: 75%;
}

#usrQstIcon,
#usrCpnIcon,
#usrCmmIcon {
	width: 4.2rem;
	height: 4.2rem;
	margin-right: 0.2rem;
}

#usrQst th,
#usrCpn th,
#usrCmm th {
	width: 5rem;
}

ul {
    list-style: none;
}

#clsName {
	float: left;
	margin-left: 0;
    margin-right: 0.3rem;
}

/* 퀘스트 앨범 */
#usrQstImg {
	position: relative;
	width: 10rem;
	height: 10rem;
	border: 1px solid #0367A6;
}

#usrQstImg #usrQstImgDate {
	position: absolute;
	right: 0.8rem;
	bottom: 0.3rem;
}

img[name='usrQstImg'] {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	width: 10rem;
	height: 10rem;
	object-fit: cover;
	border: 0px;
}

/* 마이 리워드 */
#usrCpnImg {
	position: relative;
	width: 13.33333rem;
	height: 10rem;
	border: 1px solid #0367A6;
}

#usrCpnImg #cpnIsUsed {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	width: 13.33333rem;
	height: 10rem;
	background-color: rgba(132, 177, 217, 0.2);
	text-align: center;
	font-weight: 700;
	font-size: 1.55rem;
}

img[name='usrCpnImg'] {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	width: 13.33333rem;
	height: 10rem;
	object-fit: cover;
	border: 0px;
}

#usrCpnImg #usrCpnDetail {
	position: absolute;
	right: 0.8rem;
	bottom: 0.3rem;
}

/* 모달 */
.modal-body #qstImgDetail {
	width: 28rem;
	height: 28rem;
	object-fit: cover;
}

.modal-body #cpnImgDetail {
	width: 28rem;
	height: 21rem;
	object-fit: cover;
}

/* 게시물  댓글  버튼 */
#fixBtn {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	border-bottom: 0;
}

#delBtn {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom: 0;
}
</style>

<script>
function isNoob() {
	if(sessionStorage.getItem('position') == 'noob') {
		$('#usrQstImgList').remove();
		$('#usrCpnImgList').remove();
		$('#myPstList').remove();
		$('#myCmtList').remove();
		$('#authPlease').attr('class', 'border d-flex justify-content-between py-3');
		$('#authPlease').html(
			'<div class="col-6">' +
				'<h5 class="titleColor ml-3">메일로 인증 번호를 발송했습니다. 확인해주세요.</h5>' +
				'<h6 class="text-muted small ml-3">메일 인증 작업을 완료하지 않을 시 사이트 내 활동이 불가합니다.</h6>' +
			'</div>' +
			'<div class="col-5">' +
				'<a class="btn btn-secondary float-right mt-2" href="12.html">번호 입력하기 <i class="fas fa-external-link-alt"></i></a>' +
				'<button class="btn btn-outline-secondary float-right mt-2" onclick="sendMail()">다시 보내기</button>' +
			'</div>' +
			'<div class="col-1 mt-2">' +
				'<h5 class="titleColor"><button class="btn" onclick="closeNoob()">ｘ</button></h5>' +
			'</div>'
		);
	}
}

function closeNoob() {
	$('#authPlease').empty();
}

$(isNoob);

$(document).ready(function() {
	$('#usrQstImg .btn').click(function() {
		parent = $(this).parent('#usrQstImg');
		qstDate = parent.children('#usrQstImgDate').text();
		qstImgSrc = parent.children('img').attr('src');
		
		$('.modal-header #usrQstDate').text(qstDate); //이 이미지의 형제 중 #usrQstImgDate의 text 값을 가져와서 #usrQstDate에 넣기
		$('.modal-body #qstImgDetail').attr('src', qstImgSrc); //이 이미지의 src 값을 가져와서 modal-body #qstImgDetail의 src에 넣기
		
		$('#qstImgDetailModal').modal('show');
	})
	
	$('#usrCpnImg .btn').click(function() {
		parent = $(this).parent('#usrCpnImg');
		usable = parent.children('#cpnIsUsed');
		
		if(usable.prop('hidden') != false) {
			cpnImgSrc = parent.children('img').attr('src');
			cpnDetail = parent.children('#usrCpnDetail').text();
			cpnStore = cpnDetail.split(' ')[0];
			cpnDcPer = cpnDetail.split(' ')[1];
			
			$('.modal-body #cpnImgDetail').attr('src', cpnImgSrc);
			$('.modal-body #cpnImgDetail').attr('alt', cpnStore + ' 이미지');
			$('.modal-body #cpnStore').text(cpnStore);
			$('.modal-body #cpnDcPer').text(cpnDcPer);
			
			$('#cpnDetailModal').modal('show');
			/*
			$('#useCpnBtn').click(function() {
				usable.prop('hidden', false);
				usable.html('<br><br>사용 완료');
			})
			*/
		}
	})
})
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='header pb-4'>
		<div class='container'>
			<div class='row justify-content-center'>
				<div class='col'>
					<h5 class='mt-4 font-weight-bolder text-light'>My Page</h5>
				</div>
				<div class='col align-self-end'>
					<small class='float-right'>
						<a href='/kwonchaerin.selfdevelopment/user/quit/step1' class='text-light'>회원탈퇴</a> &nbsp;|&nbsp;
						<a href='/kwonchaerin.selfdevelopment/user/modify/step1' class='text-light font-weight-bold'>회원정보수정</a>
					</small>
				</div>
			</div>
			<div class='row mt-3 justify-content-around'>
				<div class='w-10 align-self-center'>
					<img src='#' alt='대표 클래스 아이콘' id='usrClsIcon'>
				</div>
				<div class='w-70'>
					<div class='row'>
						<div class='col mb-2'>
							<span class='h4 font-weight-bold text-nowrap float-left mr-5' id='usrNick'>김회원1v</span>
							<span class='small text-light text-nowrap float-left mt-2' id='clsName'>
								 &nbsp;TOEFL &nbsp; Java &nbsp; TOEIC &nbsp; 달리기 &nbsp; 등산
							</span>
						</div>
						<div class='col d-flex justify-content-end align-self-end'>
							<table id='usrQst' class='h-25 mr-3 text-primary'>
								<tr>
									<td rowspan='2'>
										<img src='#' alt='퀘스트 아이콘' id='usrQstIcon' class='imgBtn text-primary' onclick='location.href="/kwonchaerin.selfdevelopment/user/mypage#questAlbum"'>
									</td>
									<th class='text-left text-nowrap small font-weight-bold mr-1 text-primary' title='현재 진행 중인 퀘스트 수'>
										수행 중
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light' id='usrAcceptedQstCnt' title='현재 진행 중인 퀘스트 수'>
										2
									</td>
								</tr>
								<tr>
									<th class='text-left text-nowrap small font-weight-bold mr-1 text-primary' title='수행 완료한 퀘스트 수'>
										수행 완료
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light' id='userDoneQstCnt' title='수행 완료한 퀘스트 수'>
										10
									</td>
								</tr>
							</table>
							<table id='usrCpn' class='h-25 mr-3 text-primary'>
								<tr>
									<td rowspan='2'>
										<img src='#' alt='쿠폰 아이콘' id='usrCpnIcon' class='imgBtn' onclick='location.href="/kwonchaerin.selfdevelopment/user/mypage#myCoupon"'>
									</td>
									<th class='text-left text-nowrap small font-weight-bold mr-1' title='사용 가능한 쿠폰 수'>
										쿠폰
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light' id='usrGold' title='사용 가능한 쿠폰 수'>
										5
									</td>
								</tr>
								<tr>
									<th class='text-left text-nowrap small font-weight-bold mr-1' title='보유 골드'>
										GOLD
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light' id='usrCpnPrcCnt2' title='보유 골드'>
										5
									</td>
								</tr>
							</table>
							<table id='usrPst' class='h-25 mr-4 text-primary'>
								<tr id='usrCmm'>
									<td rowspan='2'>
										<img src='#' alt='게시물 아이콘' id='usrCmmIcon' class='imgBtn' onclick='location.href="/kwonchaerin.selfdevelopment/user/mypage#myPosts"'>
									</td>
									<th class='text-left text-nowrap small font-weight-bold'>
										작성글
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light'>
										31
									</td>
								</tr>
								<tr id='userDoneQst'>
									<th class='text-left text-nowrap small font-weight-bold'>
										추천글
									</th>
									<td>&nbsp;</td>
									<td class='text-right small text-light'>
										1
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class='row mt-1 justify-content-end'>
						<div class='col col-c p-0 mt-2'>
							<h6 class='text-center'>
								<span class='badge bg-light text-primary ml-2 mr-0'>LV</span>
								<span class='text-left font-weight-bold' id='usrLv'>8</span>
							</h6>
						</div>
						<div class='col col-d pl-0 m-0'>
							<div class='row ml-3'>
								<h6 class='text-left small mb-0'>EXP</h6>
							</div>
							<div class='row mr-4 ml-3'>
								<progress id='expPoint' title='73%' value='73' max='100'></progress>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='container usrDetail'>
		<div class='row' id='authPlease'></div>
		<div class='row mt-5'><a id='questAlbum'></a>
			<div class='col mt-5 ml-5'>
				<h5 class='font-weight-bolder titleColor'>QUEST ALBUM</h5>
			</div>
		</div>
		<div class='row mt-4 mb-5'>
			<div class='col w-100'>
				<div id='usrQstImgList' class='carousel slide pb-5' data-ride='carousel' data-interval='false'>
					<div class='carousel-inner'>
						<a href='#usrQstImgList' data-slide='prev' class='carousel-control-prev'>
							<i class="fas fa-chevron-circle-left"></i>
						</a>
						<div class='carousel-item active'>
							<div class='d-flex justify-content-center'>
								<table id='myQstImg'>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-11</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-10</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-09</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-08</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class='carousel-item'>
							<div class='d-flex justify-content-center'>
								<table id='myQstImg'>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-07</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-06</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-05</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-04</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class='carousel-item'>
							<div class='d-flex justify-content-center'>
								<table id='myQstImg'>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-25</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-23</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-18</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-14</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<a href='#usrQstImgList' data-slide='next' class='carousel-control-next'>
							<i class="fas fa-chevron-circle-right"></i>
						</a>
					</div>
					<ul class='carousel-indicators'>
						<li data-target='#usrQstImgList' data-slide-to='0' class='active'></li> <!--0번부터시작--> 
						<li data-target='#usrQstImgList' data-slide-to='1'></li>
						<li data-target='#usrQstImgList' data-slide-to='2'></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<div class='row mt-5'>
			<a id='myCoupon'></a>
			<div class='col mt-5 ml-5'>
				<h5 class='font-weight-bolder titleColor'>MY COUPON</h5>
			</div>
			<div class='col mt-5 mr-5'>
				<div class='float-right text-secondary small btn' onclick='location.href="/kwonchaerin.selfdevelopment/quest/board"' title='골드 벌러 가기 ☞'>
					<i class="fas fa-coins"></i>&nbsp;&nbsp;
					<span id='usrGold' class='h6'>5</span>
				</div>
			</div>
		</div>
		<div class='row mb-5 mt-4'>
			<div class='col w-100'>
				<div id='usrCpnImgList' class='carousel slide pb-5' data-ride='carousel' data-interval='false'>
					<div class='carousel-inner'>
						<a href='#usrCpnImgList' data-slide='prev' class='carousel-control-prev'>
							<i class="fas fa-chevron-circle-left"></i>
						</a>
						<div class='carousel-item active'>
							<div class='d-flex justify-content-center'>
								<table id='usrCpnList'>
									<tr>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>서점 10%</span>
											<div id='cpnIsUsed' hidden='true'></div>
											<input type='text' id='cpnCode' value='9' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>스포츠샵 20%</span>
											<div id='cpnIsUsed' hidden='true'></div>
											<input type='text' id='cpnCode' value='8' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>인터넷강의 10%</span>
											<div id='cpnIsUsed' hidden='true'></div>
											<input type='text' id='cpnCode' value='7' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class='carousel-item'>
							<div class='d-flex justify-content-center'>
								<table id='usrCpnList'>
									<tr>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>스포츠샵 10%</span>
											<div id='cpnIsUsed' hidden='true'></div>
											<input type='text' id='cpnCode' value='1' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>인터넷강의 30%</span>
											<div id='cpnIsUsed' hidden='true'></div>
											<input type='text' id='cpnCode' value='2' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>서점 10%</span>
											<div id='cpnIsUsed' class='text-primary'>
												<br><br>사용 완료
											</div>
											<input type='text' id='cpnCode' value='3' hidden='true' readonly>
											<img src='#' class='btn disabled' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class='carousel-item'>
							<div class='d-flex justify-content-center'>
								<table id='usrCpnList'>
									<tr>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>인터넷강의 20%</span>
											<div id='cpnIsUsed' class='text-primary'>
												<br><br>사용 완료
											</div>
											<input type='text' id='cpnCode' value='4' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>인터넷강의 10%</span>
											<div id='cpnIsUsed' class='text-primary'>
												<br><br>사용 완료
											</div>
											<input type='text' id='cpnCode' value='5' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
										<td id='usrCpnImg'>
											<span id='usrCpnDetail'>서점 20%</span>
											<div id='cpnIsUsed' class='text-primary'>
												<br><br>사용 완료
											</div>
											<input type='text' id='cpnCode' value='6' hidden='true' readonly>
											<img src='#' class='btn' alt='쿠폰 사용처 이미지' name='usrCpnImg'>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<a href='#usrCpnImgList' data-slide='next' class='carousel-control-next'>
							<i class="fas fa-chevron-circle-right"></i>
						</a>
					</div>
					<ul class='carousel-indicators'>
						<li data-target='#usrCpnImgList' data-slide-to='0' class='active'></li> <!--0번부터시작--> 
						<li data-target='#usrCpnImgList' data-slide-to='1'></li>
						<li data-target='#usrCpnImgList' data-slide-to='2'></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<div class='row mt-4 mx-5 justify-content-between'>
			<div class='col mr-5'><a id='myPosts'></a>
				<form id='myPst'>
					<div class='row mt-5'>
						<div class='col-8 m-0 p-0 d-flex justify-content-start'>
							<h5 class='font-weight-bolder titleColor'>MY POSTS</h5>
						</div>
						<div class='col-4 m-0 p-0 d-flex justify-content-end'>
							<button type='button' class='btn btn-outline-secondary' onclick='isChecked("내가 쓴 게시글", "수정", "myPstChoice")' id='fixBtn'>
								<i class="fas fa-edit"></i>
							</button>
							<button type='button' class='btn btn-secondary' onclick='isChecked("내가 쓴 게시글", "삭제", "myPstChoice")' id='delBtn'>
								<i class="fas fa-trash-alt"></i>
							</button>
						</div>
					</div>
					<div class='row'>
						<table class='table table-secondary table-hover col' id='myPstList'>
							<thead class='thead-secondary'>
								<tr>
									<th id='checkCol'> 
										<input class='mb-1' type='checkbox' id='checkall1'>
									</th>
									<th colspan='3'>제목</th>
									<th colspan='2'>작성일시</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check1' id='myPstChoice'>
									</td>
									<td colspan='3'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											<span id='myPstHead' class='mr-2'>[팁과노하우]</span>
											<span id='myPstTitle'>살 잘 찌는 법</span>
										</a>
									</td>
									<td colspan='2' id='myPstDate'>
										21-10-01
									</td>
								</tr>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check1' id='myPstChoice'>
									</td>
									<td colspan='3'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											<span id='myPstHead' class='mr-2'>[친구구인]</span>
											<span id='myPstTitle'>같이 뛰실 분</span>
										</a>
									</td>
									<td colspan='2' id='myPstDate'>
										21-09-10
									</td>
								</tr>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check1' id='myPstChoice'>
									</td>
									<td colspan='3'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											<span id='myPstHead' class='mr-2'>[질문]</span>
											<span id='myPstTitle'>여기 왜 다 이래요?</span>
										</a>
									</td>
									<td colspan='2' id='myPstDate'>
										21-09-08
									</td>
								</tr>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check1' id='myPstChoice'>
									</td>
									<td colspan='3'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											<span id='myPstHead' class='mr-2'>[멘토구인]</span>
											<span id='myPstTitle'>업어주고 끌어줄 횽님 구함</span>
										</a>
									</td>
									<td colspan='2' id='myPstDate'>
										21-09-02
									</td>
								</tr>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check1' id='myPstChoice'>
									</td>
									<td colspan='3'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											<span id='myPstHead' class='mr-2'>[잡담]</span>
											<span id='myPstTitle'>ㅋㅋㅋㅋㅋ</span>
										</a>
									</td>
									<td colspan='2' id='myPstDate'>
										21-09-01
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class='row justify-content-center'>
						<ul class='pagination'>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>
									<span>&laquo;</span>
								</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>1</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>2</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>3</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>
									<span>&raquo;</span>
								</a>
							</li>
						</ul>
					</div>
				</form>
			</div>
			<div class='col'>
				<form id='myCmt'>
					<div class='row mt-5'>
						<div class='col-8 m-0 p-0 d-flex justify-content-start'>
							<h5 class='font-weight-bolder titleColor'>MY COMMENTS</h5>
						</div>
						<div class='col-4 m-0 p-0 d-flex justify-content-end'>
							<button type='button' class='btn btn-outline-secondary' onclick='isChecked("내가 쓴 댓글", "수정", "myCmtChoice")' id='fixBtn'>
								<i class="fas fa-edit"></i>
							</button>
							<button type='button' class='btn btn-secondary' onclick='isChecked("내가 쓴 댓글", "삭제", "myCmtChoice")' id='delBtn'>
								<i class="fas fa-trash-alt"></i>
							</button>
						</div>
					</div>
					<div class='row'>
						<table class='table table-secondary table-hover col' id='myCmtList'>
							<thead class='thead-secondary'>
								<tr>
									<th id='checkCol'>
										<input class='mb-1' type='checkbox' id='checkall2'>
									</th>
									<th colspan='3'>내용</th>
									<th colspan='2'>작성일시</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td> 
										<input class='mt-1' type='checkbox' name='check2' id='myCmtChoice'>
									</td>
									
									<td colspan='3' id='myCmtContent'>
										<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' class='text-dark'>
											그거 그렇게 하는 거 아닌뎈ㅋ
										</a>
									</td>
									<td colspan='2' id='myCmtDate'>
										21-04-01
									</td>	
								</tr>
								<tr>
									<td>
										<input class='mt-1' type='checkbox' name='check2' id='myCmtChoice' hidden='true'>
									</td>
									<td colspan='3' id='myCmtContent'>
									</td>
									<td colspan='2' id='myCmtDate'>&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input class='mt-1' type='checkbox' name='check2' id='myCmtChoice' hidden='true'>
									</td>
									<td colspan='3' id='myCmtContent'>
									</td>
									<td colspan='2' id='myCmtDate'>&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input class='mt-1' type='checkbox' name='check2' id='myCmtChoice' hidden='true'>
									</td>
									<td colspan='3' id='myCmtContent'>
									</td>
									<td colspan='2' id='myCmtDate'>&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input class='mt-1' type='checkbox' name='check2' id='myCmtChoice' hidden='true'>
									</td>
									<td colspan='3' id='myCmtContent'>
									</td>
									<td colspan='2' id='myCmtDate'>&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class='row justify-content-center'>
						<ul class='pagination'>
							<li class='page-item'>
								<a class='page-link border-0 text-light'>
									<span>&laquo;</span>
								</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-secondary' href='#'>1</a>
							</li>
							<li class='page-item'>
								<a class='page-link border-0 text-light'>
									<span>&raquo;</span>
								</a>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

<!-- 모달 -->
<div id='qstImgDetailModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
					<span class='mt-2' id='usrQstDate'></span>
					<button class='m-0 p-0 btn close float-right' data-dismiss='modal'>×</button>
			</div>
			<div class='modal-body'>
				<div class='row'>
					<div class='col d-flex justify-content-center'>
						<img src='' alt='퀘스트 제출 이미지' id='qstImgDetail'>
					</div>
				</div>
				<div class='row justify-content-center'>
					<small class='text-muted mt-3'>
						이미지 저장을 원하시면 우클릭 후 "이미지를 다른 이름으로 저장"을 눌러주세요.
					</small>
				</div>
			</div>
			<div class='modal-footer'>
				<div class='row w-100 justify-content-center'>
					<button class='btn btn-secondary w-25'
						data-dismiss='modal' data-toggle='modal' data-target='#qstImgDetailModal'> 닫 기 </button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id='cpnDetailModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<span class='mt-2'>쿠폰 사용</span>
				<button class='m-0 p-0 btn close float-right' data-dismiss='modal'>×</button>
			</div>
			<div class='modal-body'>
				<div class='row justify-content-center'>
					<img src='' alt='' id='cpnImgDetail'>
				</div>
				<div class='row mt-3'>
					<div class='ml-3 col-6 align-self-center'>
						<span class='h5 font-weight-bold text-secondary ml-3 float-left'>
							사용처 &nbsp;
							<span class='text-dark font-weight-light' id='cpnStore'></span>
						</span>
					</div>
					<div class='col-5 align-self-center'>
						<span class='h5 font-weight-bold text-secondary ml-2 float-left'>
							할인율 &nbsp;
							<span class='text-dark font-weight-light' id='cpnDcPer'></span>
						</span>
					</div>
				</div>
				<div class='row mt-3'>
					<div class='ml-3 col align-self-center'>
						<span class='h5 font-weight-bold text-secondary ml-3 float-left'>
							코드 &nbsp;
							<span class='text-dark border py-1 px-2 font-weight-bold ml-3' id='cpnCode'>001</span>
						</span>
					</div>
				</div>
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-outline-secondary w-25' data-dismiss='modal' data-toggle='modal' data-target='#cpnDetailModal'> 닫&nbsp;&nbsp;기 </button>
				<button class='btn btn-secondary w-25' data-dismiss='modal' onclick='modal("쿠폰", "사용", "성공")'>사용하기</button>
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