<title>갓겜:게시판조회</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
.table {
	font-size: 0.8rem; /*테이블 폰트 사이즈 줄임*/
}

.pagination {
	font-size: 0.1rem; /*페이지 네이션 사이즈 줄임*/
}

#selector {
	height: 2.3rem; /*검색바 사이즈 조절*/
	width: 8rem;
}

.bg {
	background-color: #84B1D9;
	color: white;
}

.page-link {
	border: 0;
}

#ttlCnt {
	font-size: 0.6rem;
	float: right;
}
</style>

<script>
$(()=> {
    $('#board1').click(()=> {
          location.href='02.html';
    });
    $('#board2').click(()=> {
        location.href='02.html';
  });
    $('#board3').click(()=> {
        location.href='02.html';
  });
    $('#board4').click(()=> {
        location.href='02.html';
  });
    $('#board5').click(()=> {
        location.href='02.html';
  });
    $('#board6').click(()=> {
        location.href='02.html';
  });
    $('#board7').click(()=> {
        location.href='02.html';
  });
   $('#board5').click(()=> {
       location.href='02.html';
   });
   $('#board6').click(()=> {
       location.href='02.html';
   });
   $('#board7').click(()=> {
       location.href='02.html';
   });
   $('#board8').click(()=> {
       location.href='02.html';
   });
   $('#board9').click(()=> {
       location.href='02.html';
   });
   $('#board10').click(()=> {
       location.href='02.html';
   });
   $('#board11').click(()=> {
       location.href='02.html';
   });
});
   
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5'>
		<div class='row'>
			<div class='ml-3 mt-3'>
				<h4 class='mt-2'>커뮤니티</h4>
			</div>
			<div class='mt-4'>
				<a type='button' href='/kwonchaerin.selfdevelopment/community/board' target='_self'
					class='btn btn-default'> <i class="fas fa-redo"></i>
				</a>
			</div>
		</div>
	
		<div id='ttlCnt' class='text-right mr-3'>총 : 1129 건</div>
		<hr>
		<!-- 버튼식 navBar -->
		<div class='row'>
			<div class='col ml-3'>
				<div class='row text-nowrap'>
					<nav class='nav nav-tabs'>
						<a class='nav-link btn btn-outline-secondary active' data-toggle='tab' href='#allBoard'>전체</a>
						<a class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#talkBoard'>잡담</a> 
						<a class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#questBoard'>질문 </a> 
						<a class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#studyBoard'>스터디구인 </a>
						<a	class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#friendBoard'>친구구인 </a> 
						<a class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#mentorBoard'>멘토구인</a> 
						<a class='nav-link btn btn-outline-secondary' data-toggle='tab' href='#tipsBoard'>팁과노하우 </a>
					</nav>
				</div>
			</div>
		</div>
		<!-- 전체 페이지-->
		<div class='row'>
			<div class='col'>
				<div class='tab-content'>
					<div class='tab-pane fade show active' id='allBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr class='bg' id='board1'>
									<td>질문</td>
									<td id='td'><span class='badge badge-primary badge-pill'>best</span>책
										읽었는데 퀴즈 틀렸어요ㅠㅠ</td>
									<td><span class='badge badge-dark mr-1'>3</span>&nbsp;SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr class='bg' id='board2'>
									<td>잡담</td>
									<td id='td'><span class='badge badge-primary badge-pill'>best</span>
										아침요가 퀘스트 성공했어요!</td>
									<td><span class='badge badge-dark mr-1'>8</span>&nbsp;도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr class='bg' id='board3'>
									<td>팁과 노하우</td>
									<td id='td'><span class='badge badge-primary badge-pill'>best</span>
										보상 할인 제대로 받는 법</td>
									<td><span class='badge badge-dark mr-1'>2</span>&nbsp;정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr id='board4'>
									<td>질문</td>
									<td>책 읽었는데 퀴즈 틀렸어요ㅠㅠ</td>
									<td><span class='badge badge-dark mr-1'>3</span>&nbsp;SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr id='board5'>
									<td>잡담</td>
									<td id='td'>아침요가 퀘스트 성공했어요!</td>
									<td><span class='badge badge-dark mr-1'>8</span>&nbsp;도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr id='board6'>
									<td>팁과 노하우</td>
									<td id='td'>보상 할인 제대로 받는 법</td>
									<td><span class='badge badge-dark mr-1'> 2</span>&nbsp;정허니
									</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr id='board7'>
									<td>질문</td>
									<td id='td'>코딩 테스트 통과하신분 답 공유..</td>
									<td><span class='badge badge-dark mr-1'>10</span>&nbsp;챌니</td>
									<td>21-09-22</td>
									<td>6</td>
								</tr>
								<tr id='board8'>
									<td>질문</td>
									<td id='td'>도서 추천</td>
									<td><span class='badge badge-dark mr-1'>1</span>&nbsp;Sue</td>
									<td>21-09-28</td>
									<td>6</td>
								</tr>
								<tr id='board9'>
									<td>팁과 노하우</td>
									<td id='td'>자기개발 권태기 왔을때…</td>
									<td><span class='badge badge-dark mr-1'>5</span> 근상</td>
									<td>21-09-09</td>
									<td>3</td>
								</tr>
								<tr id='board10'>
									<td>친구 구인</td>
									<td id='td'>이번 박람회 같이 가실분!!</td>
									<td><span class='badge badge-dark mr-1'>4</span> Ced</td>
									<td>21-09-08</td>
									<td>3</td>
								</tr>
								<tr id='board11'>
									<td>잡담</td>
									<td id='td'>아기랑 같이 등산 퀘스트 완료</td>
									<td><span class='badge badge-dark mr-1'>3</span> 아빠</td>
									<td>21-09-06</td>
									<td>5</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 잡담 페이지-->
					<div class='tab-pane fade' id='talkBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>잡담</td>
									<td id='td'>잡담 잡담</td>
									<td><span class='badge badge-dark mr-1'>3</span> SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr>
									<td>잡담</td>
									<td id='td'>마블몰아보기...</td>
									<td><span class='badge badge-dark mr-1'>8</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>집담</td>
									<td>심심할때 시간...</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr>
									<td>집담</td>
									<td>킬링타임에 좋은..</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 질문 페이지-->
					<div class='tab-pane fade' id='questBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>댓글수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>질문</td>
									<td id='td'>질문질문</td>
									<td><span class='badge badge-dark mr-1'>3</span> SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr>
									<td>질문</td>
									<td id='td'>꿀팁공유좀!</td>
									<td><span class='badge badge-dark mr-1'>8</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>질문</td>
									<td>비트코인...</td>
									<td><span class='badge badge-dark'>2</span> 정허니
									</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr>
									<td>질문</td>
									<td>요새 코스피 어떄?</td>
									<td><span class='badge badge-dark mr-1'> 2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 스터디구인 페이지-->
					<div class='tab-pane fade' id='studyBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>스터디구인</td>
									<td id='td'>스터디구인합니다!</td>
									<td><span class='badge badge-dark mr-1'>3</span> SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr>
									<td>스터디구인</td>
									<td id='td'>스터디구인! 코딩공부같이</td>
									<td><span class='badge badge-dark mr-1'>8</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>스터디구인</td>
									<td>서울 스터디...</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr>
									<td>스터디구인</td>
									<td>스터디구인</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 친구구인 페이지-->
					<div class='tab-pane fade' id='friendBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>친구구인</td>
									<td id='td'>친구구합니다!</td>
									<td><span class='badge badge-dark mr-1'>8</span> 승헌</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>친구구인</td>
									<td id='td'>친구구인! 코딩공부같이</td>
									<td><span class='badge badge-dark mr-1'>8</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>친구구인</td>
									<td>서울 코딩같이하실 친구분들...</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>친구구인</td>
									<td>친구구인!!!!!</td>
									<td><span class='badge badge-dark mr-1'>5</span> 응애애기</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 멘토구인 페이지-->
					<div class='tab-pane fade' id='mentorBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>멘터구인</td>
									<td id='td'>선생님구합니다!</td>
									<td><span class='badge badge-dark mr-1'>3</span> SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr>
									<td>멘토구인</td>
									<td id='td'>코딩선생님 구합니다</td>
									<td><span class='badge badge-dark mr-1'>5</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>멘토구인</td>
									<td>서울 멘토구인...</td>
									<td><span class='badge badge-dark mr-1'>3</span> Sue</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr>
									<td>멘토구인</td>
									<td>영어멘토구해요~!</td>
									<td><span class='badge badge-dark mr-1'>2</span> 정허니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 팁과노하우 페이지-->
					<div class='tab-pane fade' id='tipsBoard'>
						<table class='table table-hover table-secondary'>
							<thead>
								<tr id='tr'>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>팁과노하우</td>
									<td id='td'>보상빨리리얻는꿀팁!</td>
									<td><span class='badge badge-dark'> 3</span> SH</td>
									<td>21-09-18</td>
									<td>10</td>
								</tr>
								<tr>
									<td>팁과노하우</td>
									<td id='td'>보상제일좋은쿠폰</td>
									<td><span class='badge badge-dark mr-1'>5</span> 도리</td>
									<td>21-09-22</td>
									<td>8</td>
								</tr>
								<tr>
									<td>팁과노하우</td>
									<td>...</td>
									<td><span class='badge badge-dark mr-1'>6</span> 룰루</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
								<tr>
									<td>팁과노하우</td>
									<td>영어잘하는법</td>
									<td><span class='badge badge-dark mr-1'>7</span> 효니</td>
									<td>21-09-08</td>
									<td>8</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 글쓰기 버튼 -->
		<div class='row'>
			<div class='col'>
				<form action='03.html'>
					<button type='button'
						class='btn float-right btn-secondary rounded-0 ml-1 mr-3'>
						<i class="fas fa-pen-square"></i> 글쓰기
					</button>
				</form>
			</div>
		</div>
		<!-- 페이지 네이션  -->
		<div class='row mt-3'>
			<div class='col'>
				<nav>
					<ul class='pagination d-flex justify-content-center'>
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
				</nav>
			</div>
		</div>
		<!-- 검색Bar -->
		<div class='row'>
			<div class='col mt-2'>
				<div class='d-flex justify-content-center text-nowrap'>
					<select id='selector' class='text-left'>
						<option selected value='pstTitle'>제목</option>
						<option value='pstContent'>내용</option>
						<option value='pstTitleContent'>제목 + 내용</option>
						<option value='pstUsrNickId'>작성자</option>
					</select> 
					<input type='text' class='form-control w-50' placeholder='2글자 이상 입력하세요.' id='cmmSrchIn'>
					<button type='button' class='btn btn-secondary w-10' id='cmmSrchBtn'>
						<i class="fas fa-search"></i> 검색
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>