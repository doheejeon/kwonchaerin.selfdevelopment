<title>갓겜:가이드</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#guideTitle{
	margin-top:1rem;
	font-size:20;
}

#banner{
	background-color: #e9e9e9;
	border:0.01rem solid lightgrey;
	height:20rem;
	width:100%;
	margin-top:3rem;
}

#article{
	margin-top:5rem;
}

#cards img{
	height:20rem;
	width:100%;
}

.card{
	height:27rem;
	width:20rem;
}

#content, #class{
	margin-top:7rem;
	margin-bottom:10rem;
}

#backGround{
	background-color:#e9e9e9;
	margin-top:9rem;
}

#topBtn {
	position: fixed;
	right: 3rem;
	bottom: 3rem;
	display:none;
	z-index:9;
	background-color: white;
	border-radius: 50%;
	border: 0;
}
</style>

<script>
$(function() {
	$(window).scroll(function(){
		if($(this).scrollTop() > 50) {
			$('#topBtn').fadeIn()}
		else { $('#topBtn').fadeOut();}
		});
	$('#topBtn').click(function(){
		$('html, body').animate({scrollTop:0},300);
	return false;});
});
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<a id='topBtn' class='titleColor h1 font-weight-bold' href='#'>
	<i class="fas fa-arrow-alt-circle-up"></i>
</a>

<div id='body'>
	<div class='container my-5'>
		<div class='row'>
			<div class='col'>
				<div id='guideTitle'>
					<h1 class='font-weight-bolder font-italic text-secondary'>GUIDE</h1>
					<hr>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<nav class='nav'>
					<a class='mr-3 titleColor' href='#godgameGuide'>갓겜이란?</a>|
					<a class='mr-3 ml-3 titleColor'href='#classGuide'>클래스 소개</a>|
					<a class='ml-3 titleColor' href='#contentsGuide'>콘텐츠 소개</a> 
				</nav>
			</div>
		</div>
	</div>
	<div class='container-fluid' name='banner'>
		<div class='row'>
			<img alt='배너이미지' id='banner'/>
			<a id='godgameGuide'/>
		</div>
	</div>
	<div class='container'>
		<div class='row' id='article'>
			<div class='col-5 text-right titleColor'>
				<h3>더 나은 내일의</h3>
				<h2><b>"나"</b>를 위해</h2>
			</div>
			<div class='col-1'>
			</div>							
			<div class='col'>
				<pre class='titleColor'>
갓겜은 갓생살기게임의 약어로, 오늘의 나로 안주하기 않고 
끊임없는 자기개발을 위한 게임입니다. 갓생살기게임은 
퀘스트를 진행하여 경험치를 쌓아 레벨을 올릴 수 있고,
일정수준 도달시마다 이메일을 통해 보상을 지급해드리고 있습니다.
또한 커뮤니티를 통해 자신이 달성한 퀘스트를 공유,
달성하지 못한 퀘스트를 피드백을 받는등의 즐길수 있는 
요소들이 있습니다. 이 게임을 자기개발의 출발점으로 삼아
더 나은 내일의 나를 만들 수 있는 여러분이 될수 있기를 바랍니다.
				</pre>
			</div>	
		</div>
		<div class='row py-5 mb-0' id='backGround'>
			<div class='container'>
				<div id='classGuide'>
					<div class='row mt-3 mb-5' id='cards'>
						<div class='col d-flex justify-content-center'>
							<div class='card'>
								<div class='card-body'>
									<img alt='공부도구 이미지'>
								</div>
								<div class='card-footer'>
									<a>•자격증 •언어<br>•취업 •독서</a>
								</div>
							</div>			
						</div>
						<div class='col'>
							<div class='row justify-content-center mt-5'>
								<h1 class='font-weight-bolder text-secondary'>
									CLASS
								</h1>
							</div>
							<div class='row d-flex justify-content-center mt-5'>
								<div class='card mt-5'>
									<div class='card-body'>
										<img alt='운동도구 이미지'>
									</div>
									<div class='card-footer'>
										<a>•익스트림 •헬스<br>•스포츠 •</a>
									</div>
								</div>	
							</div>		
						</div>
					</div>
				</div>
				<div id='contentsGuide'>
					<div class='row mt-5' id='cards'>
						<div class='col d-flex justify-content-center'>
							<div class='card'>
								<div class='card-body'>
									<img alt='퀘스트 이미지'>
								</div>
								<div class='card-footer text-center'>
									<a>Quest<br>퀘스트를 클리어해서 레벨을 올리세요</a>
								</div>
							</div>			
						</div>
						<div class='col'>
							<div class='row justify-content-center mt-5'>
								<h1 class='font-weight-bolder text-secondary'>
									CONTENTS
								</h1>
							</div>
							<div class='row d-flex justify-content-center mt-5'>
								<div class='card mt-5'>
									<div class='card-body'>
										<img alt='보상 이미지'>
									</div>
									<div class='card-footer text-center'>
										<a>Reward<br>목표를 달성해 보상을 받으세요</a>
									</div>
								</div>	
							</div>		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>