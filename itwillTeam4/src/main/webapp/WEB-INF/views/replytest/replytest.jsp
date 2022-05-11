<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>reply test</h1>
	</div>
	<hr>
	<div>
		<input type="text" id="rtext" name="rtext" placeholder="댓글 입력" />
		<input type="text" id="userid" name="user_id" value="어드민" readonly="readonly" />
		<button id="btn_create_reply">댓글 작성 완료</button>
		<button id="btn_sort_like">좋아요순</button>
		<button id="btn_sort_reg">최신순</button>
	</div>
	<hr>
	<div id="replies"></div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var boardNo ='4';
			var sort = 'all';
			function getReplies(sort){

			$.getJSON('/team4/replies/'+sort+'/' + boardNo, function(respText) {
				$('#replies').empty();
				
				var list = '';
				$(respText).each(function(){
					
					
				var date = new Date(this.reply_reg_date); // JavaScript Date 객체 생성
				var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
            	list += '<div class="reply_item">'
         		   + '<input type="text" id="rno" name="rno" value="'
         		   + this.rno
         		   + '" readonly />'
         		   + '<input type="text" id="rtext" name="rtext" value="'
         		   + this.rtext
         		   +'" />'
         		   + '<input type="text" id="user_id" name="userid" value="'
         		   + this.user_id
         		   + '" readonly />'
         		   + '<input type="text" id="reply_like_cnt" name="replylikecnt" value="'
         		   + this.reply_like_cnt
         		   + '" readonly />'
         		   + '<input type="text" id="reg_date" name="regdate" value="'
         		   + dateStr
         		   + '" readonly />'
          		   + '<button class="reply_like">좋아요</button>'
         		  if (/*this.userid == '${signInUserId}'*/
         				  true
         				  ) { // 댓글 작성자 아이디와 로그인한 사용자 아이디가 같으면
              		list += '<button class="reply_update">수정</button>'
              			  + '<button class="reply_delete">삭제</button>';
              	}

         		   + '</div>';
				console.log("done");
				});
            // 완성된 HTML 문자열(list)를 div[id="replies"]의 하위 요소로 추가
            $('#replies').html(list);				
         });				
			}
		getReplies(sort);		
		
		$('#btn_sort_like').click(function(event){
			sort='like';
			getReplies(sort);
		});
		$('#btn_sort_reg').click(function(event){
			sort='all';
			getReplies(sort)	
		});
		$('#btn_create_reply').click(function (event){
			var replyText=$('#rtext').val();
			if(replyText==''){
				alert('댓글 내용을 입력하세요');
				$('#rtext').focus();
				return;				
			}
			var replier=$('#userid').val();
			
			// 댓글 insert 요청을 Ajax 방식으로 보냄.
    		$.ajax({
    			// 요청 주소
    			url: '/team4/replies',
    			// 요청 타입
    			type: 'POST',
    			// 요청 HTTP 헤더
    			headers: {
    				'Content-Type': 'application/json',
    				'X-HTTP-Method-Override': 'POST'
    			},
    			// 요청에 포함되는 데이터(JSON 문자열)
    			data: JSON.stringify({
    				'bno': boardNo,
    				'rtext': replyText,
    				'user_id': replier
    			}),
    			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
    			success: function (resp) {
    				console.log(resp);
    				$('#rtext').val('');
    				getReplies(sort);  // 댓글 목록 업데이트
    			}
    		});
		});
		// 수정, 삭제 버튼에 대한 이벤트 리스너는 버튼들이 만들어진 이후에 등록이 되어야 함!
    	$('#replies').on('click', '.reply_item .reply_update', function () {
    		// 수정 버튼이 포함된 div 요소에 포함된 rno와 rtext를 찾아서 Ajax PUT 요청을  보냄.
    		
    		// $(this): 클래스 속성이 reply_update인 버튼 요소.
    		var rno = $(this).prevAll('#rno').val();
    		var rtext = $(this).prevAll('#rtext').val();
    		
    		$.ajax({
    			// 요청 URL
    			url: '/team4/replies/' + rno,
    			// 요청 방식
    			type: 'PUT',
    			// 요청 패킷 헤더
    			headers: {
    				'Content-Type': 'application/json',
    				'X-HTTP-Method-Override': 'PUT'
    			},
    			// 요청 패킷 데이터
    			data: JSON.stringify({'rtext': rtext}),
    			// 성공 응답 콜백 함수
    			success: function () {
    				alert(rno + ' 댓글 수정 성공!');
    				getReplies(sort); // 댓글 목록 업데이트
    			}
    		});
    	});
    	
    	// 댓글 삭제 버튼
    	$('#replies').on('click', '.reply_item .reply_delete', function (event) {
    		var rno = $(this).prevAll('#rno').val();
    		var result = confirm(rno + '번 댓글을 정말 삭제할까요?');
    		if (result) { // 확인(Yes) 버튼을 클릭했을 때
    			$.ajax({
    				// 요청 URL
    				url: '/team4/replies/' + rno,
    				// 요청 타입
    				type: 'DELETE',
    				// 요청 헤더
    				headers: {
    					'Content-Type': 'application/json',
    					'X-HTTP-Method-Override': 'DELETE'
    				},
    				// 성공 응답 콜백 함수
    				success: function () {
    					alert(rno + '번 댓글 삭제 성공!');
    					getReplies(sort);
    				}
    			});
    		}
    	});
		
		
			});
	</script>
</body>
</html>