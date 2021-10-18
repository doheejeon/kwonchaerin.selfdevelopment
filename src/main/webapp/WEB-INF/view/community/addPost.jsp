<title>갓겜:게시글쓰기</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
.modal-body {
    text-align:center; 
}

#contents {
    resize:none; 
}

#selector {
   height: 2.3rem;
   width: 8rem;
}

#usrNick a:hover {
	text-decoration: underline;
	cursor: pointer;
}

label[for='title'] {
	width: calc(100% - 9rem);
}
</style>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5'>
		<div class='row'>
			<div class='col'>
				<form id='usrPstForm'>
					<div class='row'>
						<div class='col'>
							<h4 class='mt-2'>게시글 작성</h4>
							<strong class='ml-2' id='usrNik'>
								<a data-toggle='popover' title='작성자'> USER</a>
							</strong> 
						</div>
					</div>
					<div class='row'><!-- 게시글 제목 & 본문 -->
						<div class='col'>
							<table class='table'>
								<thead>
									<tr class='mt-3'>
										<th>
											<select id='selector' onclick='onPostBtn()'>
												<option disabled selected value='chooseBoard'>&nbsp;&nbsp;&nbsp;말머리선택</option>
												<option value='talkBoard'>&nbsp;&nbsp;&nbsp;잡담</option>
												<option value='qstBoard'>&nbsp;&nbsp;&nbsp;질문</option>
												<option value='friendBoard'>&nbsp;&nbsp;&nbsp;친구구인</option>
												<option value='mentorBoard'>&nbsp;&nbsp;&nbsp;멘토구인</option>
												<option value='tipBoard'>&nbsp;&nbsp;&nbsp;팁과노하우</option>
												<option value='studyBoard'>&nbsp;&nbsp;&nbsp; 스터디구인</option>
											</select> 
											<label for='title' class='float-right mb-2'>
												<input id='title' type='text' class='form-control' placeholder='제목을 2자~10자 입력하세요.'
													minlength='2' maxlength='10' oninput='onPostBtn()' required>
											</label>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class='row'>
												<div class='col'>
													<textarea id='contents' class='form-control' cols='100'  rows='15'
														placeholder='내용을 2자~100자 입력하세요.' oninput='onPostBtn()' minlength='2' maxlength='100' required></textarea>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class='row mb-5'>	<!-- 취소 & 등록 버튼 -->
						<div class='col d-flex justify-content-between'>
							<button type='button' class='btn btn-outline-secondary rounded-0 ml-2' onclick='modal("게시글", "등록", "중단")'>취소</button>
							<button type='button' id='pstUpBtn' class='btn float-right btn-secondary rounded-0 mr-2'  onclick='modal("게시글", "등록", "성공")'>등록</button> <!-- disabled -->
						</div>
					</div>
				</form>
				<hr>
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