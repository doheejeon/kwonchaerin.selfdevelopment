<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<div class='text-nowrap' id='adminGnb'>
	<div class='col'>
		<div id='sideMenu' class='accordian mt-3'>
			<div>
				<div id='heading1' class='card-header'>
					<h2 class='mb-0'>
						<button type='button' class='btn btn-block text-left text-light' data-toggle='collapse' data-target='#body1'>회원</button>
					</h2>
				</div>
				<div id='body1' class='collapse' data-parent='#sideMenu'>
					<div class='card-body'>
						<ul class='hyphen text-light'>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/users'>회원</a>
							</li>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/users/mail'>자동 메일</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id='heading2' class='card-header'>
					<h2 class='mb-0'>
						<button type='button' class='btn btn-block text-left text-light' data-toggle='collapse' data-target='#body2'>클래스</button>
					</h2>
				</div>
				<div id='body2' class='collapse' data-parent='#sideMenu'>
					<div class='card-body'>
						<ul class='hyphen text-light'>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/classes'>클래스</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id='heading3' class='card-header'>
					<h2 class='mb-0'>
						<button type='button' class='btn btn-block text-left text-light'
							data-toggle='collapse' data-target='#body3'>콘텐츠</button>
					</h2>
				</div>
				<div id='body3' class='collapse' data-parent='#sideMenu'>
					<div class='card-body'>
						<ul class='hyphen text-light'>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/quests'>퀘스트</a>
							</li>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/coupons'>쿠폰상점</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id='heading4' class='card-header'>
					<h2 class='mb-0'>
						<button type='button' class='btn btn-block text-left text-light' data-toggle='collapse' data-target='#body4'>커뮤니티</button>
					</h2>
				</div>
				<div id='body4' class='collapse' data-parent='#sideMenu'>
					<div class='card-body'>
						<ul class='hyphen text-light'>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/postsAndComments'>게시글</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id='heading6' class='card-header'>
					<h2 class='mb-0'>
						<button type='button' class='btn btn-block text-left text-light' data-toggle='collapse' data-target='#body6'>홈페이지</button>
					</h2>
				</div>
				<div id='body6' class='collapse' data-parent='#sideMenu'>
					<div class='card-body'>
						<ul class='hyphen text-light'>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/guide'>약관</a>
							</li>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/logos'>로고 & 배너</a>
							</li>
							<li>
								<a href='/kwonchaerin.selfdevelopment/admin/log'>로그</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>