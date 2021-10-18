<title>갓겜:관리자 메인</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>
<style>
#usrUnregBtn,
#usrPlayerBtn {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<script>
$(document).ready(function() {
	$('.counter').each(function () {
		$(this).prop('Counter',0).animate({
			Counter: $(this).text()
		}, {
			duration: 800,
			easing: 'swing',
			step: function (now) {
			$(this).text(Math.ceil(now));
			}
		});
	});
});
</script>

<div class='h-100'>
	<%@ include file='include/header.jsp' %>

	<div id='underHead' class='row w-100'>
		
		<%@ include file='include/gnb.jsp' %>
		
		<div class='col' id='adminBody'>
			<div class='row'>
				<div class='col'>
					<div class='btn-group border w-100 mt-4 mb-2'>
			            <div class='btn bg-secondary text-light py-2 text-center'>
			            	<h1>
				                &nbsp;<i class="fas fa-user-plus small"></i><br>
				            	<span class='counter font-weight-bolder' id='noobUsrCnt'>34</span>
			            	</h1>
			            </div>
			            <div class='btn text-secondary py-2 text-center'>
				            <h1>
				                &nbsp;<i class="fas fa-user-minus small"></i><br>
				            	<span class='counter font-weight-bolder' id='outUsrCnt'>15</span>
			            	</h1>
			            </div>
			        </div>
		        </div>
			</div>
			<hr>
			<div class='row'>
				<div class='col mt-2' id='mainUsrJoin'>
					<h4 class='float-left titleColor'>
						가입 회원
						<a href='#'><i class="fas fa-redo-alt text-muted small"></i></a>
					</h4>
					<small>
						<a href='/kwonchaerin.selfdevelopment/admin/users' class='text-secondary float-right'>
							<br>전체보기 <i class="fas fa-chevron-right text-muted small"></i>
						</a>
					</small>
					<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
						<thead>
							<tr class='text-nowrap text-left'>
								<th id='checkCol'>
									<input type='checkbox' id='checkall1'>
								</th>
								<th width='20%'>포지션</th>
								<th width='40%'>ID</th>
								<th width='25%'>가입일</th>
							</tr>
						</thead>
						<tbody class='small text-left'>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='010'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>a1aa@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='009'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>bb24b@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='008'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>ccc14@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='007'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>dddd@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='006'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>adeee@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='005'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>1234fff@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='004'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>ggzer1g@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='003'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>hh12h@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='010'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>aaaweta@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check1' id='usrCode' value='009'>
								</td>
								<td id='position'>NOOB</td>
								<td id='usrId'>hbbb@email.com</td>
								<td id='regDtae'>21-10-18</td>
							</tr>
						</tbody>
					</table>
					<div class='row text-nowrap'>
						<div class='col d-flex justify-content-end'>
							<button class='btn btn-sm btn-secondary' id='usrPlayerBtn'>인증</button>
						</div>
					</div>
				</div>
				
				<div class='col mt-2' id='mainUsrUnreg'>
					<h4 class='float-left titleColor'>
						탈퇴 회원
						<a href='#'><i class="fas fa-redo-alt text-muted small"></i></a>
					</h4>
					<small>
						<a href='/kwonchaerin.selfdevelopment/admin/users' class='text-secondary float-right'>
							<br>전체보기 <i class="fas fa-chevron-right text-muted small"></i>
						</a>
					</small>
					<table class='table table-sm table-secondary table-hover border mb-0 text-center'>
						<thead>
							<tr class='text-nowrap text-left'>
								<th id='checkCol'>
									<input type='checkbox' id='checkall2'>
								</th>
								<th width='20%'>포지션</th>
								<th width='50%'>ID</th>
							</tr>
						</thead>
						<tbody class='small text-left'>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='010'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>aadfaa@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='009'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>bbasdb@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='008'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>cc1dsc@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='007'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>dadd@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='006'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>eebe@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='005'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>ff123f@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='004'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>agzsdgg@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='003'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>hhagdsh@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='010'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>aaaqx@email.com</td>
							</tr>
							<tr id='usrDetail'>
								<td id='checkCol'>
									<input type='checkbox' name='check2' id='usrCode' value='009'>
								</td>
								<td id='position'>&nbsp;&nbsp;OUT</td>
								<td id='usrId'>bbadsfb@email.com</td>
							</tr>
						</tbody>
					</table>
					<div class='row text-nowrap'>
						<div class='col d-flex justify-content-end'>
							<button class='btn btn-sm btn-secondary' id='usrUnregBtn'>삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>