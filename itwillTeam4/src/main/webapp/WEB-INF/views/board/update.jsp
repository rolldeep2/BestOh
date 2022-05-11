<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>





	<div class="bookModalBG">
		<div class="bookModal">
			<div id="bookModalClose" class="close">
				<img
					src="${pageContext.request.contextPath}/resources/img/close.png"
					alt="close">
			</div>

			<div class="book_info"></div>
			<div class="book_info2">



				<input type="text" id="board_book_title_fake"
					placeholder="책 제목을 입력해주세요."  value="${board.board_book_title}" required  /> <input type="button"
					id="btn_book_search" name="btn_book_search" value="검색" />
				<div id="bookSubmitBtn" class="bookSubmitBtn">
					<p>등록</p>
				</div>



				<div>
					<input type="text" id="board_book_authors_fake"  value="${board.board_book_authors}" 
						placeholder="저자" required readonly />
				</div>
				<div>
					<input type="text" id="board_book_pub_fake" value="${board.board_book_pub }"
						placeholder="출판사" required readonly />
				</div>
				<div>
					<input type="hidden" id="board_book_img_fake" value="${board.board_book_img}" required />
				</div>
				<div>
					<input type="text" id="board_book_tag_fake" value="${board.board_tag }" required />
				</div>


			</div>


			<div id="btns" class="btns">
				<input type="button" id="btn_prev" class="searchBtn1"> <input
					type="button" id="btn_next" class="searchBtn2">
			</div>
		</div>



	</div>


	<div id="contentWrap">
		<div class="innerWrap">

			<div class="left-gnb">
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

			<div class="right-contents">
				<div id="right-top-wrapInsert">
					<p id="right-contents-title">글 수정</p>

					<div>
						<input type="button" id="btn_book_modal" value="도서 검색">
					</div>
				</div>


				<div class="rightInput">

					<form action="../update/${board.bno}" method="post">

						<div style="display: none;">
							<input type="number" name="bno" value="${board.bno}" readonly>
						</div>

						<div>
							<input type="text" id="board_title" name="board_title"
								class="rightInputTitle" placeholder="제목을 입력해주세요." value="${board.board_title}" required
								autofocus />
						</div>
						<div>
							<textarea name="board_content" id="board_content"
								placeholder="내용을 입력해주세요.">${board.board_content}</textarea>
						</div>

						<div>
							<input type="hidden" id="board_usercode" name="board_usercode"
								value="${signInUserCode}" required readonly />
						</div>

						<div>
							<input type="hidden" name="board_userid" value="${board.board_userid}"
								required readonly />
						</div>


						<div id="book_info2">

							<input type="text" id="board_book_title" class="board_book_title"
								name="board_book_title"  value="${board.board_book_title}" required readonly />





							<div>
								<input type="hidden" id="board_book_authors"
									name="board_book_authors"  value="${board.board_book_authors}" required />
							</div>
							<div>
								<input type="hidden" id="board_book_pub" name="board_book_pub" value="${board.board_book_pub}"
									required />
							</div>
							<div>
								<input type="hidden" id="board_book_img" name="board_book_img"  value="${board.board_book_img}"
									required />
							</div>
							<div>
								<input type="hidden" id="board_book_tag" name="board_tag" value="${board.board_tag}" 
									value="태그" />
							</div>
							<div id="meetIdx">
								<input type="hidden" name="board_meet_idx"
									value="${userMeetIdx}" required readonly />
							</div>

						</div>
						<div>
							<input type="submit" class="btn_create" value="수정" />
						</div>

					</form>
				</div>
			</div>






		</div>



	</div>






	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		//$("#editor").prop('required',true); 

		$("#btn_book_modal").click(function() {
			$(".bookModalBG").fadeIn(300);
			$(".bookModal").fadeIn(300);

		});

		$("#bookModalClose").click(function() {

			$(".bookModalBG").fadeOut(300);
			$(".bookModal").fadeOut(300);

		});

		//var fakeToReal = document.getElementById("bookSubmitBtn");

		$(".bookSubmitBtn").click(function() {

			$(".bookModalBG").fadeOut(300);
			$(".bookModal").fadeOut(300);

			var fakeTitle = $("#board_book_title_fake").val();
			$("#board_book_title").val(fakeTitle);
			var fakeAuthors = $("#board_book_authors_fake").val();
			$("#board_book_authors").val(fakeAuthors);
			var fakePub = $("#board_book_pub_fake").val();
			$("#board_book_pub").val(fakePub);
			var fakeImg = $("#board_book_img_fake").val();
			$("#board_book_img").val(fakeImg);
			var fakeTag = $("#board_book_tag_fake").val();
			$("#board_book_tag").val(fakeTag);

		});

		var n = 0;
		var msg;
		$(document)
				.ready(
						function() {
							$('#btn_book_search')
									.click(
											function(event) {
												var title = $(
														'#board_book_title_fake')
														.val();
												$
														.ajax({
															method : "GET",
															url : "https://dapi.kakao.com/v3/search/book?target=title",
															data : {
																query : title,
																size : 50
															},
															headers : {
																Authorization : "KakaoAK 3f1fb761122afdd0796567178c84f3dc"
															},
															success : function(
																	info) {
																msg = info;
																console
																		.log(msg);
																if (msg.documents.lenght != 0) {
																	getBookInfo(n);
																} else {
																	alert("도서 검색 실패!")
																}
															}
														})
											});

						});
		$('#btn_prev').click(function() {
			if (n > 0) {
				n--;
				getBookInfo(n);
			}
		});
		$('#btn_next').click(function() {
			if (n < msg.documents.length - 1) {
				n++;
				getBookInfo(n);
			}
		});
		function getBookInfo(n) {
			var list_info = '';
			$('.book_info').empty();
			list_info += '<div>' + '<img src='+msg.documents[n].thumbnail+'/>'
					+ '</div>' + '</div>';
			$('.book_info').html(list_info);
			$('#board_book_title_fake').val(msg.documents[n].title);
			$('#board_book_authors_fake').val(msg.documents[n].authors);
			$('#board_book_pub_fake').val(msg.documents[n].publisher);
			$('#board_book_img_fake').val(msg.documents[n].thumbnail);
			$('.book_info2').show();
			$('#btns').show();
		};
	</script>
	<script>
		CKEDITOR.replace('board_content');
	</script>




</body>
</html>
