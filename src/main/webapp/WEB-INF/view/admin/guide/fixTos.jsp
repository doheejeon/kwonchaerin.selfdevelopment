<title>갓겜:가이드 관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style> 
#adminGuideTitle{
	margin-top:1rem;
	font-size:20;
}

#textView, #textView2{
	width:100%;
	height:10rem;
	overflow:auto;
	border:0.01rem solid lightgrey;
}
</style>

<script>
function openTextFile() {
	var input = document.createElement("input");
	input.type = "file";
	input.accept = "text/plain";
	
	input.onchange = function(event) {
		processFile(event.target.files[0]);
	};
	input.click();
}

function processFile(file) {
	var reader = new FileReader();
	
	reader.onload = function() {
		textView.innerText = reader.result;
	};
	reader.readAsText(file, "utf-8");
}

function openTextFile2() {
	var input = document.createElement("input");
	input.type = "file";
	input.accept = "text/plain";
	
	input.onchange = function(event) {
		processFile2(event.target.files[0]);
	};
	input.click();
}

function processFile2(file) {
	var reader = new FileReader();
	
	reader.onload = function() {
		textView2.innerText = reader.result;
	};
	reader.readAsText(file, "utf-8");
}
</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>
	
	<div id='underHead' class='row w-100'>
	
	<%@ include file='../include/gnb.jsp' %>
	
		<div class='col' id='adminBody'>
			<div class='row'>
				<div class='col' id='logView'>
					<div class='row'>
						<div class='col'>
							<div id='adminGuideTitle'>
								<strong>서비스 이용약관 및 개인정보 처리방침</strong><hr>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col m-3'>
							<p>
								<strong>서비스 이용약관</strong>
								<button type='button' class='btn btn-secondary float-right' onclick='modal("약관", "수정", "완료")'>저장</button>
								<button class='btn btn-outline-secondary float-right' onclick='openTextFile()'>파일 찾기</button>
							</p>
							<div id='textView'></div>
						</div>
					</div>
					<div class='row'>
						<div class='col m-3'>
							<p>
								<strong>개인정보 처리방침</strong>
								<button class='btn btn-secondary float-right' onclick='modal("약관", "수정", "완료")'>저장</button>
								<button class='btn btn-outline-secondary float-right' onclick='openTextFile2()'>파일 찾기</button>
							</p>
							<div id='textView2'></div>
						</div>
					</div>
					<div class='row'>
						<div class='col m-3'>
							<form action='../../guide/02.html'>
								<button type='button' class='btn btn-secondary float-right'>확인하기</button>
							</form>
						</div>
					</div>
				</div>
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