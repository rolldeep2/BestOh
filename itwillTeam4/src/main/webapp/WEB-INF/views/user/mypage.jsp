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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css"
	integrity="sha256-jLWPhwkAHq1rpueZOKALBno3eKP3m4IMB131kGhAlRQ="
	crossorigin="anonymous">

<link href="${pageContext.request.contextPath}/resources/css/user.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/board.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/meet.css"
	rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">

</head>
<body>
	<%@include file="../header.jsp"%>

	<div class="mypageWrap">


		<div class="mypageWrapTop">
			<p class="mypageHello">안녕하세요.</p>
			<p class="mypageName">
				${signInUserId}<span>멤버</span>
			</p>
			<form class="topForm" action="./userupdate" method="get">
				<input type="submit" class="mypageOption" value="수정">
		</div>


		<div class="mypageTap">

			<ul id="tapui">
				<li id="tapli1" class=" myon">캘린더</li>
				<li id="tapli2">내 커뮤니티</li>
				<li id="tapli3">내 최근 작성글</li>

			</ul>
		</div>
		<div class="mypageConWrap">

			<div id="mypageCon1">
				<div class="calendarWrap">
					<div id='calendar'></div>
				</div>
			</div>
			<div id="mypageCon2">
				<div>



					<ul class="myInfoWrap">
						<c:forEach begin="0" end="9" step="1" var="meet"
							items="${meetList }">
							<li class="ehofk2"><a
								href="http://localhost:8181/team4/meet/detail?meet_idx=${meet.meet_idx }">
									<div class="info">
										<div class="info1">
											<span class="meetTitle text-overflow note-title">${meet.meet_name }</span>
											<span class="meetThemeDetail">${meet.meet_theme }</span>
										</div>
										<div class="info2">
											<span class="name">${meet.meet_host_name }</span> <span
												class="meetMember"> ${meet.meet_join_num } 명 참여중</span>
										</div>
										<span class="meetIntro text-overflow-line2">${meet.meet_intro }</span>


									</div>
									<div class="infoImgBoxMy ">
										<img src="${meet.meet_book_img }" alt="com01" class="infoImg">
									</div>

							</a></li>

						</c:forEach>
					</ul>



				</div>

				<div style="display: none">
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>테마</th>
								<th>호스트이름</th>
								<th>최대 인원 수</th>
								<th>현재 참여인원</th>
								<th>달력</th>
							</tr>
							</theads>
						<tbody>
							<c:forEach var="meet" items="${meetList}" varStatus="status">
								<tr>
									<td>${meet.meet_idx}</td>
									<td><a href="./detail?meet_idx=${meet.meet_idx}">${meet.meet_name}</a>
									</td>
									<td>${meet.meet_theme}</td>
									<td>${meet.meet_host_name}</td>
									<td>${meet.meet_member_num }</td>
									<td>${meet.meet_join_num}</td>
								</tr>
								<input type="hidden" id="when${status.count}"
									value="${meet.meet_when}">
								<p class="forCount">${status.count}</p>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<div id="mypageCon3">


				<c:forEach begin="0" end="5" step="1" var="board"
					items="${boardList }">
					<div class="box Mybox">
						<a href="http://localhost:8181/team4/board/detail/${board.bno }">
							<div class="boxHeader">
								<div class="bookImg">
									<img src="${board.board_book_img}" alt="">
									<p class="bookImgTitle text-overflow">${board.board_book_title }</p>
								</div>
								<div class="postInfo">
									<p class="postTitle">${board.board_title }</p>
									<p class="postUser">${board.board_userid }<span> 멤버</span>
									</p>

									<p class="postRegDate">
										<fmt:formatDate value="${board.board_reg_date }"
											pattern="yyyy-MM-dd" />
									</p>
									<p class="postContent text-overflow-line3">${board.board_content}</p>
								</div>
							</div>
						</a>
						<div class="boxFooter">
							<div class="boxLike">
								<img
									src="${pageContext.request.contextPath}/resources/img/like.png"
									alt="like" class="boxLikeImg">
								<p>&nbsp;${board.board_like_cnt }</p>
							</div>
							<div class="boxReply">
								<img
									src="${pageContext.request.contextPath}/resources/img/reply.png"
									alt="reply" class="boxReplyImg">
								<p>&nbsp;${board.board_reply_cnt  }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div>
			<p>${userNn }</p>
		</div>
	</div>



	<%@include file="../footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		$(document).ready(function() {
		});

		$("#tapli1").click(function() {

			$(this).addClass("myon")
			$("#tapli2").removeClass("myon");
			$("#tapli3").removeClass("myon");
			$("#mypageCon1").show();
			$("#mypageCon2").hide();
			$("#mypageCon3").hide();

		});

		$("#tapli2").click(function() {

			$(this).addClass("myon")
			$("#tapli1").removeClass("myon");
			$("#tapli3").removeClass("myon");
			$("#mypageCon1").hide();
			$("#mypageCon2").show();
			$("#mypageCon3").hide();

		});
		$("#tapli3").click(function() {

			$(this).addClass("myon")
			$("#tapli1").removeClass("myon");
			$("#tapli2").removeClass("myon");
			$("#mypageCon1").hide();
			$("#mypageCon2").hide();
			$("#mypageCon3").show();

		});
		var n = $('.forCount').last().text();
		var cal;

		var calinfo = {
			googleCalendarApiKey : 'AIzaSyCqdOcfDe17hpHOJGaqgcph2bbc5-p5eyk',
			initialView : 'dayGridMonth',
			initialDate : '2022-03-01',
			selectable : false,
			editable : false,
			displayEventTime : false,
			locale : "ko",
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			eventSources : [

			]
		}
		for (var i = 1; i <= n; i++) {
			cal = $('#when' + i).val().replaceAll("'", "\"");
			console.log(cal);
			var obj = JSON.parse(cal);
			console.log(obj);
			calinfo.eventSources.push(obj);
		}

		document.addEventListener('DOMContentLoaded', function() {

			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, calinfo);

			calendar.render();
		});
	</script>
</body>
</html>
