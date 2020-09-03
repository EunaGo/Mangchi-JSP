		var boardLoc = {};
		var listt = new Array();
		var userlist = new Array();


		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다t

		var geocoder = new kakao.maps.services.Geocoder();
		
		
		var userfunc = function(){

		geocoder.addressSearch(userAddr,function(result, status) {
				// 정상적으로 검색이 완료됐으면
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y,result[0].x);

					var marker1 = new daum.maps.Marker({
						map : map,
						position : coords
					});

					var requestMessage = '<div style="padding:5px; background-color:white; border: 1px solid #DDD;">요청자 위치</div>';

					var overlay1 = new daum.maps.CustomOverlay({
						content : requestMessage,
						map : map,
						position : marker1.getPosition()
					});

					var coordXY = document.getElementById("result"); // 검색 지도
																		// 경도위도
																		// 알아내기

					var html = "";

					 html += '<input  id="user_latitude" type="hidden" value="';
					 html += result[0].y;
					 html += ' "> ';
					 html += '<input id="user_longitude" type="hidden" value="';
					 html += result[0].x;
					 html += ' "> <br>';

					$("#result").append(html);
					
					userlist.push(result[0].y);
					userlist.push(result[0].x);

				}
				requestfunc();
			});

		
		};
		
		var counter = 0;
	    var total = locationList.length;
		
		var geocoder = new daum.maps.services.Geocoder();

		var requestfunc = function(){
			
			locationList.forEach(function(addr, index) {
				
					geocoder.addressSearch(addr, function(result, status) {
						
							var coords = new daum.maps.LatLng(
									result[0].y, result[0].x);
							
							counter++; // 비동기 콜백이 수행되었으면 하나 업 카운트
							var lat = result[0].y;
							var lon = result[0].x;
							
							boardLoc = {
								lat:lat,
								lon:lon,
								idx:index
							};
							
							listt.push(boardLoc);
							
						   if (total === counter) { // 모든 비동기 콜백이 수행되었다면
						        cal(); // 다음 로직으로 넘어갑니다.
					        }
								
				});
			}); // 포문끝
			
			
		};
		
		
		var distanceList = [];
		
		 function cal() {
			
   
				var linePath = [];
				var calDistance= new Array();
				
			    var sortingField = "idx";

			    listt.sort(function(a, b) { // 오름차순
			        return a[sortingField] - b[sortingField];
			    });
			    
			    console.log(listt);
			    var locPosition = new kakao.maps.LatLng(userlist[0], userlist[1]);
			    map.setCenter(locPosition);
			    

			    
		    for(var i=0;i<listt.length;i++){
		    	
		    	var na1 = new daum.maps.LatLng(listt[i].lat, listt[i].lon);
		    	var na2 = new daum.maps.LatLng(userlist[0], userlist[1])
		    	
					linePath.push(na1);
					linePath.push(na2);
		    }
		    
		    
		  for(var j=0; j<linePath.length; j++){
		    	
		    	
		    	if(j%2 == 0){
		    		

		    		calDistance.push(linePath[j]);
		    		calDistance.push(linePath[j+1]);
		    		

		    		var polyline = new kakao.maps.Polyline({
						path : calDistance, // 선을 구성하는 좌표배열 입니다
						strokeWeight : 5, // 선의 두께 입니다
						strokeColor : '#FFAE00', // 선의 색깔입니다
						strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에
												// 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});
		
					polyline.setMap(map);
		
					var distance = polyline.getLength();
					var distance = Math.round(distance);
		
					
		    		calDistance.pop(linePath[j]);
					calDistance.pop(linePath[j+1]);
					
					
					if(distance <=  10000){
						distanceList.push(distance);
					}	
		    	}
		    	
		    }// for문
		  
		  
		  var pageList = [];

		  
		  for(var a=0;a<allList.length;a++){
			 
			  allList[a].distance=distanceList[a];
		  }
		  
		  
		  var sortingField = "distance";
		  
		  allList.sort(function(a, b) { // 오름차순
			  return a[sortingField] - b[sortingField];
		  });
		  
		  
		  
		  //사용자가 정한 거리 만큼 리스트 출력
		  for(var a=0;a<allList.length;a++){
			
			  if(allList[a].distance != null){
			  
				  pageList.push(allList[a]);
			  }
			  
		  }
		  
		  //전체 리스트 값  : pageList 
		  //전체 리스트의 수 : pageList.length 
		  //한 페이지 당 표현 할 리스트 수 : requestCountPage
		  // 전체 페이지 수 : pageTotalCount
		  // 시작 점 : startRow
		  // 종료 : endRow
		  
		  
		  const  requestCountPage = 4; //한 페이지 당 표현 할 리스트 수 
		  var requestTotalCount = pageList.length; // 전체 리스트 개수 
		  
		  
		  //파라미터 값으로 가져와야함 
		  
		  
		 
		  var currentPageNumber=1; //현재 페이지 
		  
		  	var link = document.location.href; 

				
			var link = link.split('?');
			
			
			if(link.length != 1){
				
			  	var para = document.location.href.split("?"); 
				var para = para[1].split("="); 
				currentPageNumber = para[1];
			}
			
			
		  
		  //전체 페이지 수 구하기 (전체 리스트 개수 / 한페지 당 출력 할 값 )
		  var pageTotalCount = requestTotalCount / requestCountPage;
		  
		  
		  if (requestTotalCount % requestCountPage > 0) {
			  pageTotalCount++;
		  }
		  
		  var startRow = (currentPageNumber - 1) * requestCountPage;
		  
		  var endRow =  startRow + requestCountPage ;
		  
		  if(endRow > requestTotalCount){
			  endRow = requestTotalCount;
		  }
		  
		  function getContextPath(){
			    var offset=location.href.indexOf(location.host)+location.host.length;
			    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
			    return ctxPath;
			}

		  if(requestTotalCount > 0){
			  
			  
			  //한페이징 4개씩 출력하므로 4개 값이 출력된다 
			 for(var k=startRow;k<endRow;k++){
				 
				 
			  	var tr = $('<tr></tr>');
				 
				 $('#tab').append(tr);
				 
				 
				 tr.attr('id',''+pageList[k].req_idx+'');
				 
				 var contextPath = "${pageContext.contextPath}";
				 
				 var html = '';
				 html +='<td>'+pageList[k].writer_nick+'</td>';
				 html +='<td>';	
				 
				 
				 html += '<a href=" ';
				 html += getContextPath()+'/board/detailRequestInfo.do?req_idx='+pageList[k].req_idx+' " ';
				 html += '>';
				 
				 html += pageList[k].req_title;
				 html+= '</a>';
				
				 html +='</td>';
				 html +='<td>'+pageList[k].req_price+'</td>';
				 html +='<td>'+pageList[k].req_regdate+'</td>';
				 html +='<td>'+pageList[k].req_loc+'</td>';
				 html +='<td>'+pageList[k].req_text+'</td>';
				 html +='<td>'+pageList[k].req_readcnt+'</td>'; 
				 html +='<td>'+pageList[k].req_status+'</td>';
				 html +='<td>'+pageList[k].req_img+'</td>';
				 html +='<td>'+pageList[k].distance+'</td>';
			  
				 tr.append(html);
				 
			 }
			 
			 history.replaceState({}, null, location.pathname);
			 
			 
			 
		  }
		  else{
			  alert('등록된 게시물이 없습니다.');
		  }

		  
		  if(pageTotalCount > 0){
			  
				for(var m=1;m<=pageTotalCount;m++){		 
		
					var link = document.location.href; 
					
					var html = "";
					html +="<a ";
					html +='href="'+link+'?page='+m+'" ';
					html +=">";
					html +='['+m+']';
					html +='</a>';
					
					$('.paging').append(html);
					
					
				}	
		  }
		  

		 }
		 
		
			
		
var init= function(){
	
	userfunc();
};	
		
init();
