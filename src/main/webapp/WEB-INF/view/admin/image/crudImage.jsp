<title>갓겜:이미지 관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#imageList, #addImage{
	margin:1rem;
	width: 100%;
}

#imageTitle{
	font-size:20;
}

#imageButton {
	float:right;
}

#image{
	margin-top: 0.5rem;
	margin-bottom: 0.5rem;
	background-color:#e9e9e9;
	border:0.01rem solid lightgrey;
	height: 4rem;
	width: 6rem;
}

#imageListTable {
	min-width: 25rem;
}

#imageListTable tbody tr{
	cursor: pointer;
}

#addImageButton {
	margin: 0;
}

#previewImg{
	margin: 1.8rem;
	margin-top: 0;
	height: 20rem;
	width: calc(100% - 3.6rem);
}

#fileButton{
	padding-left: 1rem;
	margin-left:2rem;
	margin-top:1rem;
}

#addImage th{
	min-width: 5rem;
	text-align:center;
}

#addImage td{
	min-width: 20rem;
	width: 100%;
}

#addImage input {
	margin: 1rem;
	width: calc(100% - 2rem);
	border: none;
	background: transparent;
}

#addImage input::placeholder{
	color: #D2D2D2;
}

#modalPreviewImg {
	margin: 1rem;
	height: 10rem;
	max-width: 90%;
}

#modalFileButton {
	margin: 1rem;
}

#modalTable {
	width: 100%;
}

#modalTable th {
	padding-left: 0.3rem;
	width: 15%;
	height: 3rem;
}

#modalTable input{
	margin: 1%;
	margin-left: 5%;
	width: 90%;
	border: none;
	background: transparent;
}

@media (max-width: 768px) {
	#adminGnb {
		height: calc(100% + 27rem);
	}
}
</style>

<script>
/*이미지 미리보기*/
function showAddImg(input) {
	if(input.files[0]) {
		let reader = new FileReader();
		reader.readAsDataURL(input.files[0])
		
		reader.addEventListener('load', () => {
			$('#previewImg').attr('src', reader.result)
		}, false)
	}
}

$(() => {
	$('#addImage input').change(function() {
		console.log(this)
		showAddImg(this)
	})
})

/*수정모달 이미지 미리보기*/
function showFixImg(input) {
	if(input.files[0]) {
		let reader = new FileReader();
		reader.readAsDataURL(input.files[0])
		
		reader.addEventListener('load', () => {
			$('#modalPreviewImg').attr('src', reader.result)
		}, false)
	}
}

$(() => {
	$('#fixProcModal input').change(function() {
		console.log(this)
		showFixImg(this)
	})
})


