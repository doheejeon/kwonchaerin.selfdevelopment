<title>갓겜:게시글조회</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
.badge {
	vertical-align: middle;
}

#pstWriter {
	padding: 0.3rem;
	padding-left: 1rem;
	height: 2rem;
	background-color: #84B1D9;
}

#pstTable #pstContent {
	min-height: 12rem;
}

.form-control-plaintext {
	padding: 0;
	margin: 0;
	width: 100%;
	background-color: transparent;
	border: none;
}

.form-control-plaintext:focus  {
	outline: none;
}

#usrCmt .form-control-plaintext {
	font-size: 0.9rem;
}
</style>

<script>
function fixProcFn() {
	$('#cmtFixProcBtn').attr('hidden', true);
	$('#cmtDelBtn').attr('hidden', true);
	$('#cmtFixCnclBtn').removeAttr('hidden');
	$('#cmtFixSaveBtn').removeAttr('hidden');
	
	$('#usrCmt #usrCmt3').removeAttr('readonly');
	$('#usrCmt #usrCmt3').attr('class', 'm-0 pl-0 py-0 form-control-plaintext mr-2 border bg-white');
}

function fixSaveFn() {
	$('#cmtFixProcBtn').removeAttr('hidden');
	$('#cmtDelBtn').removeAttr('hidden');
	$('#cmtFixSaveBtn').attr('hidden', true);
	$('#cmtFixCnclBtn').attr('hidden', true);

	$('#usrCmt #usrCmt3').attr('readonly');
	$('#usrCmt #usrCmt3').attr('class', 'm-0 pl-0 py-0 form-control-plaintext mr-2');
}

