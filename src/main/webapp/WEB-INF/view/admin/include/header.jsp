<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<header class='container-fluid' id='adminHeader'>
	<div class='row'>
		<div class='text-center'>
			<a class='btn text-light' href='/kwonchaerin.selfdevelopment/admin'>
				<img src='#' id='logoImg' alt='어두운로고이미지'>
			</a>
		</div>
		<div class='col pt-4 pb-1'>
			<small class='text-left font-weight-bold'>ADMINISTRATOR</small>
		</div>
		<div class='col pt-4 pb-1 d-flex justify-content-end'> 
			<a href='/kwonchaerin.selfdevelopment/' id='logOutLink' onclick='logOut()' class='mr-3'>
				<small class='text-light'>Log Out</small>
			</a> 
			<a href='/kwonchaerin.selfdevelopment/' class='mr-3'> 
				<small class='text-light'>사이트로</small>
			</a>
		</div>
	</div>
</header>