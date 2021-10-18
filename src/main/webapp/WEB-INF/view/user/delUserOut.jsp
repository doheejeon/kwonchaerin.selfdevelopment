<title>갓겜:회원탈퇴</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../include/lib.jsp' %>

<script>
$(document).ready(function() {
	sessionStorage.clear();
})
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
				<div class='row my-5 mx-5'>
					<div class='col'>
						<h2 class='font-weight-bold text-center my-3'>회원 탈퇴가 완료되었습니다.</h2>
						<h5 class='text-center mt-4'>그동안 갓생살기게임즈와 함께 해주셔서 감사합니다.</h5>
					</div>
				</div>
				<div class='row mx-5 justify-content-center'>
					<a href='/kwonchaerin.selfdevelopment/' class='btn btn-secondary col-7 p-2 mb-4'>메 인</a>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

<%@ include file='../include/footer.jsp' %>