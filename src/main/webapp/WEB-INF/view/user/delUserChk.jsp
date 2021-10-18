<title>갓겜:회원탈퇴</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<script>
$(checkAgree);
function checkAgree() {
	if($('#agreeDel').prop('checked') == true)
    	$('#nextStepBtn').removeAttr('disabled');
	else
		$('#nextStepBtn').attr('disabled', true);
}
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container'>
		<div class='row my-5'>
			<div class='col'>
				<div class='row my-1'>
					<h1>회원 탈퇴</h1>
				</div>
				<hr>
				<div class='row mt-4 ml-4'>
					<div class='col d-flex  justify-content-center'>
						<ol class='h5 font-weight-bold pl-0 mt-4'>
							<li class='mb-5'>
								탈퇴 신청한 아이디로 재가입할 수 없습니다.
							</li>
							<li class='mb-5'>
								서비스 이용기록과 보유한 보상 교환 티켓, 박람회 참여권 등은 모두 삭제됩니다.
								<ul class='hyphen'>
									<li>
										<h6 class='text-muted mx-4 mt-2'>
											My Page 페이지의 개인기록은 <span class='text-danger'>모두 삭제</span>되며,
											삭제된 데이터는 <span class='text-danger'>복구되지 않습니다.</span>
										</h6>
									</li>
								</ul>
							</li>
							<li class='mb-3'>
								탈퇴 후 공개 게시글은 삭제되지 않습니다.
								<ul class='hyphen'>
									<li>
										<h6 class='text-muted mx-4 mt-2'>
											커뮤니티 게시판에 등록한 모든 게시물과 업로드한 사진 및 작성한 댓글은 <span class='text-danger'>탈퇴 후에도 유지</span> 됩니다.
										</h6>
									</li>
									<li>
										<h6 class='text-muted mx-4 mt-1'>
											해당 게시물에 대한 삭제를 원하는 경우 반드시 <span class='text-danger'>탈퇴 전에 삭제</span>해 주세요.
										</h6>
									</li>
								</ul>
							</li>
						</ol>
					</div>
				</div>
				<div class='row mb-4 justify-content-center'>
					<h6>
						<input type='checkbox' class='custom-checkbox' id='agreeDel' onchange='checkAgree()'>
						위 내용을 충분히 숙지하였으며, 회원 탈퇴를 진행합니다.
					</h6>
				</div>
				<div class='row mx-5 justify-content-center'>
					<button class='btn btn-outline-secondary col-5 mr-1' data-toggle='modal' data-target='#delUsrCnclModal'>
						이전
					</button>
					<button onclick='location.href ="/kwonchaerin.selfdevelopment/user/quit/step2"' class='btn btn-secondary col-5' id='nextStepBtn' disabled>
						변경하기
					</button>
				</div>
				<hr>
				<div class='row'>
					&nbsp;
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

<!-- 모달 -->
<div id='delUsrCnclModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>돌아가기</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<p>회원탈퇴 작업을 중단하시겠습니까?</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<button class='btn btn-outline-secondary' data-dismiss='modal'>아니요</button>
				<a href='/kwonchaerin.selfdevelopment/user/mypage' class='btn btn-secondary'>&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</a>
			</div>
		</div>
	</div>
</div>