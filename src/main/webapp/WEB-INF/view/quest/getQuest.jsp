<title>갓겜:퀘스트조회</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#qstImgDiv { 
	position: relative;
	width: 100%;
	padding: 0;
	margin: 0;
}

#qstImgDiv #qstProcessTxt {
	position: absolute;
	right: 0;
	z-index: 3;
	border-radius: 0;
}

#blackBox,
#qstImg {
	position: absolute;
	width: 100%;
	height: 18rem;
}

table{
	text-align:center;
}

#qstStop,
#qstEnd {
	width: 40%;
}
</style>

<script>
//qstProcess 변화, 
function qstProcBtn() {
	$('#qstProcBtn').click(function() {
		$(this).closest('button').attr('id','parent');
		$('#parent').empty();
		$('#parent').html(
			"<button type='button' class='btn border btn-outline-secondary m-1' "+
				"id='qstStop' data-toggle='modal' data-target='#qstStopModal'>" +
				"포기</button>" +	
			"<a class='btn border btn-outline-secondary w-30 m-1'" +
				"id='qstEnd' href='03.html'>" +
				"완료</button>"
		)
		
		$('#parent').removeAttr('id');
	})
}
$(qstProcBtn);
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5 my-5'> 
		<div class='row justify-content-center my-5'>
			<h3>퀘스트 내용</h3>
			<hr>
		</div>
		<div class='row justify-content-center mt-3'>
			<div class='col'>
				<div class='row'>
					<div class='col-6'>
						<div class='card'>
							<div class='card-body' id='qstImgDiv'>
								<div id='qstImgCardDiv'>
									<button id='qstProcessTxt' class='p-1 btn btn-secondary font-weight-bold'>
										수행가능
									</button>
									<img src='#' id='qstImg' class='align-self-center' alt='퀘스트이미지' />
								</div>
							</div>
						</div>
					</div> 
					<div class='col align-self-top pl-5 text-center'>
						<div class='row align-self-center'>
							<h1><b>알고리즘 껌이즘</b></h1>
						</div>
						<div class='row align-self-end'>
							<div class='card w-30 border'>
								<div class='card-header' id='qstClsName'>
									공부 > 코딩 > JAVA
								</div>
								<ul class='list-group list-group-flush'>
									<li class='list-group-item' id='qstDifficulty'>
										★★☆☆☆
									</li>
									<li class='list-group-item' id='qstDetail'>
										Baekjoon Online Judge 사이트에서 <br>
										JAVA 알고리즘 문제 3개를 풀어보자!
									</li>
								</ul>
								<button type='button' class='btn btn-outline-secondary w-30 m-1' 
									data-toggle='modal' data-target='#qstAcptSucModal' id='qstProcBtn'>
										수락하기
								</button>
								<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' target='_self' class='btn btn-outline-secondary w-30 m-1'>
									목록
								</a>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>


<div id='qstAcptSucModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 수락</b></h6>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<div class='modal-body text-center'>
				<p class='mt-3'>퀘스트를 수락하셨습니다.</p>
				<p class='mt-1 text-muted'>확인버튼 클릭시 '퀘스트목록'으로 이동합니다.</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' class='btn btn-outline-secondary'>확인</a>
			</div> 
		</div>
	</div>
</div>

<div id='qstAcptFailModal1' class='modal fade' tabindex='-1'> 
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 수락실패</b></h6>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<div class='modal-body text-center'>
				<p class='mt-3'>존재하지 않는 퀘스트입니다.</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' class='btn btn-outline-secondary' data-dismiss='modal'>확인</a>
			</div> 
		</div>
	</div>
</div>

<div id='qstAcptFailModal2' class='modal fade' tabindex='-1'> 
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 수락실패</b></h6>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<div class='modal-body text-center'>
				<p class='mt-3'>현재 사용할 수 없는 퀘스트입니다.</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' class='btn btn-outline-secondary' data-dismiss='modal'>확인</a>
			</div> 
		</div>
	</div>
</div>

<div id='qstStopModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h6 class='modal-title'><b>퀘스트 포기</b></h6>
				<button type='button' class='close' data-dismiss='modal'>&times;</button>
			</div>
			<div class='modal-body text-center'>
				<p class='mt-3'>퀘스트를 정말 포기하시겠습니까?</p>
			</div>
			<div class='modal-footer justify-content-center'>
				<button type='button' class='btn btn-outline-secondary' data-dismiss='modal'>취소</button>
				<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='' data-dismiss='modal'>확인</button>
			</div>
		</div>
	</div>
</div>