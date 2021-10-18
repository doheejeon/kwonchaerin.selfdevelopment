<title>갓겜:클래스관리</title>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ include file='../../include/lib.jsp' %>

<style>
#clsTitle{
	margin-top:2em;
}

#qstQty {
	font-size:10;
}

#modalBtn button {
	width: 5rem;
}

#modalTable {
	text-align:center;
	margin-top:1em;
}

#modalTable th{
	margin-top:1em;
}

#selector {
	font-size: 1rem;
	height: 2.5rem;
}

#searchCls button {
	height : 2.3rem;
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#searchCls input {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.table-sm th,
.table-sm td {
  padding: 0.5rem;
}

#addCls #clsNameIn {
	width: 25rem;
}

#addCls thead{
	height:2.5rem;
}

#addCls tbody{
	width: 25rem;
}

#addCls {
	border: 0.1rem secondary;
}

#addCls #addclsTop, #addclsMid, #addclsBot, #addClsTopBtn, #addOn, #addOff {
	border: 0;
}

#paginationDiv button {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
	width: 5rem;
	border-top: 0.1rem secondary;
}

label {
	width: 6rem;
}
<!-- -->
#fixModalBody {
	width:25rem;
}
#fixModalBody #fixSearch {
	text-align:center;
	width:25rem;
}

#fixModalBody td{
	width:4rem;
}

#fixModalBody tr{
	height:4rem;	
}
.col-10	{
	margin-left:auto;
}

</style>

<script>
// 추가화면에서 대분류에서 선택한 하위그룹만 보여주기		// 성공
function aAddOnOff(id) {
   if(id == "addOn") {
      document.all["addOn"].style.display = '';         
      document.all["addOff"].style.display = 'none';
   } else {
      document.all["addOn"].style.display = 'none';
      document.all["addOff"].style.display = '';
   }
}
// 수정화면에서 대분류에서 선택한 하위그룹만 보여주기		// 성공 하지만 수정창에서 checked를 했지만 둘다보임... 
function fFixOnOff(id) {
   if(id == "fixOn") {
      document.all["fixOn"].style.display = '';
      document.all["fixOff"].style.display = 'none';
   } else {
      document.all["fixOn"].style.display = 'none';
      document.all["fixOff"].style.display = '';
   }
}
//클래스 추가,수정 소분류 입력창에서 특수문자 금지		// 성공
var replaceId  = /[/]/gi;

$(document).ready(function(){
    $("#clsNameIn").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceId)) {
               x = x.replace(replaceId, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceId, ""));
    });
    
    $("#clsNameIn2").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceId)) {
               x = x.replace(replaceId, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceId, ""));
    });
});

//클래스 빼기 버튼 누를 시 1개 이상 체크했는 지 확인	// 
function delClsBtn() {
	if($('input[type="checkbox"]:checked').length > 0)
		modal("클래스", "삭제", "확인");
	else
		modal("클래스", "삭제", "실패3");
}

// 클래스 수정버튼 누를시 1개만 체크했는지 확인		// 성공
function fixClsBtn() {
	if($('input[type="checkbox"]:checked').length == 1 )  
		$('#fixProcModal').modal('show');
	else
		modal("클래스", "수정", "실패2");
}

