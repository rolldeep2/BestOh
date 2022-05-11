<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<script
	src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>


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
					<li><a href="http://localhost:8181/team4/notice/main" class="on">공지사항/이벤트</a></li>

				</ul>
			</div>
			<form method="post">
				<div class="right-contents">
					<div id="right-top-wrapInsert">
						<p id="right-contents-titleNotice">공지사항 작성</p>

						<select name="notice_category" class="noticeSelect">
							<option value="공지사항">공지사항</option>
							<option value="이벤트">이벤트</option>
							<option value="FAQ">FAQ</option>
						</select>

					</div>


					<div class="rightInput">




						<div>
							<input type="text" id="board_title" name="notice_title"
								class="rightInputTitle" placeholder="제목을 입력해주세요." required
								autofocus />
						</div>
						<div>
							<textarea name="notice_content" id="board_content"
								placeholder="내용을 입력해주세요."></textarea>
						</div>





						<div>
							<input type="submit" class="btn_create" value="등록" />
						</div>


					</div>
				</div>
			</form>





		</div>



	</div>






	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		CKEDITOR.replace('board_content');
	</script>
</body>
</html>