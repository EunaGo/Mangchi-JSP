<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>M A N G C H | 우리 동네 대여 서비스</title>
<title>게시글화면</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">
<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<style>
.req_img_view{
	width: 200px;
}
.title{
	text-align:center;
	line-height:50px;
	height: 50px;
	color: white;
	font-weight: bold;
	background-color: #455A64;
	margin: 2%;
	border-radius: 10px;
	width: 200px;
}
.contents{
	line-height:50px;
	height: 50px;
	color : black;
	background-color: #ECEFF1;
	padding-left: 15px;
	margin: 5px;
	border-radius: 10px;
}
.buttons{
	margin-left:25%;
	margin-top: 20px;
}
.selecComp{
	margin-left:10px;
}


</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br><br><br><br>

	<main>
	<div class="container">
	    <div class="row">
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">제목</div>	
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.req_title}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">요청자</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.writer_nick}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">헬퍼</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents" id="selectHelper"></div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">등록일시</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.req_regdate}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">반납일시</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents" id="return_date">${choiceRequest.req_returnDate}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">주소</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.req_loc}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">상세</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.req_text}</div>
	        </div>
	        
	         <div class="col-xs-3 col-lg-3">
	        	<div class="title">조회수</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">${choiceRequest.req_readcnt}</div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">상태</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents" id="status_req"></div>
	        </div>
	        
	        <div class="col-xs-3 col-lg-3">
	        	<div class="title">참고이미지</div>
	        </div>
	        <div class="col-xs-8 col-lg-8">
	        	<div class="contents">
		        	<c:if test="${not empty choiceRequest.req_img}">
					<img class="req_img_view" src="<c:url value="${choiceRequest.req_img}"/>"/>
					</c:if>
					<c:if test="${empty choiceRequest.req_img}">
					(사진없음)
					</c:if>
	        	</div>
	        </div>
		</div>
	    <div class="row">
	        <div class="col-sm-4 col-sm-offset-4 col-lg-4 col-lg-offset-4 buttons">
		        <button type="button" id="sendNote" class="btn btn-primary btn-lg">쪽지보내기</button>
				<button type="button" id="helpEnd" class="btn btn-success btn-lg">렌탈완료</button>
				<button type="button" id="delReq" class="btn btn-danger btn-lg">게시글삭제</button>
				
				
	        </div>
	    </div>
	    
		
	</div>
	
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	
	$(document).ready(function(){
		//현재 게시글을 통해 나에게 메세지 보낸 사람의 배열 
		var arr = new Array();
		//1595768227494
		//select 태그 동적생성
		var selectTag=$('<select></select>');
		selectTag.attr('name','helpers');
		selectTag.attr('id','helpers');
		$('#selectHelper').append(selectTag);
		selectTag.append('<option value="-1" id="wait">(대기중)</option>');
		<c:forEach items="${requestHelpers}" var="rh">
			arr.push({
				idx:"${rh.idx}",
				nick:"${rh.nick}"
			});
			var op= $('<option value="'+${rh.idx}+'" id="'+'${rh.nick}'+'">'+'${rh.nick}'+'</option>');
			selectTag.append(op);
		</c:forEach>
		$('#selectHelper').append('<button type="button" id="helper_selector_btn" class="btn btn-info btn-sm selecComp">선택완료</button>');
		
		//현재 사용자의 idx (비로그인일시 -1)
		const currUserIdx=${currUserIdx};
		//게시글 제목(리뷰)
		const title='${choiceRequest.req_title}';
		//게시글 인덱스
		const idx = ${choiceRequest.req_idx}; 
		//게시글의 글쓴이
		const writer = ${choiceRequest.req_writer};
		//게시글의 헬퍼
		const helper = ${choiceRequest.req_helper};
		//상태표시하는 td				
		const status_td = $('#status_req');
		//헬퍼표시하는 select value
		const helperVal=$('#helpers').val();
		//헬퍼 선택 완료 버튼
		const helperSelectBtn=$('#helper_selector_btn');
		//게시글의 상태		
		const helperStatus=${choiceRequest.req_status};
		//상세내용 "호출"시 
		//헬퍼상태에 따라 렌탈대기 렌탈중 렌탈완료
		//호출된 글의 status 입력
		//status에 따라 렌탈완료버튼 보이기
		if(helperStatus==0){
			status_td.text('렌탈대기');
			$('#return_date').text('(아직 렌탈 대기중입니다)');
			$('#helpEnd').hide();
		}else if(helperStatus==1){
			status_td.css('font-weight','bold');
			status_td.css('color','blue');
			$('#return_date').text('${choiceRequest.req_returnDate}');
			status_td.text('렌탈중');
			$('#helpEnd').show();
		}else if(helperStatus==2){
			status_td.css('color','green');
			status_td.css('font-weight','bold');
			status_td.text('렌탈완료');
			$('#return_date').text('${choiceRequest.req_returnDate}');
			$('#helpEnd').hide();
			$('#sendNote').hide();
			//렌탈 완료이면 셀렉트 태그 없애고 닉네임 입력
			for(var i=0;i<arr.length;i++){
				if(helper==arr[i].idx){
					$('#selectHelper').html(arr[i].nick);
				}
			}
		}
		
		//select태그 선택시켜놓기
		if(helperStatus!=0){
			for(var i=0;i<arr.length;i++){
				if(helper==arr[i].idx){
					$('#'+arr[i].nick).attr('selected','selected');
				}
			}
		}
		
		//로그인사용자와 해당 글의 글쓴이가 같은경우 다른경우 분기처리
		if(currUserIdx!=-1){
			if(currUserIdx==writer){
				console.log('같은');	
				$('#sendNote').hide();
				$('#delReq').show();
			}else{
				console.log('다른');	
				$('#helpEnd').hide();
				$('#delReq').hide();
				if(helper==0){
					$('#selectHelper').html('(아직 헬퍼가 없습니다)');
				}else{
					for(var i=0;i<arr.length;i++){
						if(helper==arr[i].idx){
							console.log(arr[i].nick);
							$('#selectHelper').html(arr[i].nick);
						}
					}
				}
			}
		}else{
			$('#helpEnd').hide();
			$('#delReq').hide();
			for(var i=0;i<arr.length;i++){
				if(helper==arr[i].idx){
					$('#selectHelper').html(arr[i].nick);
				}
			}
		}
		
		//헬퍼가 바뀌면 선택완료버튼 보이기
		//헬퍼가 바뀌면 선택이 완료되기 전에는 렌탈완료버튼 숨기기
		var changeHelper=0;
		console.log('헬퍼바뀜? :'+changeHelper);
		var val = $('#helpers').val();
		helperSelectBtn.hide(); //버튼은 기본 hide
		$('#helpers').on('change',function(){
			$('#helpEnd').hide();
			if(val == $(this).val() ){	
				helperSelectBtn.hide();
				$('#helpEnd').show();
				console.log('헬퍼'+changeHelper);
			}else{
				helperSelectBtn.show();				
				changeHelper=1;
				console.log('헬퍼'+changeHelper);
			}
		});
		
		//게시물삭제
		$('#delReq').on('click',function(){
			var action='<c:url value="/board/deleteRequest.do"/>';
			
			var form =$('<form></form>');
			form.attr('charset','utf-8');
			form.attr('method','post');
			form.attr('action',action);
			form.appendTo('body');
			
			var inputIdx =$('<input type="hidden" value="'+idx+'" name="req_idx">');
			form.append(inputIdx);
			form.submit();
		});
		
		//헬퍼 선택버튼 클릭 이벤트
		helperSelectBtn.on('click',function(){
			$.ajax({
				url: 'chooseHelper.do',
				type : 'post',
				data : {
					req_idx: idx,
					req_helper: $('#helpers').val(),
					complete: 0,
					req_term:'${choiceRequest.req_term}'
					},
				success : function(data){
					if(data==1){
						if(helperStatus==1&&changeHelper==1){
							alert('헬퍼를 변경합니다');
							location.reload();
						}else{
							alert('렌탈을 시작합니다');
							location.reload();
						}
					}else if(data==0){
						alert('대기중으로 전환합니다');
						location.reload();
					}
				}
			});
		});
				
		//렌탈 완료버튼클릭 이벤트
		//보낼 파라미터값 req_idx / req_title / req_helper
		$('#helpEnd').on('click',function(){
			$.ajax({
				url: 'chooseHelper.do',
				type : 'post',
				data : {
					req_idx: idx,
					req_helper: $('#helpers').val(),
					complete: 1
					},
				success : function(data){
					if(data==2){
						alert('렌탈을 완료합니다');
						var nick;
						for(var i=0;i<arr.length;i++){
							if(helper==arr[i].idx){
								nick=arr[i].nick;
							}
						}
						var action='<c:url value="/reviews/reviewForm.do"/>';
						
						var form =$('<form></form>');
						form.attr('charset','utf-8');
						form.attr('method','post');
						form.attr('action',action);
						form.appendTo('body');
						
						var inputIdx =$('<input type="hidden" value="'+idx+'" name="req_idx">');
						var inputHelper =$('<input type="hidden" value="'+helper+'" name="req_helper">');
						var inputTitle =$('<input type="hidden" value="'+title+'" name="req_title">');
						var inputNick =$('<input type="hidden" value="'+nick+'" name="helper_nick">');
						form.append(inputIdx).append(inputHelper).append(inputTitle).append(inputNick);
						form.submit();
					}else if(data==-1){
						alert('완료에 실패했습니다');
						location.reload();
					}
				}
			});
			
		});
		
		//내가 쓴글, 남이 쓴 글 구분
		//로그인한 사용자와 글쓴이가 같을 때
		
		
		//쪽지 보내기
		//족지 보내기 버튼 클릭 이벤트
		//form태그 만들어서 보냄
		$('#sendNote').on('click',function(){
			if(currUserIdx==-1){
				alert('쪽지보내기는 로그인 이후에 가능합니다');
				location.href='<c:url value="/member/loginForm.do"/>';
			}else{
				var action='<c:url value="/message/sendNote.do"/>';
				
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", action);
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "req_idx");
				hiddenField.setAttribute("value", idx);
				form.appendChild(hiddenField);
				
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "uid");
				hiddenField.setAttribute("value", writer);
				form.appendChild(hiddenField);
				document.body.appendChild(form);
				form.submit();
			}
		});
	});		
</script>

<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>

</body>
</html>
