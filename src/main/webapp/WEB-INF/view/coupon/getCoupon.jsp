<title>갓겜:쿠폰</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<style>
#title {
	margin-top:3rem;
	font-size:20;
}

#modalImg {
	width: 100%;
	height: 10rem;
}

#modalX {
	float: right;
}

.modal-body {
	text-align: center;
}

.card {
	margin: 0.3rem;
}

.card-img {
	width: 100%;
	height: 100%;
}

.radius {
	border-radius: 0rem;
}

.card-body {
	padding: 0rem;
}
</style>

<script>
function getCpn() { // 나중에 실패도 추가 해야함
	$('#cpnDetailModal').modal('hide');
	$('#cpnSucModal').modal('show');
}
</script>

<%@ include file='../include/header.jsp' %>
<%@ include file='../include/gnb.jsp' %>

<div id='body'>
	<div class='container my-5'>
		<div class='row	my-5'>
			<div class='col'>
				<div id='title'>
					<h4><strong>쿠폰 목록</strong></h4><hr>
				</div>
				<p style='text-align: right;' id='gold'>보유 골드: <strong><a href='/kwonchaerin.selfdevelopment/user/mypage'><u>2골드</u></a></strong></p>
			</div>
		</div>
		
		<div class='row justify-content-center mt-4'>
			<div class='col card-deck'>
				<div class='card ml-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 서점 이미지' class='card-img' id='bookImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='bookDcPer1'>
										<h4 class='card-title mt-1'>&nbsp;서점&nbsp;10%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='bookLv1'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.10 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 서점 이미지' class='card-img' id='bookImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='bookDcPer2'>
										<h4 class='card-title mt-1'>&nbsp;서점&nbsp;10%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='bookLv2'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.20 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card mr-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 서점 이미지' class='card-img' id='bookImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='bookDcPer3'>
										<h4 class='card-title mt-1'>&nbsp;서점&nbsp;30%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='bookLv3'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.30 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
		
		<div class='row justify-content-center mt-3'>
			<div class='col card-deck'>
				<div class='card ml-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 인터넷강의 이미지' class='card-img' id='onlineImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='onlineDcPer1'>
										<h4 class='card-title mt-1'>&nbsp;강의&nbsp;10%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='onlineLv1'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.10 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 인터넷강의 이미지' class='card-img' id='onlineImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='onlineDcPer2'>
										<h4 class='card-title mt-1'>&nbsp;강의&nbsp;20%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='onlineLv2'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.20 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card mr-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 인터넷강의 이미지' class='card-img' id='onlineImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='onlineDcPer3'>
										<h4 class='card-title mt-1'>&nbsp;강의&nbsp;30%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='onlineLv3'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.30 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
		
		<div class='row justify-content-center mt-3'>
			<div class='col card-deck'>
				<div class='card ml-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 스포츠 이미지' class='card-img' id='sportsImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='sportsDcPer1'>
										<h4 class='card-title mt-1'>&nbsp;운동&nbsp;10%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='sportsLv1'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.10 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 스포츠 이미지' class='card-img' id='sportsImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='sportsDcPer2'>
										<h4 class='card-title mt-1'>&nbsp;운동&nbsp;20%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='sportsLv2'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.20 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card mr-0'>
					<div class='card-body'>
						<div class='row'>
							<div class='col pr-0'>
								<img src='#' alt='보상 스포츠 이미지' class='card-img' id='sportsImg'>
							</div>
							<div class='col'>
								<div class='row'>
									<div class='col pl-0' id='sportsDcPer3'>
										<h4 class='card-title mt-1'>&nbsp;운동&nbsp;30%</h4>
									</div>
								</div>
								<div class='row'>
									<div class='col pl-0' id='sportsLv3'>
										<p class='card-text text-muted'>&nbsp;&nbsp;&nbsp;Lv.30 이상</p>
										<button type="button" class="btn btn-secondary btn-block radius" data-toggle='modal' data-target='#cpnDetailModal'>받기</button>
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

<!-- Modal -->
<div id='cpnDetailModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='mr-3' id ='modalX'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body'>
				<div class='container'>
					<div class='row'>
						<div class='col'>
							<div class='row'>
								<img src='#' alt='인터넷 강의 사이트 로고' id='modalImg'>
							</div>
							<div class='row pr-0' id='detailDcPer'> <!-- $(#detailDcPer).html('<p>서점 10% 할인 쿠폰</p>') -->
								<p>인터넷 강의 20% 할인 쿠폰</p>
							</div>
						</div>
						<div class='col col-7' style='text-align: left;'>
							<strong>사용 방법</strong><br>
							<p><small>사이트에 쿠폰 코드를 등록한다.</small></p>
							<strong>혜택 내용</strong>
							<p><small>결제금액의 일정 퍼센트를 할인받는다.</small></p>
							<a href='#' class='btn btn-secondary btn-block' onclick="getCpn()">&nbsp;&nbsp;&nbsp;쿠폰 받기&nbsp;&nbsp;&nbsp;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 보상 성공 모달 -->
<div id='cpnSucModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<strong>쿠폰 받기 성공</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body'>
				<p>쿠폰을 받았습니다<br>마이페이지로 이동하시겠습니까?</p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-outline-secondary' data-dismiss='modal'>아니요</button>
				<a href='/kwonchaerin.selfdevelopment/user/mypage' class='btn btn-secondary' style='margin-right:10rem;'>&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</a>
			</div>
		</div>
	</div>
</div>