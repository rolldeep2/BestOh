<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css"
	integrity="sha256-jLWPhwkAHq1rpueZOKALBno3eKP3m4IMB131kGhAlRQ="
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/meet.css"
	type="text/css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">



</head>
<body>
	<%@include file="../header.jsp"%>

	<div class="contentWrapMeet2">
		<div class="innerWrapMeet">


			<div class="rightInputTop">

				<h2>독서 모임 찾기</h2>
			</div>
			<div class="applyInputFind">

				<form id="searchform" action="./find" method="post">
					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>온라인/오프라인</p>
						</div>

						<div class="selectRadio">
							<div class="radio">
								<label style="margin-right: 84px; padding-left: 13px;"><input
									type="radio" name="search1" id="S-12" value="1">온라인</label>
							</div>
							<div class="radio">
								<label><input type="radio" id="S-13" name="search1"
									value="2">오프라인</label>
							</div>
						</div>
					</div>

					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>독서 모임 테마</p>
						</div>
						<div class="inputFormsRight themeSel radio">
							<input type="radio" name="search2[]" id="S-14" value="독서토론형">
							<div class="radio-box">
								<label for="S-14">독서토론형</label>
							</div>

							<input type="radio" name="search2[]" id="S-15" value="책수다형">
							<div class="radio-box">
								<label for="S-15">책수다형</label>
							</div>

							<input type="radio" name="search2[]" id="S-16" value="덕후형">
							<div class="radio-box">
								<label for="S-16">덕후형</label>
							</div>

							<input type="radio" name="search2[]" id="S-17" value="스터디형">
							<div class="radio-box">
								<label for="S-17">스터디형</label>
							</div>

							<input type="radio" name="search2[]" id="S-18" value="생활습관 개선형">
							<div class="radio-box">
								<label for="S-18">생활습관 개선형</label>
							</div>

							<input type="radio" name="search2[]" id="S-19" value="낭독형">
							<div class="radio-box">
								<label for="S-19">낭독형</label>
							</div>

							<input type="radio" name="search2[]" id="S-20" value="챌린지형">
							<div class="radio-box">
								<label for="S-20">챌린지형</label>
							</div>
						</div>
					</div>

					<div class="applyInputForms">

						<div class="inputFormsLeft ">
							<p>도서명</p>
						</div>
						<div class="inputFormsRight">
							<input type="text" name="search3" id="S-21" placeholder="책 제목" />
						</div>
					</div>







					<div>
						<input type="submit" class="btn_search" value="찾기" />
					</div>
				</form>

			</div>
			<div class="meetWrap meetWrap2">
				<ul class="meetUl">

					<c:forEach var="meet" items="${meetList}" varStatus="status">
						<li><a
							href="http://localhost:8181/team4/meet/detail?meet_idx=${meet.meet_idx }">
								<div class="infoReal">
									<div class="infoReal1">
										<span class="meetTitle text-overflow note-title">${meet.meet_name }</span>
										<span class="meetThemeReal">${meet.meet_theme }</span>
										<div class="meetETC">

											<c:if test="${meet.meet_on_or_off == 1}">
												<span class="meetOnOff"> #온라인모임 </span>
											</c:if>
											<input type="hidden" id="when${status.count}"
												value="${meet.meet_when}">
											<p class="forCount" style="display:none">${status.count}</p>

											<c:if test="${meet.meet_on_or_off == 2}">
												<span class="meetOnOff"> #오프라인모임 </span>
											</c:if>

										</div>

									</div>
									<div class="infoReal2">
										<span class="name">${meet.meet_host_name }</span> <span
											class="meetMember"> ${meet.meet_join_num } 명 참여중</span>
									</div>
									<span class="meetIntro text-overflow-line2">${meet.meet_intro }</span>


								</div>
								<div class="infoImgBoxReal">
									<img src="${meet.meet_book_img }" alt="bookimg" class="infoImg">
								</div>

						</a></li>

					</c:forEach>








				</ul>

			</div>





		</div>
		<div class="calendarWrap calendarWrap2">
			<div id='calendar'></div>
		</div>
	</div>







	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
	<script>
		var n = $('.forCount').last().text();
		var cal;

		var calinfo = {
			googleCalendarApiKey : 'AIzaSyCqdOcfDe17hpHOJGaqgcph2bbc5-p5eyk',
			initialView : 'dayGridMonth',
			initialDate : '2022-03-01',
			selectable : true,
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