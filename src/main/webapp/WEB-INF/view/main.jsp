<title>갓겜즈 | 갓생살기 프로젝트</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='include/lib.jsp' %>

<style>
.card {
	height: 100%;
	width: 100%;
	cursor: pointer;
	width: 12rem;
}

.card-body div {
	height: 100%;
	width: 100%;
	position: relative;
}

.card-body div img {
	height: 100%;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
}

.card-body div h6 {
	position: absolute;
	top: 2rem; /* 나중에 0.2rem으로 바꿀 예정 */
	left: 0.3rem;
	z-index: 2;
}

#body table {
	height: 100%;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.5);
}

</style>

<%@ include file='include/header.jsp' %>
<%@ include file='include/gnb.jsp' %>

<div class='container d-flex justify-content-center' id='body'>
	<div class='row w-100 h-50 mt-5'>
		<div class='col mt-5'>
			<div class='row my-5'>
				<div class='col d-flex justify-content-end'>
					<div class='card p-0 m-0' onclick='questMainBtn()' title='현생으로 모험을 떠나보자!'>
						<div class='card-body p-0 m-0'>
							<div>
								<img src='#' class='card-img-top btn p-0 m-0' alt='퀘스트 이미지'>
								<h6 class='font-weight-bolder titleColor font-italic'>현생에서 레벨업!!!</h6>
							</div>
						</div>
						<div class='card-footer p-0 m-0 bg-secondary text-center'>
							<div class='align-self-center p-0 m-0'>
								<h4 class='text-light font-weight-bolder my-3 ml-1'>
									QUEST
									<i class="fas fa-play-circle"></i>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class='col d-flex justify-content-center'>
					<table class='table table-secondary table-sm text-nowrap'>
						<thead class='text-center py-0'>
							<tr class='py-0'>
								<td colspan='3' class='py-0'>
									<h4 class='font-weight-bolder my-3 mx-2'>RANKING</h4>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class='font-weight-bolder'>1</td>
								<td class='text-left'>
									<a href='/kwonchaerin.selfdevelopment/user/{해당유저코드}' class='titleColor'>짱짱맨</a>
								</td>
								<td>
									<span class='h6 badge badge-sm badge-secondary small'>LV</span>
									<span class='font-weight-bold p-0 text-align-center inline-block small'>90</span>
								</td>
							</tr>
							<tr>
								<td class='font-weight-bolder'>2</td>
								<td class='text-left'>
									<a href='/kwonchaerin.selfdevelopment/user/{해당유저코드} class='titleColor'>판다</a>
								</td>
								<td>
									<span class='h6 badge badge-sm badge-secondary small'>LV</span>
									<span class='font-weight-bold p-0 text-align-center inline-block small'>78</span>
								</td>
							</tr>
							<tr>
								<td class='font-weight-bolder'>3</td>
								<td class='text-left'>
									<a href='/kwonchaerin.selfdevelopment/user/{해당유저코드}' class='titleColor'>User</a>
								</td>
								<td>
									<span class='h6 badge badge-sm badge-secondary small'>LV</span>
									<span class='font-weight-bold p-0 text-align-center inline-block small'>69</span>
								</td>
							</tr>
							<tr>
								<td class='font-weight-bolder'>4</td>
								<td class='text-left'>
									<a href='/kwonchaerin.selfdevelopment/user/{해당유저코드}' class='titleColor'>마리오</a>
								</td>
								<td>
									<span class='h6 badge badge-sm badge-secondary small'>LV</span>
									<span class='font-weight-bold p-0 text-align-center inline-block small'>67</span>
								</td>
							</tr>
							<tr>
								<td class='font-weight-bolder'>5</td>
								<td class='text-left'>
									<a href='/kwonchaerin.selfdevelopment/user/{해당유저코드}' class='titleColor'>ZI존</a>
								</td>
								<td>
									<span class='h6 badge badge-sm badge-secondary small'>LV</span>
									<span class='font-weight-bold p-0 text-align-center inline-block small'>66</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class='col d-flex justify-content-start'>
					<div class='card p-0 m-0' onclick='couponMainBtn()' title='퀘스트를 깨면 어마어마한 보상이...!'>
						<div class='card-body p-0 m-0'>
							<div>
								<img src='#' class='card-img-top btn p-0 m-0' alt='골드와 쿠폰 이미지'>
								<h6 class='font-weight-bolder titleColor font-italic'>
									퀘스트를 깨고 경험치를 쌓아<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보상을 얻자!
								</h6>
							</div>
						</div>
						<div class='card-footer p-0 m-0 bg-secondary text-center'>
							<div class='align-self-center p-0 m-0'>
								<h4 class='text-light font-weight-bolder my-3 ml-1'>
									REWARD
									<i class="fas fa-play-circle"></i>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='include/footer.jsp' %>