$(document).ready(() => {
	$('#cmmCmtPstBtn').click(() => {
		if(5 <= $('#cmmCmtPst').val().length && $('#cmmCmtPst').val().length <= 25)
			modal("댓글", "등록", "확인");
		else modal("댓글", "등록", "실패10", "5자 이상 25자 이하를 입력하세요.");
	})
})
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5'>
		<div class='row'>
			<div class='col'>
				<h4 class='mt-2'>게시글 조회</h4>
				<hr>
			</div>
		</div>
		<!-- 게시글 제목 & 본문-->
		<div class='row'>
        	<div class='col'>
				<table class='table' id='pstTable'>
	            	<thead>
	            		<tr>
	            			<th class='pl-0'>
	            				<a class='small titleColor' href='/kwonchaerin.selfdevelopment/community/board' id='head'>질문 ></a>
								<h5 class='font-weight-bold mt-2' id='pstTitle'>
									20대 필독서 추천 부탁드립니다~!!
	            				</h5>
	            			</th>
	            		</tr>
	            	</thead>
	            	<tbody>
						<tr >
							<!-- USER.회원정보 페이지 링크 넣을 곳! -->
							<td id='pstWriter' class='text-light'>
								<span class='badge bg-white titleColor' id='usrLv'>13</span>
								<a class='h5 btn p-0 m-0 titleColor font-weight-bolder' href='/kwonchaerin.selfdevelopment/user/{usrCode}' id='usrNick'>1SE1</a>
								<span class='text-light btn btn-sm p-0 m-0 ml-3 disabled'>댓글 <b id='pstCmtCnt'>2</b></span>
							</td>
	               		</tr>
	               		<tr>
							<td>
                  				<div id='pstContent'>
                  					<br>
									<input id='line' value='자기 개발 퀘스트로 독서 진행 중이라 책에 관심이 많은데' class='m-0 p-0 form-control-plaintext mx-3' maxlength='50' readonly>
									<input id='line' value='20살에 읽으면 도움될 책 추천해주세요!! : )' class='m-0 p-0 form-control-plaintext mx-3' maxlength='50' readonly>
									<input id='line' class='m-0 p-0 form-control-plaintext mx-3' maxlength='50' readonly hidden>
		                 	 	</div>
							</td>
		               	</tr>
	               	</tbody>
               	</table>
              	</div>
		</div>
		<div class='row'>
              	<div class='col d-flex justify-content-center w-100'>
				<button type='button' id='rpttBtn' class='btn btn-secondary rounded-0 mt-1 ml-1' data-toggle='modal' data-target='#rptChkModal'>
					&nbsp;&nbsp;신&nbsp;고&nbsp;&nbsp;
				</button>
			</div>
		</div> 
		<hr>
		<!-- 댓글 -->
		<div class='row small ml-2 mb-3'>
			<strong>댓글 2</strong>
		</div>
		<div class='row'>
			<div class='col ml-3' id='cmtContents'>
	   			<div id='usrCmt' class='my-2'>
	  				<span class='badge text-light bg-secondary' id='usrLv'>8</span>
					<a class='btn btn-sm p-1 m-0 font-weight-bold titleColor' href='/kwonchaerin.selfdevelopment/user/{usrCode}' id='usrNick'>사랑의총알</a>
	         		<input name='usrCmt' id='usrCmt1' value='아프니까 청춘이다 아프니까 청춘이다 아프니까 청춘이다 아프니까 청춘이다 아프니까 청춘이다'
	         			class='m-0 pl-0 py-0 form-control-plaintext mr-2' readonly>
	        	</div>
				<div id='usrCmt' class='my-2'>
					<span class='badge text-light bg-secondary' id='usrLv'>5</span>
					<a class='btn btn-sm p-1 m-0 font-weight-bold titleColor' href='/kwonchaerin.selfdevelopment/user/{usrCode}' id='usrNick'>OoOoOo</a>
	         		<input name='usrCmt' id='usrCmt2' value='저는 개인적으로 ‘나는 나와 연애한다’ 추천드립니다 ! 외롭지 않아요'
	         			class='m-0 pl-0 py-0 form-control-plaintext mr-2' readonly>
				</div>
			</div>
		</div>
		<br>
		<!-- 댓글작성 -->
		<div class='row'>
			<form id='cmtForm' class='col mr-1'>
				<input class='form-control mt-3 ml-4' id='cmmCmtPst' placeholder='댓글을 5글자 이상 25글자 이내로 작성해주세요.' minlength='5' maxlength='25' required>
				<button type='button' id='cmmCmtPstBtn' class='btn float-right btn-secondary rounded-0 mt-2'>등록</button>
			</form>
		</div>
		<hr>
		<!-- 게시글 수정 & 삭제 버튼 -->
	   <div class='row'>
	      <div class='col'>
	         <div class='float-right'>
	            <a href='/kwonchaerin.selfdevelopment/community/fixPost' type='button' class='btn btn-outline-secondary rounded-0'>수정</a>
	            <button type='button' class='btn btn-secondary rounded-0' onclick='modal("게시글", "삭제", "확인")'>삭제</button><!-- 게시글 삭제 이후 01.html로이동 -->
	         </div>
	         <a type='button' href='/kwonchaerin.selfdevelopment/community/board' class='btn btn-outline-secondary rounded-0 float-left'>
	         	<i class="fas fa-list"></i>&nbsp;목록
	         </a>
	      </div>
	   </div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

<!-- 채린님 모달 -->
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

<!-- 게시글 신고 모달-->
<div id='rptChkModal' class='modal fade' tabindex='-1'>
   <div class='modal-dialog'>
      <div class='modal-content'>
         <div class='modal-header'>
            <strong>게시글 신고</strong>
            <button type='button' class='close' data-dismiss='modal'>
               <span>x</span>
            </button>
         </div>
         <div class='modal-body text-center'>
            <table class='border-0 mx-3'>
               <tr>
                  <td>신고자</td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <th>김회원</th>
               </tr>
               <tr>
                  <td colspan='3'><br></td>
               </tr>
               <tr>
                  <td>글 ID</td>
                  <td></td>
                  <th>5555</th>
               </tr>
               <tr>
                  <td colspan='3'><br></td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td></td>
                  <th>Sue</th>
               </tr>
            </table>
         </div>
         <div class='modal-footer justify-content-center'>
            <button class='btn btn-outline-secondary' data-dismiss='modal' onclick='modal("게시글", "신고", "중단2")'> 취 소 </button>
            <button class='btn btn-secondary' data-dismiss='modal' onclick='modal("게시글", "신고", "완료")'> 신 고 </button>
         </div>
      </div>
   </div>
</div>