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
<title>대여 요청 글쓰기</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link href='<c:url value="/css/kwonjaejun.css"/>' rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div>

		<main role="main" class="container">

			<form action="">
				<div class="write_div_wr" style="margin-top: 100px;">

					<div class="bo_w_tit write_div">
						<label for="wr_subject" class="sound_only">제목</label> 
						<input
							type="text" name="wr_subject" value="" id="wr_subject" required
							class="frm_input full_input required" placeholder="제목입력해주세요">
					</div>
					<div class="write_div">
						<label for="wr_email" class="sound_only">요청자</label>
						<input
							type="email" name="wr_email" value="${loginInfo.uid}"
							id="wr_email" class="frm_input full_input email" maxlength="100"
							readonly>
					</div>
					<div class="write_div" style="display: none">
						<label for="wr_express" class="sound_only">배송방법</label> 
						<input
							type="text" name="wr_express" value="" id="wr_express"
							class="frm_input full_input" maxlength="100"
							placeholder="택배 또는 직거래">
					</div>
					<div class="bo_w_tit write_div">
						<label for="wr_price" class="sound_only">금액</label> 
						<input
							type="text" name="wr_price" value="" id="wr_price" required
							class="frm_input required" placeholder="금액"
							onkeyup="inputNumberFormat(this)">

						<p class="price_option" style="display: block">
							<label class="wr_price_op"> ( 1일 기준 )</label>
						</p>

					</div>

					<div class="bo_w_tit share_imgup"
						style="height: 100%; text-align: right; border: 1px solid #ccc; border-radius: 5px; margin: 12px 20px;">

						<!-- 이미지 업로드 -->
						<span id="img_txt"
							style="float: left; color: #777; padding-left: 5px">
							이미지 업로드
						</span>

						<div style="display: block; margin-left: 5px; height: 100%;">
							<span class="file_add"> 
								<input
									type="file" name="bf_file[]" id="bf_file_1" onchange="readURL(this,'0')"
									class="frm_file" style="display: none">
								<label
									for="bf_file_1" id="bf_file_label_1"
									style="background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px; margin-top:3px; line-height: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;
								</label>

							</span>


							<div style="position: relative">
								<a onclick="resetInputFile(0)" id="blah_del_0"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah0"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_2"
								onchange="readURL(this,'1')" class="frm_file"
								style="display: none"> <label for="bf_file_2"
								id="bf_file_label_2"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(1)" id="blah_del_1"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah1"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_3"
								onchange="readURL(this,'2')" class="frm_file"
								style="display: none"> <label for="bf_file_3"
								id="bf_file_label_3"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(2)" id="blah_del_2"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah2"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_4"
								onchange="readURL(this,'3')" class="frm_file"
								style="display: none"> <label for="bf_file_4"
								id="bf_file_label_4"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(3)" id="blah_del_3"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah3"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_5"
								onchange="readURL(this,'4')" class="frm_file"
								style="display: none"> <label for="bf_file_5"
								id="bf_file_label_5"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(4)" id="blah_del_4"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah4"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_6"
								onchange="readURL(this,'5')" class="frm_file"
								style="display: none"> <label for="bf_file_6"
								id="bf_file_label_6"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(5)" id="blah_del_5"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah5"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_7"
								onchange="readURL(this,'6')" class="frm_file"
								style="display: none"> <label for="bf_file_7"
								id="bf_file_label_7"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(6)" id="blah_del_6"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah6"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_8"
								onchange="readURL(this,'7')" class="frm_file"
								style="display: none"> <label for="bf_file_8"
								id="bf_file_label_8"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(7)" id="blah_del_7"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah7"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_9"
								onchange="readURL(this,'8')" class="frm_file"
								style="display: none"> <label for="bf_file_9"
								id="bf_file_label_9"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(8)" id="blah_del_8"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah8"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




							<input type="file" name="bf_file[]" id="bf_file_10"
								onchange="readURL(this,'9')" class="frm_file"
								style="display: none"> <label for="bf_file_10"
								id="bf_file_label_10"
								style="display: none; background-image: url('https://shareforyou.co.kr/theme/basic/img/camera.png'); background-size: 100% 100%; padding: 6px 6px; line-height: 25px;">&nbsp&nbsp&nbsp&nbsp
							</label> </span>


							<div style="position: relative">
								<a onclick="resetInputFile(9)" id="blah_del_9"
									style="display: none; position: absolute; top: 5px; right: 5px; padding: 5px; border: 1px solid #c13d2f; color: #c13d2f; text-align: center; border-radius: 5px; font-weight: bold;">
									삭제 <span style="color: #c13d2f;">X</span>
								</a> <img id="blah9"
									style="width: 100%; display: none; padding: 5px">
								<!--이미지-->
							</div>




						</div>
						<!-- 이미지 업로드 끝 -->

					</div>
					<div class="write_div write_div2"
						style="padding: 20px 0 20px 0; border-top: 1px solid #ddd;">
						<label for="wr_content" class="sound_only">상세내용</label>
						<!-- <span class="sound_only">웹에디터 시작</span> -->
						<textarea id="wr_content" name="wr_content" class=""
							maxlength="65536" style="width: 100%; height: 300px"
							placeholder="상세 내용"></textarea>
						<!-- <span class="sound_only">웹 에디터 끝</span> -->
						<!-- 비밀글 -->
						<input type="hidden" id="addr_input_type" value=""> <span
							class="wrtie_secret" style="display: none"> <input
							type="checkbox" id="secret" name="secret" value="secret"><label
							for="secret">비밀글로 등록하기</label>
						</span>
					</div>
				</div>
			</form>
		</main>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
</html>
