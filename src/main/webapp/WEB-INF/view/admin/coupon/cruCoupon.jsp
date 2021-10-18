<title>갓겜:쿠폰 관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#title{
	margin-top:3rem;
	font-size:20;
}

.page-link {
	color: black;
}

#bookImg, #onlineImg, #sportsImg {
	width:100%;
	height:5rem;
}

#previewImg {
	background-color: #e9e9e9;
	margin:1rem;
	width:25rem;
	height: 20rem;
}

#idSch button {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#idSch input {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

#idSch2 button[class *= 'outline'] {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#idSch2 input {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

#allCpnBtn, #usedCpnBtn, #nUsedCpnBtn {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

@media (max-width: 768px) {
	#adminGnb {
		height: calc(100% + 75rem);
	}
}
</style>

<script>
function onSchBtn() {
	if($('#schBar').val().length >= 2)
	      $('#schBtn').removeAttr('disabled');
	   else
	      $('#schBtn').attr('disabled', true);
}

function onSchBtn2() {
	if($('#schBar2').val().length >= 2)
	      $('#schBtn2').removeAttr('disabled');
	   else
	      $('#schBtn2').attr('disabled', true);
}
</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>

	<div id='underHead' class='row w-100'>
	
	<%@ include file='../include/gnb.jsp' %>
		
		<div class='col' id='adminBody'>
			<div class='row'>
				<div class='col'>
					<div class='row'>
						<div class='col'>
							<div id='title'>
								<h4>발급 쿠폰 목록</h4><hr>
							</div>
						</div>
					</div>
					<div class='row justify-content-between'>
						<div class='col-6 mb-0'>
							<nav class='nav nav-tabs justify-content-start'>
								<a id='allCpnBtn' class='nav-link btn btn-outline-secondary active' data-toggle='tab' href='#allCpnBoard'>전체</a>
								<a id='nUsedCpnBtn' class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#nUsedCpnBoard'>미사용</a>
								<a id='usedCpnBtn' class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#UsedCpnBoard'>사용완료</a>
							</nav>
						</div>
						<form class='col-6 mb-0' id='idSch'>
							<div class='row float-right mr-0'>
								<input type='text' class='form-control w-75' placeholder='회원의 ID를 입력하세요.' id='schBar' title="2글자 이상 입력하세요." oninput='onSchBtn()'/>
								<button type='button' class='btn btn-outline-secondary' id='schBtn' disabled>검 색</button>
							</div>
						</form>
					</div>
					<div class='row'>
						<div class='col'>
							<div class='tab-content'>
								<div class='tab-pane fade show active' id='allCpnBoard'>
									<table class='table table-sm table-secondary table-hover'>
										<thead>
											<tr>
												<th id='checkCol'><input type='checkbox' id='checkall1'></th>
												<th width='18%'>사용처</th>
												<th>보유자 ID</th>
												<th>쿠폰코드</th>
												<th width='15%'>사용여부</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>서점</td>
												<td>sbc@email.com</td>
												<td>BOOKS-10-12B1Z</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>bcp@email.com</td>
												<td>ONLINE-20-CP06A</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>서점</td>
												<td>wosk12@email.com</td>
												<td>BOOKS-30-KJ835</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ooxj@email.com</td>
												<td>SPORT-10-NN87H</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>wishfka@email.com</td>
												<td>ONLINE-10WE8C4</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>qkqh@email.com</td>
												<td>SPORT-20-9YH10</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>wjdgjs@email.com</td>
												<td>SPORT-10-863LI</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ekfrhd@email.com</td>
												<td>SPORT-30-KLA54</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>wl2018@email.com</td>
												<td>ONLINE-10-BYR5A</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>cmehqi@email.com</td>
												<td>ONLINE-30-C465A</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>서점</td>
												<td>sbc@email.com</td>
												<td>BOOKS-10-12B1Z</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>bcp@email.com</td>
												<td>ONLINE-20-CP06A</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>서점</td>
												<td>wosk12@email.com</td>
												<td>BOOKS-30-KJ835</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ooxj@email.com</td>
												<td>SPORT-10-NN87H</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>wishfka@email.com</td>
												<td>ONLINE-10WE8C4</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>qkqh@email.com</td>
												<td>SPORT-20-9YH10</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>wjdgjs@email.com</td>
												<td>SPORT-10-863LI</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ekfrhd@email.com</td>
												<td>SPORT-30-KLA54</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>wl2018@email.com</td>
												<td>ONLINE-10-BYR5A</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>cmehqi@email.com</td>
												<td>ONLINE-30-C465A</td>
												<td>사용가능</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class='tab-pane fade' id='nUsedCpnBoard'>
									<table class='table table-sm table-secondary table-hover'>
										<thead>
											<tr>
												<th id='checkCol'><input type='checkbox' id='checkall1'></th>
												<th>사용처</th>
												<th>보유자 ID</th>
												<th>쿠폰코드</th>
												<th>사용여부</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>bcp@email.com</td>
												<td>ONLINE-20-CP06A</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ooxj@email.com</td>
												<td>SPORT-10-NN87H</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>wjdgjs@email.com</td>
												<td>SPORT-10-863LI</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>스포츠샵</td>
												<td>ekfrhd@email.com</td>
												<td>SPORT-30-KLA54</td>
												<td>사용가능</td>
											</tr>
											<tr>
												<td id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></td>
												<td>인터넷강의</td>
												<td>cmehqi@email.com</td>
												<td>ONLINE-30-C465A</td>
												<td>사용가능</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class='tab-pane fade' id='UsedCpnBoard'>
									<table class='table table-sm table-secondary table-hover'>
										<thead>
											<tr>
												<th id='checkCol'><input type='checkbox' id='checkall1'></th>
												<th>사용처</th>
												<th>보유자 ID</th>
												<th>쿠폰코드</th>
												<th>사용여부</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></th>
												<td>서점</td>
												<td>sbc@email.com</td>
												<td>BOOKS-10-12B1Z</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<th id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></th>
												<td>서점</td>
												<td>wosk12@email.com</td>
												<td>BOOKS-30-KJ835</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<th id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></th>
												<td>인터넷강의</td>
												<td>wishfka@email.com</td>
												<td>ONLINE-10WE8C4</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<th id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></th>
												<td>스포츠샵</td>
												<td>qkqh@email.com</td>
												<td>SPORT-20-9YH10</td>
												<td>사용완료</td>
											</tr>
											<tr>
												<th id='checkCol'><input type='checkbox' name='check1' id='checkCpn'/></th>
												<td>인터넷강의</td>
												<td>wl2018@email.com</td>
												<td>ONLINE-10-BYR5A</td>
												<td>사용완료</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class='row justify-content-between'>
						<div class='col-4'>
							&nbsp;
						</div>
						<div class='col-4'>
							<ul class='pagination justify-content-center'>
								<li class="page-item"><a class="page-link border-0" href="#">&laquo;</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">1</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">2</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">3</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">4</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">5</a></li>
								<li class="page-item"><a class="page-link border-0" href="#">&raquo;</a></li>
							</ul>
						</div>
						<div class='col-4'>
							<button type="button" class="btn btn-secondary float-right"
								id='useComplete'>
								사용&nbsp;<i class="fas fa-check"></i>
							</button>
						</div>
					</div>
				</div>
				<!-- 쿠폰 설정 및 발급 -->
				<div class='col'>
					<div id='title'>
						<h4>쿠폰 발급</h4><hr>
					</div>
					<div class='row'>
						<div class='col'>
							<table class='table table-secondary table-hover text-center border my-0'>
								<thead>
									<tr>
										<th>사용처</th>
										<th>할인율(%)</th>
										<th>레벨 제한</th>
										<th>필요 골드</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan='3'>서점</td>
										<td>10</td>
										<td>10</td>
										<td>1</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>20</td>
										<td>20</td>
										<td>2</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>30</td>
										<td>30</td>
										<td>3</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
								</tbody>
							</table>
							<table class='table table-secondary table-hover text-center border my-0'>
								<tbody>
									<tr>
										<td rowspan='3'>인터넷<br>강의</td>
										<td>10</td>
										<td>10</td>
										<td>1</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>20</td>
										<td>20</td>
										<td>2</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>30</td>
										<td>30</td>
										<td>3</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
								</tbody>
							</table>
							<table class='table table-secondary table-hover text-center border my-0'>
								<tbody>
									<tr>
										<td rowspan='3'>스포츠샵</td>
										<td>10</td>
										<td>10</td>
										<td>1</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>20</td>
										<td>20</td>
										<td>2</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
									<tr>
										<td>30</td>
										<td>30</td>
										<td>3</td>
										<td><input type='radio' id='fixCpn' name='select'/></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class='row'>
						<div class='col'>
							<p class='mt-3'>상단에서 발급하기 원하는 쿠폰을 선택하고 아래에 발급 대상의 ID를 적어주세요<br>
									검색된 회원 중 원하는 대상을 1명 선택하여 발급 버튼을 누르세요.</p>
						</div>
					</div>
					<div class='row'>
						<div class='col'>
							<form class='row m-1'>
								<div class='col'>
									<div class='row' id='idSch2'>
										<input type='text' class='form-control w-50' placeholder='회원의 ID를 입력하세요.' id='schBar2' title="2글자 이상 입력하세요." oninput='onSchBtn2()'/>
										<button type='button' class='btn btn-outline-secondary' id='schBtn2' disabled>검색</button>
										<button type='button' class='btn btn-secondary ml-3'>쿠폰 발급</button>
									</div>
								</div>
							</form>
							<div class='row'>
								<div class='col'>
									<table class='m-1 table table-sm table-secondary table-hover text-center'>
										<thead>
											<tr>
												<th id='checkCol'></th>
												<td width='50%'>회원 ID</td>
												<td>레벨</td>
												<td>보유 골드</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type='radio' id='checkUser' name='user'/></td>
												<td>aaa@email.com</td>
												<td>1</td>
												<td>0</td>
											</tr>
											<tr>
												<td><input type='radio' id='checkUser' name='user'/></td>
												<td>awekh@email.com</td>
												<td>20</td>
												<td>0</td>
											</tr>
											<tr>
												<td><input type='radio' id='checkUser' name='user'/></td>
												<td>a52153@email.com</td>
												<td>37</td>
												<td>20</td>
											</tr>
											<tr>
												<td><input type='radio' id='checkUser' name='user'/></td>
												<td>284aa@email.com</td>
												<td>12</td>
												<td>4</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class='row mt-0 ml-3 justify-content-center'>
						<ul class='pagination'>
							<li class="page-item"><a class="page-link border-0" href="#">&laquo;</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">1</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">2</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">3</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">4</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">5</a></li>
							<li class="page-item"><a class="page-link border-0" href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<!-- 사용완료처리 모달 -->

<!-- 사용완료처리 성공 모달 -->

<!-- 사용완료처리 실패 모달 -->

<!-- 유저에게 쿠폰 발급하기 모달 -->

<!-- 쿠폰발급 성공 모달 -->

<!-- 쿠폰발급 실패 모달 -->
