<title>갓겜:게시글관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#cmmSrchBtn {
	height: 2.3rem;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

#cmmSrchIn {
	height: 2.3rem;
	border-radius: 0;
}

#pstId {
	width: 10%;
}

.page-link {
	border: 0;
}

#usrNick a:hover, #pstContent a:hover, #pstRcm a:hover, #pstRpt a:hover
	{
	text-decoration: underline;
	cursor: pointer;
}

#usrNick a, #pstContent a, #pstRcm a, #pstRpt a {
	font-weight: bold;
}

#delComment { /*모달 작은 글씨*/
   font-size: 5;
}

.card-header {
	 font-size: 90%;
}
</style>

<script>

$(document).ready(function() {
	$('#pstContent a').click(function() {
		parent = $(this).closest('#pstDetail');
		pstId = parent.children('#pstId').text();
		pstContent = pstId + '번째 작성된 글 내용은 이러합니다.'; //DB에서 postId의 값으로 검색해서 postContent 불러오기

		$(this).attr('data-content', pstContent);
		$(this).popover('toggle');
	})
	
	$('#usrNick a').click(function() {
		parent = $(this).closest('#pstDetail');
		writerNick = parent.children('#usrNick').text();
		writerId = writerNick + '님의 아이디(이메일주소)입니다'; //DB에서 userNickName의 값이 writerNick이랑 같을 때
		
		$(this).attr('data-content', writerId);
		$(this).popover('toggle');
	})
	
	$('#pstRcm a').click(function() {
		 location.href='../../community/02.html';
	})
	
	$('#pstRpt a').click(function() {
		parent = $(this).closest('#pstDetail');
		pstId = parent.children('#pstId').text();
		pstRptUsrIds = pstId + '번째 작성된 글을 신고한 회원들의 ID 목록입니다.'; //DB에서 postId의 값으로 검색해서 rcmUsrIds 리스트 객체 불러와서 하나씩 each로 꺼내 나열
		
		$(this).attr('data-content', pstRptUsrIds);
		$(this).popover('toggle');
	})
})

