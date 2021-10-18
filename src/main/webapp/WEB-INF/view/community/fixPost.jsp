<title>갓겜:게시글수정</title>
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
							<h4 class='mt-2'>게시글 수정</h4>
							<strong class='ml-2'>작성자</strong>: USER
						</div>
					</div>
					<!-- 게시글 제목 & 본문 -->
					<div class='row'>
						<div class='col'>
							<table class='table'>
								<thead>
									<tr class='mt-3'>
										<th>
											글 ID : 1054<br>
											작성자 : USERz <br>
											작성일시 : 2021-10-05: 15:57
										</th>
									</tr>
								</thead>
								<thead>
									<tr class='mt-3'>
										<th>
											<select id='selector'>
												<option value='talkBoard'>&nbsp;&nbsp;&nbsp;잡담</option>
												<option  selected  value='qstBoard'>&nbsp;&nbsp;&nbsp;질문</option>
												<option value='friendBoard'>&nbsp;&nbsp;&nbsp;친구구인</option>
												<option value='mentorBoard'>&nbsp;&nbsp;&nbsp;멘토구인</option>
												<option value='tipBoard'>&nbsp;&nbsp;&nbsp;팁과노하우</option>
												<option value='studyBoard'>&nbsp;&nbsp;&nbsp; 스터디구인</option>
											</select> 
											<label class='col-9'>
												<input id='title' type='text' class='form-control' value='체력 키우는 꿀팁 전수' oninput='onPostBtn()'/>
											</label>
				               			  </th>
				            		  </tr>
				           		</thead>
				       			<tbody>
				       				 <tr>
				               			<td>
				               				<textarea id='contents' class='form-control' cols='100'  rows='15'oninput='onPostBtn()'>해 주실 횽님 안계심까...</textarea>
				               			</td>
				           			</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 취소 & 등록 버튼 -->
					<div class='row mb-5'>
						<div class='col d-flex justify-content-between'>												<!--  취소&등록 버튼 둘다 모달창에서 "예" 누르면 02.html 로 이동 합니다. -->
							<button type='button'class='btn float-left btn-outline-secondary rounded-0 ml-2' onclick='modal("게시글", "수정", "중단")'>취소</button>
							<button type='button' id='pstUpBtn' class='btn float-right btn-secondary rounded-0 mr-2' onclick='modal("게시글", "수정", "확인")'>수정</button> <!-- disabled  -->
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