</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>
	
	<div id='underHead' class='row w-100'>
	
	<%@ include file='../include/gnb.jsp' %>	
		
		<div class='col' id='adminBody'>
			<div class='row'>
				<div class='col' id='imageList'>
					<div class='row'>
						<div class='col'>
							<div id='imageTitle'>
								<strong>이미지 목록</strong><hr>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col'>
							<div class='btn-group m-0 mb-1' id='imageButton'>
								<button id='fix' class='btn btn-secondary' onclick='isChecked("이미지", "수정", "imageCheckIn")'>수정</button>
								<button id='del' class='btn btn-secondary' onclick='isChecked("이미지", "삭제", "imageCheckIn")'>삭제</button>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col'>
							<form>
								<table class='table table-sm table-secondary table-hover' id='imageListTable'>
									<thead class='border'>
										<tr>
											<th id='checkCol'><input type='checkbox' id='checkall1'/></th>
											<th width='25%'>이미지</th>
											<th width='25%'>연결 URL</th>
											<th width='35%'>사용 중인 페이지</th>
										</tr>
									</thead>
									<tbody class='border'>
										<tr>
											<td id='checkCol'>
												<input type='checkbox' class='mt-4' name='check1' id='imageCheckIn'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='image.jpg'>
												<img src='#' alt='이미지 이미지' id='image'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='클릭 시 이동할 페이지'>
												/main
											</td>
											<td data-toggle='modal' data-target='#getModal' title='사용 중인 페이지'>
												<ul id='imageUseUrlList' class='pl-0'>
													<li id='imageUseUrl'>
														/*
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td id='checkCol'>
												<input type='checkbox' class='mt-4' name='check1' id='imageCheckIn'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='image.jpg'>
												<img src='#' alt='어두운 이미지 이미지' id='image'/>
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='클릭 시 이동할 페이지'>
												/admin/main
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='사용 중인 페이지'>
												<ul id='imageUseUrlList' class='pl-0'>
													<li id='imageUseUrl'>
														/admin/*
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td id='checkCol'>
												<input type='checkbox' class='mt-4' name='check1' id='imageCheckIn'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='image.jpg'>
												<img src='#' alt='클래스 아이콘' id='image'/>
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='클릭 시 이동할 페이지'>
												#myCls
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='사용 중인 페이지'>
												<ul id='imageUseUrlList' class='pl-0'>
													<li id='imageUseUrl'>
														/user/mypage
													</li>
													<li id='imageUseUrl'>
														/user/{userCode}
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td id='checkCol'>
												<input type='checkbox' class='mt-4' name='check1' id='imageCheckIn'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='image.jpg'>
												<img src='#' alt='쿠폰 아이콘' id='image'/>
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='클릭 시 이동할 페이지'>
												#myCpn
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='사용 중인 페이지'>
												<ul id='imageUseUrlList' class='pl-0'>
													<li id='imageUseUrl'>
														/user/mypage
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td id='checkCol'>
												<input type='checkbox' class='mt-4' name='check1' id='imageCheckIn'/>
											</td>
											<td data-toggle='modal' data-target='#getModal' title='image.jpg'>
												<img src='#' alt='커뮤니티 아이콘' id='image'/>
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='클릭 시 이동할 페이지'>
												#myPst
											</td>
											<td class='text-nowrap' data-toggle='modal' data-target='#getModal' title='사용 중인 페이지'>
												<ul id='imageUseUrlList' class='pl-0'>
													<li id='imageUseUrl'>
														/user/mypage
													</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<div class='row'>
						<div class='col'>
							<ul class='pagination justify-content-center' id='pagination'>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>&laquo;</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>1</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>2</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>3</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>4</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>5</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class='col' id='addImage'>
					<div class='row'>
						<div class='col ml-0 mr-3'>
							<div id='imageTitle'>
								<strong>이미지 추가</strong><hr>
							</div>
							<form>
								<table class='text-nowrap'>
									<thead class='border-0'>
										<tr>
											<th>
											</th>
											<td id='addImageButton'>
												<button type='button' id='add' class='btn btn-secondary m-0 mb-1 float-right' onclick='modal("이미지", "추가", "성공")'>
													추가
												</button> <!-- 나중에 이거 add 버튼 누를 시 스크립트에서 서브밋 및 모달 함수 파라미터 투입값 변화 주기 -->
											</td>
										</tr>
									</thead>
									<tbody class='border'>
										<tr title='사용할 이미지를 넣어주세요.'>
											<th class='bg-secondary text-white'>이미지</th>
											<td>
												<input type='file' name='attachFile' id='fileButton' accept='image/jpeg, image/png' required>
											</td>
										</tr>
										<tr>
											<th class='bg-secondary text-white'></th>
											<td><img class='border' id='previewImg'></td>
										</tr>
										<tr title='클릭 시 이동할 페이지의 URL을 입력하세요.'>
											<th class='bg-secondary text-white'>URL</th>
											<td>
												<input type='text' placeholder='클릭 시 이동할 페이지의 URL을 입력하세요.' required>
											</td>
										</tr>
										<tr title='사용할 페이지를 입력하세요.'>
											<th class='bg-secondary text-white'>페이지</th>
											<td>
												<ul id='addimageUseUrlList' class='pl-0 mb-0'>
													<li id='imageUseUrl'>
														<input type='text' placeholder='사용할 페이지의 URL을 입력하세요' required>
													</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div id='fixProcModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>이미지 수정</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<form>
				<div class='modal-body'>
					<table id='modalTable'>
						<tbody class='text-nowrap'>
							<tr class='border'>
								<th class='bg-secondary text-white'>이미지</th>
								<td>
									<img src='#' class='border' alt='어두운 이미지 이미지' id='modalPreviewImg'>
									<br>
									<input type='file' name='attachFile' class='mb-3' id='modalFileButton' accept='image/jpeg, image/png' required>
								</td>
							</tr>
							<tr class='border'>
								<th class='bg-secondary text-white'>URL</th>
								<td><input type='text' value='/admin/main' class='text-dark' required></td>
							</tr>
							<tr class='border'>
								<th class='bg-secondary text-white'>페이지</th>
								<td><input type='text' value='/admin/*' class='text-dark' required></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class='modal-footer justify-content-center pb-0'>
					<button type='button' class='btn btn-outline-secondary' onclick='modal("이미지", "수정", "중단")'>취소</button>
					<button type='button' class='btn btn-secondary' data-dismiss='modal' onclick='modal("이미지", "수정", "성공")'>수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id='getModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>이미지 조회</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body'>
				<table id='modalTable'>
					<tbody class='text-nowrap'>
						<tr class='border'>
							<th class='bg-secondary text-white'>이미지</th>
							<td><img src='#' class='border' alt='기존 이미지' id='modalPreviewImg'></td>
						</tr>
						<tr class='border' title='연결된 URL'>
							<th class='bg-secondary text-white'>URL</th>
							<td><input type='text' value='/main' readonly></td>
						</tr>
						<tr class='border' title='사용 중인 페이지'>
							<th class='bg-secondary text-white'>페이지</th>
							<td><input type='text' value='/*' readonly></td>
						</tr>
					</tbody>
				</table>
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
