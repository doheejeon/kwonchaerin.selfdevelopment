<title>갓겜:퀘스트완료</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#previewImg {
	background-color: #e9e9e9;
	margin:1.5rem;
	height:19rem;
	width:30rem;
}

#nowExp {
	width:50%
}

#expectedExp {
	width:25%
}
</style>

<script>
function showImg(input) {
	if(input.files[0]) {
		let reader = new FileReader();
		reader.readAsDataURL(input.files[0])
		
		reader.addEventListener('load', () => {
			$('#previewImg').attr('src', reader.result)
		}, false)
	}
}

$(() => {
	$('input').change(function() {
		showImg(this)
	})
	
	$('#fileButton').click(() => {
		let data = new FormData($('form')[0])
		
		$.ajax({
			method: 'post',
			data,
			processData: false,
			contentType: false,
			success: result => $('#infoMsg').text('')
		})
	})
})

</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5 my-5'>
		<div class='row justify-content-center my-5'>
			<h3>퀘스트 완료</h3>
			<hr>
		</div>	
		<div class='row justify-content-center mt-3'>
			<div class='col'>
				<h1 class='mb-4'><b>알고리즘 껌이즘</b></h1>
				<ul class='list-group list-group-horizontal'>
					<li class='list-group-item active bg-secondary border-secondary'><b>공부 > 코딩 > JAVA</b></li>
					<li class='list-group-item'>★★☆☆☆</li>
				</ul>
				
				<br>
				<!-- user명, 레벨 -->
				<div class='row justify-content-between'>
					<div class='col-4'><b>USERZ</b></div>
					<div class='col-4 text-right text-muted'><span class='badge badge-secondary'>LV 8</span></div>
				</div>
				<!-- 경험치 -->
				<div class='progress'>
					<!-- 현재경험치 -->
					<div class='progress-bar bg-secondary' id='nowExp' ></div>
					<!-- 퀘스트 수행 후 얻게될 예상경험치 -->
					<div class='progress-bar bg-secondary progress-bar-striped' id='expectedExp'></div>
				</div>
				<!--파일선택 -->
				<div class='justify-content-center mt-4'>
					<div class='row justify-content-between'>
						<input type='file' class='align-self-center ml-3' name='attachFile' id='fileButton' accept='.jpg, .png'>
						<h6 class='small ml-3 align-self-center mt-2' id='infoMsg'>2MB 이하의 JPG, PNG파일을 제출해주세요.</h6>
					</div>
					<div class='row'> 
						<button class='btn btn-lg btn-secondary w-100 mx-3 mt-4' id='completeQstBtn' 
							onclick='modal("퀘스트", "제출", "확인")'> 제출하기 </button>
					</div>
				</div>
			</div>
			<!-- 이미지 미리보기위치 -->
			<div class='col'>
				<form class='mt-3'>
					<table>
						<tbody>
							<tr>
								<td class='justify-content-center'><img id='previewImg'/></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>

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