<title>갓겜:퀘스트목록</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
img {
	width: 100%;
	min-width: 10rem;
}

.page-item.active .page-link {
  z-index: 3;
  color: #fff;
  background-color: secondary;
  border-color: secondary;
} 

#doneQstImgDiv  {
	position: relative;
	background-color: rgba(132, 177, 217, 0.2);
}

#paginationDiv button {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
	width: 5rem;
	border-top: 0;
}
</style>

<script>
//완료한 퀘스트 클릭시 발생하는 popOver
$(document).ready(function() {
	$('[data-toggle="popover"]').popover({container: "body"});
})

window.onload = function() {
	$('#qstImg').height($('#qstImg').width());
	
	$(footerPosition);
	
	$(window).resize(function() {
		$(footerPosition);
		$('#qstImg').height($('#qstImg').width());
	})
}

</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container mt-5 my-5'>
		<div class='row justify-content-center my-5'>
			<h3>퀘스트 목록</h3>
			<hr>
		</div>
		<div class='row justify-content-center'>
			도전할 퀘스트를
		</div>
		<div class='row justify-content-center h1'>
			<b>선택하세요</b>
		</div>
		<div class='row justify-content-center text-muted mt-1'>
			다양한 퀘스트들 중 오늘보다 더 성장할 내일의 나로 만들어줄 퀘스트를 찾아보세요.
		</div>
		<form class='row mt-3 text-center form-inline'>
			<div class='col'>
				<nav class='nav nav-tabs justify-content-center'>
					<button type='button' class='nav-link active btn-outline-secondary' data-toggle='tab' onClick='allClsQst()'>전체</button>
					<button type='button' class='nav-link btn-outline-secondary' data-toggle='tab' onClick='exerciseClsQst()'>운동</button>
					<button type='button' class='nav-link btn-outline-secondary' data-toggle='tab' onClick='studyClsQst()'>공부</button>
				
				<select id='difficultySelect' class='border btn'>
					<option disabled selected>난이도</option>
					<option value='1' id='stageOne'>★☆☆☆☆</option>
					<option value='2' id='stageTwo'>★★☆☆☆</option>
					<option value='3' id='stageThree'>★★★☆☆</option>
					<option value='4' id='stageFour'>★★★★☆</option>
					<option value='5' id='stageFive'>★★★★★</option>
				</select>
				
				<input type='text' class='form-control ml-2' placeholder='2글자 이상 한글을 입력'>
				<button type='button' class='btn block btn-outline-secondary mb-2' id='qstSrcBtn'>검색</button>
				</nav>
			</div>		
		</form>
		
		<div class='row justify-content-center'>  
			<div class='col'>
				<div class='card-group w-60'>
					<div class='card'>
						<div class='card-header border' id='qstProcess'>
							<span class='card-title'>수행가능</span>
						</div>
						<div class='card-body'> 
							<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' target='_self' class='card-img text-center'> 
								<img src='#' alt='코딩 이미지' id='qstImg'></a>
						</div>
						<div class='card-footer text-center'>
							<p class='card-text' id='qstDifficulty'>★★☆☆☆</p>
							<h5 class='card-title' id='qstName'><b>알고리즘 껌이즘</b></h5>
							<p class='card-text' id='qstClsName'>공부 > 코딩 > JAVA</p>
						</div>
					</div>
					<div class='card' id='doneQstImgDiv'>
						<div class='card-header border' id='qstProcess'>
							<span class='card-title'>완료</span>
						</div>
						<div class='card-body'>
							<a type='button'  id='doneQst' class='card-img text-center text-muted disabled'  
								title='퀘스트 완료!' data-toggle='popover' data-container='body' data-placement='top' 
									data-content='이미 완료한 퀘스트입니다.'> 
								<img src='#' alt='일본어 이미지' id='qstImg'>
							</a>
						</div>
						<div class='card-footer text-center'>
							<p class='card-text' id='difficulty'>★☆☆☆☆</p>
							<h5 class='card-title' id='qstName'><b>JLPT 필수문법</b></h5>
							<p class='card-text' id='qstClsName'>공부 > 언어 > JLPT</p>
						</div>
					</div>	
					<div class='card'>
						<div class='card-header border' id='qstProcess'>
							<span class='card-title'>수행중</span>
						</div>				
						<div class='card-body' id='card-body'>
							<a type='button' href='/kwonchaerin.selfdevelopment/quest/board' target='_self' class='card-img text-center'> 
								<img src='#' alt='영어 이미지' id='qstImg'></a>
						</div>
						<div class='card-footer text-center'>
							<p class='card-text' id='difficulty'>★★★★★</p>
							<h5 class='card-title' id='qstName'><b>토익 900점</b></h5>
							<p class='card-text' id='qstClsName'>공부 > 언어 > TOEIC</p>
						</div>
					</div>							
				</div>
			</div>
		</div>
		 
		<div class='row mt-3' id='paginationDiv'>
			<div class='col'>
				<nav>
					<ul class='pagination pagination-sm justify-content-center' id='qstPagination'>
						<li class='page-item'> 
							<a class='page-link' href='#' tabindex='-1'>
								<span class='text-dark'>&laquo;</span> 
							</a>
						</li>
						<li class='page-item'><a class='page-link border-0 text-dark' href='#'>1</a></li> 
						<li class='page-item'><a class='page-link border-0 text-dark' href='#'>2</a></li>
						<li class='page-item'><a class='page-link border-0 text-dark' href='#'>3</a></li>
						<li class='page-item'> 
							<a class='page-link' href='#'>
								<span class='text-dark'>&raquo;</span> 
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
		<p class='text-right text-muted' id='qstQty'>총 9건 검색결과</p>
		<hr>
	</div>	
</div>

<%@ include file='../include/footer.jsp' %>