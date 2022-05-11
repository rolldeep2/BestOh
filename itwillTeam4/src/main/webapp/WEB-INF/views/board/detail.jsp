<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

</head>
<body>
	<%@include file="../header.jsp"%>




	<div id="contentWrap">
		<div class="innerWrap">

			<div class="left-gnbDetail">
				<div class="profile-box">
					<p>
						<span>${signInUserId}</span>
					</p>
					<span>환영합니다.</span>
				</div>
				<ul class="comMenu">
					<li><a href="http://localhost:8181/team4/board?act=rlt">실시간 독서 모임 커뮤니티</a></li>
					<li><a href="http://localhost:8181/team4/board?act=my&MeetIdx=${userMeetIndex}">나의 독서 모임 커뮤니티</a></li>
					<li><a href="http://localhost:8181/team4/board">자유로운 서평</a></li>
					<li><a href="http://localhost:8181/team4/notice/main">공지사항/이벤트</a></li>

				</ul>
			</div>



			<div class="right-contentsDetail ">

				<div class="detailTop">
					<div class="detailTopWrap">
						<p class="detailTopA">서평</p>
						<p class="detailTopTitle">${board.board_title }</p>
						<p class="detailTopUser">${board.board_userid }
							<span>멤버</span>
						</p>
						<p class="detailTopDate">
							<fmt:formatDate value="${board.board_reg_date }" pattern="yyyy-MM-dd hh:mm:ss" />
						</p>
					</div>


				</div>
				<div class="detailContentWrap">
					<p class="detailContent">${board.board_content }</p>
					<div class="detailBookInfo">
						<img src="${board.board_book_img }" alt="bookImg">
						<div class="detailBookInfos">
							<div>
								<p class="text-overflow pMax">${board.board_book_title }</p>
								<span class="text-overflow spanMax">${board.board_book_authors } / ${board.board_book_pub} </span>
							</div>
						</div>
					</div>
				</div>

				<div class="boxFooter boxFooter2">
				<a href="../updateLike/${board.bno}?liker=${signInUserCode}">
					<div class="boxLike boxLike2">
						<img src="${pageContext.request.contextPath}/resources/img/like.png" alt="like" class="boxLikeImg">
						<p class="blc">&nbsp;${board.board_like_cnt }</p>
					</div>
				</a>
					<div class="boxReply boxReply2">
						<img src="${pageContext.request.contextPath}/resources/img/reply.png" alt="reply" class="boxReplyImg">
						<p id="blc1" class="blc">&nbsp;${board.board_reply_cnt  }</p>
					</div>

					<c:if test="${signInUserCode == board.board_usercode}">
						<!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
							
						<a href="../update/${board.bno}">
							<button class="btnUpdate">수정</button>
						</a>
						<a id="menu-delete" href="../delete/${board.bno}">
							<button class="btnDelete">삭제</button>
						</a>
					</c:if>

				</div>


				<div class="replyBox">
					<p id="blc2" class="replyCnt">댓글 ${board.board_reply_cnt }</p>

					<button id="btn_sort_like">좋아요순</button>
					<button id="btn_sort_reg">최신순</button>

					<div id="replies"></div>


					<input type="text" id="rtext1" name="rtext" class="replyInput" spellcheck="false" placeholder="댓글을 입력해주세요!" />
					<!--어드민 대신 ${signInUserId}-->
					<input type="hidden" id="userid" name="user_id" value='${signInUserId}' readonly="readonly" />
					<button class="btn_create">등록</button>
					<ul>

					</ul>
				</div>



			</div>
		</div>
	</div>






	<%@include file="../footer.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
  	$(document).ready(function(){
  		
  		$('#menu-delete').click(function(event){
  			event.preventDefault();
  			var result = confirm('정말 삭제할까요?');
  			if (result){
  				location = $(this).attr('href'); 
  				alert('삭제되었습니다.')
  			}
  		});
  		
	

		var cnt=${board.board_reply_cnt};
		var boardNo =${board.bno};
		var userCode=${signInUserCode};
		console.log(userCode);
		var sort = 'all';
		function getReplies(sort){
		$.getJSON('http://localhost:8181/team4/replies/'+sort+'/' + boardNo, function(respText) {
			$('#replies').empty();
			
			var list = '';
			$(respText).each(function(){
				
				
			var date = new Date(this.reply_reg_date); // JavaScript Date 객체 생성
			var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
        	list += '<div class="reply_item">'
        		+'<input type="hidden" id="rno" name="rno" value="'
      		   + this.rno
      		   + '" readonly />'
			   + '<p id="user_id" name="userid">'
      		   + this.user_id
      		   + '</p>'
     		   + '<p id="reg_date" name="regdate">'
     		   + dateStr
     		   + '</p>'
     		   + '<div class="rtextBox"><input type="text" class="reply_text" id="rtext'+this.rno+'" name="rtext" value="'
     		   + this.rtext
     		   +'" /></div>'
     		   +'<div class="replyLikeBox">'
     		   + '<img src="${pageContext.request.contextPath}/resources/img/like.png"'
     		   +'alt="like" class="boxLikeImg">'
     		   + '<span id="reply_like_cnt" name="replylikecnt">'
     		   + this.reply_like_cnt
     		   + '</span> </div>'
      		   + '<button class="reply_like replyI">좋아요</button>';
     		  if ( this.user_code == userCode
     				  ) {
          		list +='<button class="reply_update replyI">수정</button>'
          			  + '<button class="reply_delete replyI">삭제</button>';
          	}
     		   list+= '</div>';
     		  	   
     		   
			console.log("done");
			});
			
			
			
			
			
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
	$('.btn_create').click(function (event){
		var replyText=$('#rtext1').val();
		if(replyText==''){
			alert('댓글 내용을 입력하세요');
			$('#rtext1').focus();
			return;				
		}
		var replier=$('#userid').val();

		console.log(userCode);
		$.ajax({
			url: 'http://localhost:8181/team4/replies/',
			type: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			data: JSON.stringify({
				'bno': boardNo,
				'rtext': replyText,
				'user_id': replier,
				'user_code':userCode
			}),
			success: function (resp) {
				console.log(resp);
				cnt +=1;
				$('#rtext').val('');
				getReplies(sort);  
				$('#blc1').empty();
				$('#blc1').text("\u00a0"+cnt);
				$('#blc2').empty();
				$('#blc2').text("댓글\u00a0"+cnt);
				

			}
			
		});
		
		$('#rtext1').val('');
	});
	
	$('#replies').on('click', '.reply_item .reply_update', function () {
		
		var rno = $(this).prevAll('#rno').val();
		console.log(rno);
		var rtext = $('#rtext'+rno).val();
		console.log(rtext);
		
		$.ajax({
			url: 'http://localhost:8181/team4/replies/' + rno,
			type: 'PUT',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'PUT'
			},
			data: JSON.stringify({'rtext': rtext}),
			success: function () {
				alert(rno + ' 댓글 수정 성공!');
				getReplies(sort); // 댓글 목록 업데이트
			}
		});
	});
	
	$('#replies').on('click', '.reply_item .reply_delete', function (event) {
		var rno = $(this).prevAll('#rno').val();
		var result = confirm('댓글을 정말 삭제할까요?');
		if (result) { // 확인(Yes) 버튼을 클릭했을 때
			$.ajax({
				url: 'http://localhost:8181/team4/replies/' + rno,
				type: 'DELETE',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'DELETE'
				},
				success: function () {
					alert(rno + '댓글 삭제 성공!');
					cnt -= 1;
					getReplies(sort);
					$('#blc1').empty();
					$('#blc1').text("\u00a0"+cnt);
					$('#blc2').empty();
					$('#blc2').text("댓글\u00a0"+cnt);
					
				}
			});
		}
	});
	$("#replies").on('click','.reply_item .reply_like', function(event){
		var rno = $(this).prevAll('#rno').val();
		var result = confirm('좋아요를 누르시겠습니까?');
		var userCode=${signInUserCode};
		if (result){
			$.ajax({
			url: 'http://localhost:8181/team4/replies/'+rno,
			type: 'POST',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'POST'
			},
					data: JSON.stringify({'user_code':userCode}),
			  	
			success: function () {
				getReplies(sort); // 댓글 목록 업데이트
				alert('좋아요 성공!');
				},
			error: function(){
				alert('좋아요 실패!');
			}
			});
		}
	});
		});
	
	</script>
</body>
</html>