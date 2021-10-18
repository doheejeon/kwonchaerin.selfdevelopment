<title>갓겜:회원 조회</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
.header {
	background: #0367A6;
	color: #F2F2F2;
}

.clsIcon {
	width: 25%;
}

#usrClsIcon {
	width: 8rem;
	height: 8rem;
}

.usrInfo {
	width: 75%;
}

#usrQstIcon {
	width: 5rem;
	height: 5rem;
	margin-right: 1.8rem;
}

#usrQst th {
	width: 6rem;
}

ul {
    list-style: none;
}

#clsName {
	float: left;
	margin-left: 0;
    margin-right: 1rem;
}

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

.modal-body #qstImgDetail {
	width: 28rem;
	height: 28rem;
	object-fit: cover;
}

</style>

<script>
$(document).ready(function() {
	$('#usrQstImg .btn').click(function() {
		parent = $(this).parent('#usrQstImg');
		qstDate = parent.children('#usrQstImgDate').text();
		qstImgSrc = parent.children('img').attr('src');
		
		$('.modal-header #usrQstDate').text('');
		$('.modal-body #qstImgDetail').removeAttr('src');
	
		$('.modal-header #usrQstDate').text(qstDate);//이 이미지의 형제 중 #usrQstImgDate의 text 값을 가져와서 #usrQstDate에 넣기
		$('.modal-body #qstImgDetail').attr('src', qstImgSrc); //이 이미지의 src 값을 가져와서 modal-body #qstImgDetail의 src에 넣기
		
		$('#qstImgDetailModal').modal('show');
	})
})
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='header pb-4'>
		<div class='container'>
			<div class='row'>
				<h5 class='mt-4 ml-3'>User Info</h5>
			</div>
			<div class='row mt-3 justify-content-around'>
				<div class='col-3'>
					<img src='#' alt='대표 클래스 아이콘' id='usrClsIcon'>
				</div>
				<div class='col-9'>
					<div class='row'>
						<div class='col'>
							<div class='row'>
								<h3 class='font-weight-bold text-left mt-2' id='usrNick'>vV사랑Vv</h3>
							</div>
							<div class='row'>
								<ul class='pl-0 ml-1'>
									<li id='clsName'>수영</li>
									<li id='clsName'>웨이트</li>
									<li id='clsName'>마라톤</li>
								</ul>
							</div>
						</div>
						<div class='col d-flex justify-content-end'>
							<table id='usrQst' class='mr-3 text-nowrap'>
								<tr id='usrAcceptedQst'>
									<td rowspan='2'>
										<img src='#' alt='퀘스트 아이콘' id='usrQstIcon' class='text-light'>
									</td>
									<th class='text-left text-primary'>
										수행 중
									</th>
									<td class='text-right text-light'>
										9
									</td>
								</tr>
								<tr id='userDoneQst'>
									<th class='text-left text-primary'>
										수행 완료
									</th>
									<td class='text-right text-light'>
										121
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class='row mt-1'>
						<div class='col-a'>
							<h6 class='mt-1'>
								<span class='badge bg-light text-primary ml-2 mr-0'>LV</span>
								<span class='text-left font-weight-bold' id='usrLv'>8</span>
							</h6>
						</div>
						<div class='col-b'>
							<div class='row pl-0'>
								<h6 class='text-left small mb-0'>EXP</h6>
							</div>
							<div class='row pl-0 mr-4'>
								<progress id='expPoint' title='30%' value='30' max='100'></progress>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='container usrDetail'>
		<div class='row mt-5'>
			<div class='col ml-5'>
				<h5 class='ml-5'>QUEST ALBUM</h5>
			</div>
		</div>
		<div class='row mt-4'>
			<div class='col w-100'>
				<div id='usrQstImgList' class='carousel slide pb-5' data-ride='carousel' data-interval='false'>
					<div class='carousel-inner '>
						<a href='#usrQstImgList' data-slide='prev' class='carousel-control-prev'>
							<i class="fas fa-chevron-circle-left"></i>
						</a>
						<div class='carousel-item active'>
							<div class='d-flex justify-content-center'>
								<table>
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
								<table>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-03</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-02</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-08-01</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-29</span>
										</td>
									</tr>
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
						<div class='carousel-item'>
							<div class='d-flex justify-content-center'>
								<table>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-11</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-10</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-09</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-08</span>
										</td>
									</tr>
									<tr>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-07</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-06</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-05</span>
										</td>
										<td id='usrQstImg'>
											<img src='#' class='btn' alt='퀘스트 제출 이미지' name='usrQstImg'>
											<span id='usrQstImgDate'>2021-07-04</span>
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
		<div class='row mt-2 mr-5'>
			<div class='col mr-5'>
				<button type='button' class='btn btn-secondary float-right' data-toggle='modal' data-target='#rptChkModal'>
					신고하기&nbsp;<i class="fas fa-bell"></i>
				</button>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

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
			</div>
		</div>
	</div>
</div>

<div id='rptChkModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>회원 신고</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<table class='border-0 mx-3'>
					<tr>
						<td>신고자</td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<th>김회원1v</th>
					</tr>
					<tr>
						<td colspan='3'><br></td>
					</tr>
					<tr>
						<td>대상</td>
						<td></td>
						<th>vV사랑Vv</th>
					</tr>
				</table>
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-outline-secondary' data-dismiss='modal' data-toggle='modal' data-target='#rptCnclModal'> 취 소 </button>
				<button class='btn btn-secondary' data-dismiss='modal' data-toggle='modal' data-target='#rptSucModal'> 신 고 </button>
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