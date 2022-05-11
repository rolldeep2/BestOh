<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>

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
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>
<body>


	<%@include file="header.jsp"%>
	<div class="container-fluid" id="wrap1" style="margin-bottom: 30px;">

		<div id="carouselWrap" class="caWrap1">
			<div id="carouselExampleInterval" class="carousel slide caEI1"
				data-ride="carousel">
				<div class="carousel-inner ci1">
					<div class="carousel-item active" data-interval="3000">
						<a href="http://localhost:8181/team4/meet/detail?meet_idx=37">
							<img
							src="${pageContext.request.contextPath}/resources/img/slide1.png"
							class="d-block w-100" alt="...">
						</a>
					</div>
					<div class="carousel-item" data-interval="3000">
						<a href="http://localhost:8181/team4/meet/detail?meet_idx=40">
							<img
							src="${pageContext.request.contextPath}/resources/img/slide2.png"
							class="d-block w-100" alt="...">
						</a>
					</div>
					<div class="carousel-item" data-interval="3000">
						<a href="http://localhost:8181/team4/notice/detail/103"> <img
							src="${pageContext.request.contextPath}/resources/img/slide3.png"
							class="d-block w-100" alt="...">
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-target="#carouselExampleInterval" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-target="#carouselExampleInterval" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</button>
			</div>
		</div>

	</div>


	<div id="wrap2">
		<div id="wrap2_1">
			<h2>
				Weekly <span>책오 픽!</span>
			</h2>
			<img src="${pageContext.request.contextPath}/resources/img/pick.png"
				alt="pick">
		</div>
		<h3>베스트 서평</h3>




		<div class="swiper mySwiper">

			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-wrapper">


				<c:forEach begin="0" end="5" step="1" var="board2"
					items="${boardList2 }">
					<div class="swiper-slide">
						<a href="http://localhost:8181/team4/board/detail/${board2.bno }">
							<div class="a">
								<div class="a_a">
									<p class="text-overflow-line5">${board2.board_content }</p>
								</div>
								<div class="a_b">
									<p class="a_bUser">${board2.board_userid }</p>
									<p class="a_bTitle text-overflow">${board2.board_title }</p>
								</div>
							</div>
						</a>
					</div>

				</c:forEach>
			</div>

			<div class="swiper-pagination"></div>
		</div>

	</div>
	<div id="wrap3" class="content">
		<div class="wrap3List" id="wrap3_1">
			<p class="wrap3Title">최근 등록 자유로운 서평</p>

			<ul>

				<c:forEach var="board" items="${boardList }" begin="0" end="2"
					step="1">

					<li><a
						href="http://localhost:8181/team4/board/detail/${board.bno }">
							<div>
								<p class="text-overflow note-title">${board.board_title }</p>
								<p class="text-overflow-line3 note-content">${board.board_content }</p>
								<p class="writer">${board.board_userid }</p>

							</div>
					</a></li>
				</c:forEach>


			</ul>

			<div class="more-btn-box">
				<a href="http://localhost:8181/team4/board">
					<div id="more-btn-box">
						<span>더보기</span> <img
							src="${pageContext.request.contextPath}/resources/img/arrow.png"
							alt="ar">

					</div>
				</a>
			</div>
		</div>

		<div class="wrap3List" id="wrap3_2">
			<p class="wrap3Title" id="wrap3Title2">지금 가장 인기 있는 독서 모임</p>
			<img src="${pageContext.request.contextPath}/resources/img/hot.png"
				alt="hot" id="wrap3img1">

			<ul>

				<c:forEach begin="0" end="2" step="1" var="meet"
					items="${meetList }">
					<li><a
						href="http://localhost:8181/team4/meet/detail?meet_idx=${meet.meet_idx }">
							<div class="info">
								<div class="info1">
									<span class="meetTitle text-overflow note-title">${meet.meet_name }</span>
									<span class="meetTheme">${meet.meet_theme }</span>
								</div>
								<div class="info2">
									<span class="name">${meet.meet_host_name }</span> <span
										class="meetMember"> ${meet.meet_join_num } 명 참여중</span>
								</div>
								<span class="meetIntro text-overflow-line2">${meet.meet_intro }</span>


							</div>
							<div class="infoImgBox">
								<img src="${meet.meet_book_img }" alt="com01" class="infoImg">
							</div>

					</a></li>

				</c:forEach>


			</ul>

			<div class="more-btn-box">
				<a href="http://localhost:8181/team4/board?act=rlt">
					<div id="more-btn-box">
						<span>더보기</span> <img
							src="${pageContext.request.contextPath}/resources/img/arrow.png"
							alt="ar">

					</div>
				</a>
			</div>
		</div>

	</div>

	<div id="wrap4" class="content">

		<div id="wrap4Con">

			<div id="wrap4Con_1">
				<div class="wrap4ConTitle">
					<a
						href="http://localhost:8181/team4/notice/main?act=%EC%9D%B4%EB%B2%A4%ED%8A%B8"><span>이벤트</span></a>
					<img
						src="${pageContext.request.contextPath}/resources/img/greenArrow1.png"
						alt="garr1" class="greenArrow">
				</div>

				<a
					href="http://localhost:8181/team4/notice/detail/${event.notice_idx }">
					<div class="wrap4ConCon">
						<img
							src="${pageContext.request.contextPath}/resources/img/event.png"
							alt="event" id="eventImg">
						<div id="eventText">
							<p>${event.notice_title}</p>
							<fmt:formatDate value="${event.notice_reg_date }"
								pattern="yyyy-MM-dd" />
						</div>
					</div>
				</a>

			</div>

			<div id="wrap4Con_2">
				<div class="wrap4ConTitle">
					<a
						href="http://localhost:8181/team4/notice/main?act=%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD"><span>공지사항</span></a>
					<img
						src="${pageContext.request.contextPath}/resources/img/greenArrow1.png"
						alt="garr1" class="greenArrow">
				</div>

				<div class="wrap4ConCon2">
					<ul>
						<c:forEach var="notice" items="${noticeList}" begin="0" end="1"
							step="1">

							<li class="noticeLi" id="noticeLi1">
								<p class="text-overflow noticeTitle">
									<a
										href="http://localhost:8181/team4/notice/detail/${notice.notice_idx }">${notice.notice_title }</a>
								</p>
								<p>
									<fmt:formatDate value="${notice.notice_reg_date }"
										pattern="yyyy-MM-dd" />
								</p>
							</li>
						</c:forEach>


					</ul>


				</div>

			</div>


		</div>

	</div>


	<%@include file="footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			spaceBetween : 3,
			slidesPerGroup : 3,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});

		window.addEventListener("wheel", function(e) {
			e.preventDefault();
		}, {
			passive : false
		});

		var $html = $("html");

		var page = 1;

		var lastPage = $(".content").length;

		$html.animate({
			scrolltop : 0
		}, 10);

		$(window).on("wheel", function(e) {
			if ($html.is(":animated"))
				return;

			if (e.originalEvent.deltaY > 0) {
				if (page == lastPage)
					return;

				page++;
			} else if (e.originalEvent.deltaY < 0) {
				if (page == 1)
					return;

				page--;
			}

			var posTop = (page - 1) * $(window).height();

			$html.animate({
				scrollTop : posTop
			});
		});
		window.onload = function() {
			setTimeout(function() {
				scrollTo(0, 0);
			}, 100);
		}
	</script>
</body>
</html>