</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>
	
	<div id='underHead' class='row w-100'>
	
	<%@ include file='../include/gnb.jsp' %>
	
		<div class='col' id='adminBody'>
			<div class='row ml-1 mt-3'>
				<div class='col d-flex justify-content-start'>
					<h4>게시글 및 댓글 조회</h4>
					<a type='button' href='/kwonchaerin.selfdevelopment/admin/postsAndComments' target='_self' class='btn btn-default'> 
						<i class='fas fa-redo'></i>
					</a>
				</div>
				<div class='col'>
					<small class='float-right text-muted'>총 1129 건</small>
				</div>
				<hr>
			</div>
			<div class='row mt-2'>
				<div class='col-4 w-25 d-flex justify-content-start'>
					<nav class='nav nav-tabs border-0'>
						<a id='pstBoardBtn' data-toggle='tab' href='#pstBoard' class='nav-link btn btn-outline-secondary active border-0 text-nowrap'> 게시글 </a>
						<a id='cmtBoardBtn' data-toggle='tab' href='#cmtBoard' class='nav-link btn btn-outline-secondary border-0 text-nowrap'>	댓글 </a>
					</nav>
				</div>
				<!-- 검색Bar  -->
				<div class='col-8 w-25 d-flex justify-content-end text-nowrap'>
					<select id='selector' class='text-left'>
						<option disabled selected>검색설정</option>
						<option value='pstTitle'>제목</option>
						<option value='pstContent'>내용</option>
						<option value='pstTitleContent'>제목 + 내용</option>
						<option value='pstUsrNickId'>작성자</option>
					</select>
					<input type='text' class='form-control w-50' placeholder='2글자 이상 입력하세요.' id='cmmSrchIn'>
					<button type='submit' class='btn btn-secondary' id='cmmSrchBtn'>
						<i class="fas fa-search"></i> 검색
					</button>
				</div>
			</div>
			<!-- 전체 게시물 -->
			<div class='row'>
				<div class='col'>
					<div class='tab-content'>
						<div class='tab-pane fade show active' id='pstBoard'>
							<table class='table table-sm table-hover table-secondary'>
								<thead>
									<tr class='text-nowrap'>
										<th id='checkCol'><input type='checkbox' id='checkall1'></th>
										<th>게시글 ID</th>
										<th>말머리</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일시</th>
										<th>댓글</th>
									</tr>
								</thead>
								<tbody>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1055'>1055</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='책 읽었는데 퀴즈 틀렸어요ㅠㅠ'>책 읽었는데 퀴즈틀렸어요ㅠㅠ</td>
										<td id='pstContent'>
											<!-- 나중에 데이터 연결할 생각으로, 클릭 시 a의 data-content 속성 값을 넣어주는 알고리즘 -->
											<a data-toggle='popover' title='내용'> 보기 </a>
										</td>
										<td id='usrNick' title='응애애기'>
											<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
										</td>
										<td id='pstDate' title='21-09-18'>21-09-18</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover' title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1054'>1054</td>
										<td id='pstHead' title='잡담'>잡담</td>
										<td id='pstTitle' title='아침요가 퀘스트'>아침요가 퀘스트</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'> 보기 </a>
										</td>
										<td id='usrNick' title='도히도히'>
											<a data-toggle='popover'title='작성자 ID'> 도히도히 </a>
										</td>
										<td id='pstDate' title='21-09-08'>21-09-08</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover' title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1053'>1053</td>
										<td id='pstHead' title='팁과 노하우'>팁과 노하우</td>
										<td id='pstTitle' title='보상 할인 제대로 받는 법'>보상 할인 제대로 받는 법</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'>보기 </a>
										</td>
										<td id='usrNick' title='정허니'>
											<a data-toggle='popover' title='작성자 ID'> 정허니 </a>
										</td>
										<td id='pstDate' title='21-09-03'>21-09-03</td>
										<td id='pstCmtList'>
											<span>10</span>
											 <a data-toggle='popover'title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1098'>1098</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='자기개발 권태기 왔을때…'>자기개발 권태기 왔을때…</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'>보기 </a>
										</td>
										<td id='usrNick' title='근상'>
											<a data-toggle='popover' title='작성자 ID'> 근상 </a>
										</td>
										<td id='pstDate' title='21-09-01'>21-09-01</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover'title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1055'>1055</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='책 읽었는데 퀴즈 틀렸어요ㅠㅠ'>책 읽었는데 퀴즈틀렸어요ㅠㅠ</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'> 보기 </a>
										</td>
										<td id='usrNick' title='응애애기'>
											<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
										</td>
										<td id='pstDate' title='21-09-18'>21-09-18</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover'title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='1054'>1054</td>
										<td id='pstHead' title='친구구인'>친구구인</td>
										<td id='pstTitle' title='이번 박람회 같이 가실분!!'>이번 박람회 같이 가실분!!</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'>보기 </a>
										</td>
										<td id='usrNick' title='세드세드'>
											<a data-toggle='popover' title='작성자 ID'> 세드세드 </a>
										</td>
										<td id='pstDate' title='21-09-08'>21-09-08</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover' title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='9587'>1053</td>
										<td id='pstHead' title='잡담'>잡담</td>
										<td id='pstTitle' title='등산 퀘스트 완료'>등산 퀘스트 완료</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'> 보기 </a>
										</td>
										<td id='usrNick' title='정허니'>
											<a data-toggle='popover' title='작성자 ID'> 정허니 </a>
										</td>
										<td id='pstDate' title='21-09-03'>21-09-03</td>
										<td id='pstCmtList'>
											<span>10</span>
											 <a data-toggle='popover' title='댓글 목록'>보기</a>
										 </td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='6598'>6598</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='마블몰아보기...'>마블몰아보기...</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'> 보기 </a>
										</td>
										<td id='usrNick' title='러비더비'>
											<a data-toggle='popover' title='작성자 ID'> 러비더비 </a>
										</td>
										<td id='pstDate' title='21-09-01'>21-09-01</td>
										<td id='pstCmtList'>
											<span>10</span>
											<a data-toggle='popover'title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='6257'>6257</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='심심할때 시간...'>심심할때 시간...</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'>보기 </a>
										</td>
										<td id='usrNick' title='웰치스하이'>
											<a data-toggle='popover'title='작성자 ID'>웰치스하이 </a>
										</td>
										<td id='pstDate' title='21-09-01'>21-09-01</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover' title='댓글 목록'>보기</a>
										</td>
									</tr>
									<tr id='pstDetail'>
										<td>
											<input type='checkbox' name='check1'>
										</td>
										<td id='pstId' title='6598'>6598</td>
										<td id='pstHead' title='질문'>질문</td>
										<td id='pstTitle' title='>킬링타임에 좋은..'>킬링타임에 좋은..</td>
										<td id='pstContent'>
											<a data-toggle='popover' title='내용'>보기 </a>
										</td>
										<td id='usrNick' title='룰라비'>
											<a data-toggle='popover' title='작성자 ID'> 룰라비 </a>
										</td>
										<td id='pstDate' title='21-09-01'>21-09-01</td>
										<td id='pstCmtList'>
											<span>10</span> 
											<a data-toggle='popover' title='댓글 목록'>보기</a>
										</td>
									</tr>
								</tbody>
							</table>
							<div class='row'>
								<div class='col-2'>
								</div>
								<!-- 게시글 페이지 네비게이션 -->
								<div class='col d-flex justify-content-center'>
									<ul class='pagination'>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'> 
												<span>&laquo;</span>
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
											<a class='page-link text-dark' href='#'>4</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>5</a>
										</li>
										<li class='page-item'>
											<a class='page-link text-dark' href='#'>
												 <span>&raquo;</span>
											</a>
										</li>
									</ul>
								</div>
								<!--  게시글 삭제 버튼 -->
								<div class='col-2 text-nowrap'>
									<button id='pstDelBtn' class='btn btn-outline-secondary float-right' onclick='isChecked("게시글", "삭제", "checkall1")'>게시글삭제</button>
								</div>
							</div>
						</div>
						<!-- 댓글페이지 -->
						<div class='row'>
				<div class='col'>
					<div class='tab-content'>
						<div class='tab-pane fade' id='cmtBoard'>
								<table class='table table-sm table-hover table-secondary'>
									<thead>
										<tr class='text-nowrap'>
											<th id='checkCol'><input type='checkbox' id='checkall2'></th>
											<th width='20%'>댓글 ID</th>
											<th width='30%'>작성자</th>
											<th width='40%'>내용</th>
											<th width='20%'>게시글</th>
										</tr>
									</thead>
									<tbody>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1055'>1055</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' target='_blank'>이동</a>
											</td>
										</tr>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1054'>1054</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' target='_blank'>이동</a>
											</td>
										</tr>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1053'>1053</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' target='_blank'>이동</a>
											</td>
										</tr>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1052'>1052</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt target='_blank'>이동</a>
											</td>
										</tr>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1051'>1051</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' target='_blank'>이동</a>
											</td>
										</tr>
										<tr id='cmtDetail'>
											<td>
												<input type='checkbox' name='check2'>
											</td>
											<td id='cmtId' title='1050'>1050</td>
											<td id='usrNick' title='응애애기'>
												<a data-toggle='popover' title='작성자 ID'> 응애애기 </a>
											</td>
											<td id='cmtText'>
												
											</td>
											<td id='cmtPst' title='클릭하여 보기'> 
												<a href='/kwonchaerin.selfdevelopment/community/getPostAddCmt' target='_blank'>이동</a>
											</td>
										</tr>
									</tbody>
								</table>
								<div class='row'>
									<div class='col-2'>
									</div>
									<!-- 댓글 페이지 네비게이션 -->
									<div class='col d-flex justify-content-center'>
										<ul class='pagination'>
											<li class='page-item'>
												<a class='page-link text-dark' href='#'> 
													<span>&laquo;</span>
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
												<a class='page-link text-dark' href='#'>4</a>
											</li>
											<li class='page-item'>
												<a class='page-link text-dark' href='#'>5</a>
											</li>
											<li class='page-item'>
												<a class='page-link text-dark' href='#'>
													 <span>&raquo;</span>
												</a>
											</li>
										</ul>
									</div>
									<!--  댓글 삭제 버튼 -->
									<div class='col-2 text-nowrap'>
										<button id='cmtDelBtn' class='btn btn-outline-secondary float-right' onclick='isChecked("댓글", "삭제", "checkall2")'>댓글삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<hr>
		</div>
	</div>
</div>

<!--채린님 모달 -->
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