//클래스 추가시 중복인지 아닌지 (팀장님 코드)		//실패		// 팀장님한테 물어봐야함  아까 정우님이랑 이야기 했는데 추가창에서 비슷한걸 보여주는거 보다 검색해서 동일한 클래스있으면 반려시키는게 나을거 같아보입니다. 
function clsChk() { 
	$('#clsNameChk').empty();
	cls = $('#clsNameIn').val();
	
	if(cls.length != 0) {
		if(cls.length < 2 || cls.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9a-zA-Z]/) < 0 || 6 < cls.length
				|| cls.search(/[~!@#$%^&*()_+|<>?:{}]/) != -1 || cls.search(/\s/) != -1) 
			$('#clsNameChk').append('<span class="text-danger">사용 불가</span>');
		else
			$('#clsNameChk').append('<span class="text-success">사용 가능</span>');
	}
}
// 추가버튼 클릭시 폼 제출하는거 만들어봤는데 확인해야함. // 관련코드 588line
/*$(document).ready(function() {
	$("#addClsBtn").click(function) {
		$("#addClsForm").submit();
	}
}*/
</script>

<div class='h-100'>
	<%@ include file='../include/header.jsp' %>

	<div id='underHead' class='row w-100'>
	
		<%@ include file='../include/gnb.jsp' %>
		
		<div class='col' id='adminBody'>
			<div class='row ml-1 mt-3'>
				<div class='col'>
					<div class='row' id='clsTitle'><!-- 페이지 상단 -->
						<div class='col d-flex justify-content-start '>
							<h4>클래스 조회</h4>
							<button type='button' class='btn' id='redo'>
								<i class="fas fa-redo"></i>
							</button>	
						</div>
						<p class='text-muted text-center mb-0 mr-3' id='clsQty'>총 40건</p>
					</div>
					<hr>
					<div class='row mt-1 justify-content-between'>
						<div class='col-5 mb-0'>
							<nav class='nav nav-tabs'>
								<a class='nav-link btn-outline-secondary active' data-toggle='tab' href='#allClsList'>전체</a>
								<a class='nav-link btn-outline-secondary' data-toggle='tab' href='#stdClsList'>공부</a>
								<a class='nav-link btn-outline-secondary' data-toggle='tab' href='#exrClsList'>운동</a>
							</nav>
						</div>
						<form class='col-5 mr-3 mb-0' id='searchCls' ><!--  검색  -->
							<div class='row float-right'>
								<input type='text' class='form-control w-75' maxlength='10'/> 
								<button type='button' class='btn btn-secondary'>검색</button>
							</div>
						</form>
					</div>
						
					<div class='row' id='clsTable'> 	<!-- 전체클래스 페이지 -->
						<div class='col'>
							<div class='tab-content'>
								<div class='tab-pane fade show active' id='allClsList'>
									<table class='table table-sm table-hover table-secondary mb-0 text-center border'>
										<thead>
											<tr>
								     			<th id='checkCol'><input type='checkbox' id='checkall1'/></th>
								     			<th>클래스ID</th>
								     			<th>대분류</th>
								     			<th>중분류</th>
								     			<th>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
								     			<th>사용퀘스트</th>
								     		</tr>
										</thead>
										<tbody>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-001</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>JAVA</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-002</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>언어</td>
								  				<td id='clsNameBot'>JLPT</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								 				<td id='clsId'>CL-003</td>
								  				<td id='clsNameTop'>운동</td>
								  				<td id='clsNameMid'>유산소</td>
								  				<td id='clsNameBot'>런닝</td>
								  				<td id='useQstCnt'>3
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-004</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>Java</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-005</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>C++</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-006</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>Kotlin</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-007</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>Java Script</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check1'></td>
								  				<td id='clsId'>CL-008</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>CSS</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  		</tbody>
									</table>
								</div>
								<div class='tab-pane fade' id='stdClsList'>		<!-- 공부클래스 페이지 -->
									<table class='table table-sm table-secondary table-hover text-center'>
										<thead>
											<tr>
								     			<th id='checkCol'><input type='checkbox' id='checkall2'/></th>
								     			<th>클래스ID</th>
								     			<th>대분류</th>
								     			<th>중분류</th>
								     			<th>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
								     			<th>사용퀘스트</th>
								     		</tr>
										</thead>
										<tbody>
								  			<tr id='clsDetail'>
								  				<td><input type='checkbox' name='check2'></td>
								  				<td id='clsId'>CL-001</td>
								  				<td id='clsNameTop'>공부</td>
								  				<td id='clsNameMid'>코딩</td>
								  				<td id='clsNameBot'>JAVA</td>
								  				<td id='useQstCnt'>5
								  			</tr>
								  		</tbody>
								  	</table>
								</div>
								<div class='tab-pane fade' id='exrClsList'>		<!-- 운동클래스 페이지 -->
									<table class='table table-sm table-secondary table-hover text-center'>
										<thead>
											<tr>
												<th id='checkCol'><input type='checkbox' id='checkall3'/></th>
									   			<th id='clsId'>클래스ID</th>
									     		<th id='clsNameTop'>대분류</th>
									     		<th id='clsNameMid'>중분류</th>
									     		<th id='clsNameBot'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
									     		<th id='useQstCnt'>사용퀘스트</th>
										    </tr>
										</thead>
										<tbody>
											<tr id='clsDetail'>
												<td><input type='checkbox' name='check3'></td>
								 				<td id='clsId'>CL-003</td>
								  				<td id='clsNameTop'>운동</td>
								  				<td id='clsNameMid'>유산소</td>
								  				<td id='clsNameBot'>런닝</td>
								  				<td id='useQstCnt'>3
								  			</tr>
								  		</tbody>
								  	</table>
								</div>
							</div>
						</div>
					</div>
					
					<div class='row' id='paginationDiv'>	<!-- 페이지 하단(이동,삭제,수정) -->
						<div class='col-2 d-flex justify-content-start h-25'>
							<button type='button' class='btn btn-secondary float-left' onclick='delClsBtn()'>삭제</button>
						</div>	
						<div class='col d-flex justify-content-center text-nowrap'>
							<ul class='pagination border-0'>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'><span>&laquo;</span></a></li>
								<li class='page-item'><a class='page-link border-0 text-dark active' href='#' >1</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>2</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>3</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>4</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'>5</a></li>
								<li class='page-item'><a class='page-link border-0 text-dark' href='#'><span>&raquo;</span></a></li>						
							</ul>
						</div>
						<div class='col-2 d-flex justify-content-end h-25'>
							<button type='button' class='btn btn-outline-secondary float-left' onclick='fixClsBtn()'>수정</button>					
						</div>
					</div>
				</div>
				
				<div class='col' id='addCls'>					<!-- 클래스 추가 -->
					<div class='row mb-0 ml-1' id='clsTitle'>
						<div class='d-flex justify-content-start '>
							<h4>클래스 추가</h4><hr>
						</div>
					</div>
					<hr>
					<form class='border' id='addClsForm'>
						<div class='row '>
							<div class='col'>
								<div class='row mt-3'>
									<div class='col-2 text-center'>대분류</div>
									<div class='col-8'>
										<label for='공부'>
											<input type="radio" class='form-check-input'
												name="addOnOffBtn" id="addOnOffBtn" value="1" onclick="aAddOnOff('addOn');">
											공부
										</label>
										<label for='운동'>
											<input type="radio" class='form-check-input'
												name="addOnOffBtn" id="addOnOffBtn" value="0" onclick="aAddOnOff('addOff');">
											운동
										</label>
									</div>
								</div>
								<div class='row mt-4'>
									<div class='col-2 text-center mt-2'>중분류</div>
									<div class='col-8'>
										<div id='addOn'>
											<label for='코딩'>
												<input type='radio' class='form-check-input' id='코딩' name='mid'>
												코딩
											</label>
											<label for='언어'>
												<input type='radio' class='form-check-input' id='언어' name='mid'>
												언어
											</label>
											<label for='자격증'>
												<input type='radio' class='form-check-input' id='자격증' name='mid'>
												자격증
											</label>
											<label for='수능'>
												<input type='radio' class='form-check-input' id='수능' name='mid'>
												수능
											</label>
										</div>
										<div id='addOff' >
											<label for='유산소'>
												<input type='radio' class='form-check-input' id='유산소' name='mid'>
												유산소
											</label>
											<label for='무산소'>
												<input type='radio' class='form-check-input' id='무산소' name='mid'>
												무산소
											</label>
											<label for='팀스포츠'>
												<input type='radio' class='form-check-input' id='팀스포츠' name='mid'>
												팀스포츠
											</label>
											<label for='유연성'>
												<input type='radio' class='form-check-input' id='유연성' name='mid'>
												유연성
											</label>
										</div>
									</div>
								</div>
								<div class='row mt-3'>
									<div class='col-2 my-3 text-center'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>
									<div class='col' onmousemove='clsNameInChk()'>
										<input type='text' class='form-control mt-2' id='clsNameIn'>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class='row'>	<!-- 추가버튼 -->
						<div class='col d-flex justify-content-end mr-2 mb-2'>
							<div>
								<button class='btn btn-secondary' id='addClsBtn' onclick='modal("클래스", "추가", "확인")'>
									<i class="fas fa-save"></i> 추가
								</button>
							</div>
						</div>
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>

		
<!-- 모달 -->
<div id='fixProcModal' class='modal fade' tabindex='-1'>		<!-- 수정모달 -->
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header' id='fixProcModalHeader'>
				<strong>클래스 수정</strong>
				<button type='button' class='close' data-dismiss='modal'>
					<span>x</span>
				</button>
			</div>
			<div class='modal-body' id='fixProcModalBody' >
				<form>
					<div class='row'>
						<div class='col'>
							<div class='row'>
								<div class='col-2 text-center'>대분류</div>
								<div class='col-10'>
									<label for='공부' class='float-left'>
										<input type="radio" class='form-check-input float-left'
											name="fixOnOffBtn" id="fixOnOffBtn" value="1" onclick="fFixOnOff('fixOn');" checked>
										공부
									</label>
									<label for='운동'>
										<input type="radio" class='form-check-input'
											name="fixOnOffBtn" id="fixOnOffBtn" value="0" onclick="fFixOnOff('fixOff');">
										운동
									</label>
								</div>
							</div>
							<div class='row text-center'>
								<div class='col-2 mt-3'>중분류</div>
								<div class='col-10' hidden='true'>
									<div id='fixOn'>
										<div class='row'>
											<div class='col-3'>
												<label for='코딩' class='float-left'>
													<input type='radio' class='form-check-input' id='코딩' name='mid'>
													코딩
												</label>
											</div>
											<div class='col-3'>
												<label for='언어'>
													<input type='radio' class='form-check-input' id='언어' name='mid'>
													언어
												</label>
											</div>
											<div class='col-3'>
												<label for='자격증'>
													<input type='radio' class='form-check-input' id='자격증' name='mid'>
													자격증
												</label>
											</div>
											<div>
												<label for='수능'>
													<input type='radio' class='form-check-input' id='수능' name='mid'>
													수능
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class='row text-center'>
								<div class='col-2 mt-3' hidden='true'>중분류</div>
								<div class='col-10' hidden='true'>
									<div id='fixOff' >
										<div class='row'>
											<div class='col-3'>
												<label for='유산소' class='float-left'>
													<input type='radio' class='form-check-input' id='유산소' name='mid'>
													유산소
												</label>
											</div>
											<div class='col-3'>
												<label for='무산소'>
													<input type='radio' class='form-check-input' id='무산소' name='mid'>
													무산소
												</label>											
											</div>
											<div class='col-3'>
												<label for='무산소'>
													<input type='radio' class='form-check-input' id='무산소' name='mid'>
													무산소
												</label>										
											</div>
											<div class='col-3'>
												<label for='팀스포츠'>
													<input type='radio' class='form-check-input' id='팀스포츠' name='mid'>
													팀스포츠
												</label>
											</div>
											<div class='col-3'>
												<label for='유연성' class='float-left'>
													<input type='radio' class='form-check-input' id='유연성' name='mid'>
													유연성
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='col-2 my-3'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>
								<div class='col' onmousemove='clsNameInChk()'>
									<input type='text' class='form-control mx-0 mt-3' id='clsNameIn'>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class='modal-footer justify-content-center' id='fixProcModalFooter'>
				<button class='btn btn-outline-secondary' onclick='modal("클래스", "수정", "중단")'> 취소 </button>
				<button class='btn btn-secondary' onclick='modal("클래스", "수정", "성공")'> 수정 </button>
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