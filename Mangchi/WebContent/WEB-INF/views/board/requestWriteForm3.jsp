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
<!-- Custom styles for this template -->
<link href='<c:url value="/css/kwonjaejun.css"/>' rel="stylesheet">
<style>
.suround_only{
   width: 100px;
}
form{
   margin-top: 100px;
}
.upload-hidden{
   width: 1px; 
   height: 1px; 
   padding: 0; 
   margin: -1px; 
   overflow: hidden; 
   clip:rect(0,0,0,0); 
   border: 0;

}


.ip{
border: 1px solid #ced4da;
border-radius: .25rem;
background-color: #fff;
padding: .375rem .75rem;
font-weight: 400;
margin-bottom: 10px;
}


.helpName {
    display:none;
    font-size:90%;
   }

input.rq:valid {
  border : 3px solid #00FF00;
 
}


input:focus + .helpName {
    display:block;
   color:red;
   height:38px;
   width:240px;
   font-weight:bold;
   
   margin-left:40px;
   top:10px;
   text-align:center;
   line-height:40px;
   }
   /* 
form:invalid + .helpName {
    display:block;
   color:red;
   height:38px;
   width:240px;
   font-weight:bold;
   
   margin-left:40px;
   top:10px;
   text-align:center;
   line-height:40px;
   } */


input:required:invalid, input:focus:invalid {
    background-image: url(http://s27.postimg.org/ttonbaj5b/invalid.png);
    background-position: 260px center;
    background-repeat: no-repeat;
   }
   
input:required:valid {
    background-image: url(http://s14.postimg.org/gaechg2e5/valid.png);
    background-position: 254px center;
    background-repeat: no-repeat;
   }



</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
   <c:if test="${loginInfo==null}">
   <script>
      alert('글을 쓰려면 로그인 해주세요');
      
      location.href='<c:url value="/member/loginForm.do"/>';
   </script>
   </c:if>
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   <div>

      <main role="main" class="container">
         <form action="insertpost.do" method="post" id="form_write" enctype="multipart/form-data">
            <div class="write_form">
            
            <h2 style="font-weight: bold; margin-bottom: 4%;">대여 요청 글쓰기</h2>
               <div class="write_reqinfo req_title">
                  <label for="req_titleid" class="suround_only">제목</label>
                  <input type="text" name="req_title" id="req_titleid" class="ip rq" placeholder="(제목입력해주세요)" required/>
                   
               </div>
               <div class="write_reqinfo req_writer">
                  <label class="suround_only">요청자</label>
                  <input type="text" value="${loginInfo.nick}"  name="nickName" class="ip" style="border: hidden;" disabled="disabled">
                  <input type="hidden" value="${loginInfo.idx}" name="req_writer"/>
                  <%-- <c:if test="${loginInfo==null}">
                     <input type="text" value="짠가" name="nickName" readonly/>
                     <input type="hidden" value="2" name="req_writer"/>
                  </c:if> --%>
               </div>
               <div class="write_reqinfo req_price">
                  <label for="req_priceid" class="suround_only">금액</label>
                  <input type="text" name="req_price" id="req_priceid" placeholder="(금액)" class="ip rq" required/>
                   <span id="name-format" class="helpName">필수 항목입니다.</span>
               </div>
               <div class="write_reqinfo req_term">
                  <label for="req_termid" class="suround_only">반납날짜</label>
                  <input type="datetime-local" id="req_termid" value="xxx" min="yyy" max="zzz" name="req_term" class="ip rq" required/>
                  
               </div>
               <div class="write_reqinfo req_loc">
                  <label class="suround_only">받을주소</label>
                  <input type="text" id="sample5_address" class="ip rq" name="req_loc" value="${loginInfo.addr}" readonly placeholder="(주소검색으로 입력)">
                  <input type="button" onclick="sample5_execDaumPostcode()"  value="다른주소로 변경" ><br>
                  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
               </div>
               <div class="write_reqinfo req_img">
                  <label class="suround_only">참고 이미지</label>
                  <input type="file" name="req_img"/>
               </div>
               <!-- <div class="write_reqinfo req_img"> 
                  <input class="upload-name" value="파일선택" disabled="disabled"> 
                  <label for="ex_filename">업로드</label> 
                  <input type="file" id="ex_filename" class="upload-hidden">
               </div> -->

               <hr>
               <label class="suround_only">상세 내용</label>
               <textarea form="form_write" class="ip" name="req_text" maxlength="2000" style="width: 100%; height: 300px;"
                   placeholder="상세 내용"></textarea>
               <input type="button" id="button1" class="btn btn-sm btn-primary" onclick="button1_click();" value="버튼1" style="float: right; " />
               <input type="submit" class="btn btn-sm btn-primary" value="글쓰기 완료" style="float: right; margin-right: 10px;">
            </div>
            
         </form>
      </main>
   </div>
   
   <div style="margin-bottom: 5%;"></div>
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b991b264fa5727cb3e70e18b0cfb366&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<script>
    
    
   window.jQuery
         || document
               .write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
               
   //현재날짜로 설정하기
   $('input[type=datetime-local]').val(new Date().toISOString());
   
   function button1_click() {
      
   }
   
   $(document).ready(function(){ 
      
      var fileTarget = $('.filebox .upload-hidden'); 
      fileTarget.on('change', function(){ // 값이 변경되면 
         if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
         } else { // old IE 
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
         } 
         console.log(filename);
      // 추출한 파일명 삽입 
         $(this).siblings('.upload-name').val(filename); 
      }); 
   });

   
   //지도
   
   
   
   $('#req_priceid').keyup(function () {
       /* alert('This length is ' + $(this).val().length); */
       if($(this).val().length>=1){
         $('.helpName').hide();
      }else {
         $('.helpName').show();
      } 
   });
   
   /* $("#req_priceid").keypress(function() {
    if($(this).val().length > 1) {
       $('.helpName').hide();
    } else {
       $('.helpName').show();
    }
}); */
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
</html>

            <%-- <div class="write_div_wr" style="margin-top: 100px;">
               <div class="bo_w_tit write_div">
                  <label for="wr_subject" class="sound_only">제목</label> 
                  <input
                     type="text" name="req_title" value="" id="wr_subject" required
                     class="frm_input full_input required" placeholder="제목입력해주세요">
               </div>
               <div class="write_div">
                  <label for="wr_email" class="sound_only">요청자</label>
                  <input
                     type="email" name="req_" value="${loginInfo.uid}"
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
            </div> --%>