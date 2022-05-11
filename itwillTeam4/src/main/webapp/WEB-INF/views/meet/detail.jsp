<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<link href="${pageContext.request.contextPath}/resources/css/board.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/meet.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	type="text/css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


</head>
<body>
	<%@include file="../header.jsp"%>

	<fmt:formatNumber value="${signInUserCode }" type="number" var="uc" />




	<div class="back"
		style="position: absolute; width: 15px; top: 228px; left: 320px;">
		<a href="http://localhost:8181/team4/board?act=rlt"> <img
			src="${pageContext.request.contextPath}/resources/img/greenArrow2.png"
			alt="back" />
		</a>
	</div>
	<div class="contentWrapMeet">

		<div class="innerWrapMeetFlex">
			<div class="leftDetail">

				<div class="leftDetailTop">

					<div class="leftDetailTop1">
						<h2>${meet.meet_name }</h2>
						<c:if test="${signInUserCode == meet.meet_host}">
							<a href="./update?meet_idx=${meet.meet_idx}">
								<div class="btn_con">수정</div>
							</a>
						</c:if>

					</div>
					<div class="meetETCDetail">
						<span class="themeDetail"> ${meet.meet_theme }</span>
						<c:if test="${meet.meet_on_or_off == 1}">
							<span class="meetOnOffDetail"> #온라인모임 </span>
						</c:if>


						<c:if test="${meet.meet_on_or_off == 2}">
							<span class="meetOnOffDetail"> #오프라인모임 </span>
						</c:if>
					</div>
				</div>

				<div class="detailFrame">

					<div class="frameInfo">
						<h2 class="frameTitle text-overflow-line2">${meet.meet_book_title }</h2>
						<h3 class="frameAuthors">${meet.meet_book_authors }</h3>
						<h4 class="framePub">${meet.meet_book_pub }</h4>

					</div>
					<div class="frameImgBox">


						<img src="${meet.meet_book_img }" alt="book">
					</div>
				</div>
				<div class="themeintro">
					<p class="themeintro1">
						해당 모임은 [<span>${meet.meet_theme }</span>] 모임입니다.
					</p>
					<c:choose>

						<c:when test="${meet.meet_theme eq '독서토론형'}">
							<p class="themeintro2">독서토론형 모임은 몇 개의 토론 주제를 뽑아 심도 깊은 토론을 하는
								모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '책수다형'}">
							<p class="themeintro2">책수다형 모임은 호스트와 멤버들이 책을 가지고 형식과 제한 없이
								자유롭게 생각을 나누는 모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '생활습관 개선형'}">
							<p class="themeintro2">생활습관 개선형 모임은 책의 도움을 받아 생활 습관을 바꾸는
								모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '챌린지형'}">
							<p class="themeintro2">챌린지형 모임은 책과 관련된 특별한 미션과 과제가 주어지는
								모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '스터디형'}">
							<p class="themeintro2">스터디형 모임은 책 한권을 선정하여 멤버들과 함께 책의 내용을
								공부하는 모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '낭독형'}">
							<p class="themeintro2">낭독형 모임은 호스트와 멤버들이 책을 같이 소리내어 읽으며 공부하는
								모임입니다.</p>
						</c:when>
						<c:when test="${meet.meet_theme eq '덕후형'}">
							<p class="themeintro2">덕후형 모임은 작가나 작품을 선정하여 멤버들과 함께 깊이 있게
								탐독하는 모임입니다.</p>
						</c:when>

					</c:choose>


				</div>
				<div class="detailFormsWrap">
					<div class="detailForms">
						<h3>호스트</h3>
						<p>${meet.meet_host_name }</p>
					</div>

					<div class="detailForms">
						<h3>우리 모임을 소개합니다:)</h3>
						<p>${meet.meet_intro }</p>
					</div>

					<div class="detailForms">
						<h3>모임 장소</h3>
						<c:if test="${meet.meet_on_or_off == 1}">
							<span class="meetOnOffDetail2"> 온라인 </span>
						</c:if>


						<c:if test="${meet.meet_on_or_off == 2}">
							<span class="meetOnOffDetail2"> 오프라인 </span>
						</c:if>
					</div>

					<div class="detailForms">
						<div
							style="display: flex; align-items: center; justify-content: flex-start;">
							<h3>모임 서평</h3>

							<c:if test="${fn:contains(meet.meet_member_code, uc) }">
								<div id="writeImg"
									style="width: 45px !important; height: 45px !important; margin-left: 30px;">
									<a
										href="http://localhost:8181/team4/board/insert?MeetIdx=${meet.meet_idx }&bookImg=${meet.meet_book_img}&bookTitle=${meet.meet_book_title}&bookAuthors=${meet.meet_book_authors}&bookPub=${meet.meet_book_pub}">
										<img
										src="${pageContext.request.contextPath}/resources/img/write.png"
										alt="write">
									</a>
								</div>
							</c:if>
						</div>

						<div class="detailBoard" id="carouselWrap">

							<div id="carouselExampleInterval" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" style="display: flex !important;">

									<c:forEach begin="0" end="9" step="1" var="board"
										items="${boardlist }">
										<div class="detailboardWrap carousel-item"
											data-interval="3000">
											<a
												href="http://localhost:8181/team4/board/detail/${board.bno }">
												<div class="detailBoardFrame">

													<div class="detailBoardInfo">
														<div class="text-overflow"
															style="display: flex; align-items: center;">
															<p class="postTitle"
																style="margin-right: 20px; max-width: 300px !important;">${board.board_title }</p>
															<p class="postRegDate detailBoardUser">
																<fmt:formatDate value="${board.board_reg_date }"
																	pattern="yyyy-MM-dd hh:mm:ss" />
															</p>
														</div>

														<p class="postUser detailBoardUser">${board.board_userid }<span>
																멤버</span>
														</p>


														<p class="postContent text-overflow-line3 detailBoardCon"
															style="max-width: 380px;">${board.board_content}</p>
													</div>
												</div>
											</a>

										</div>
									</c:forEach>
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
					</div>


				</div>



				<div>



					<div class="detailForms noBorder">
						<h3>호스트의 다른 모임</h3>


						<div class="swiper mySwiper2">



							<ul class="swiper-wrapper wpqkf">
								<c:forEach begin="0" end="9" step="1" var="host_meet"
									items="${meetlist }">
									<li class="ehofk swiper-slide"><a
										href="http://localhost:8181/team4/meet/detail?meet_idx=${host_meet.meet_idx }">
											<div class="info">
												<div class="info1">
													<span class="meetTitle text-overflow note-title">${host_meet.meet_name }</span>
													<span class="meetThemeDetail">${host_meet.meet_theme }</span>
												</div>
												<div class="info2">
													<span class="name">${host_meet.meet_host_name }</span> <span
														class="meetMember"> ${host_meet.meet_join_num } 명
														참여중</span>
												</div>
												<span class="meetIntro text-overflow-line2"
													style="max-width: 300px;">${host_meet.meet_intro }</span>


											</div>
											<div class="infoImgBoxDetail ">
												<img src="${host_meet.meet_book_img }" alt="com01"
													class="infoImg">
											</div>

									</a></li>

								</c:forEach>
							</ul>
							<div class="swiper-pagination"></div>



						</div>
					</div>


				</div>


			</div>

			<div class="rightDetail">

				<div class="rightInfo">
					<div>
						<p>호스트</p>
						<span>${meet.meet_host_name }</span>
					</div>
					<div>
						<p>함께 읽을 책</p>
						<span class="text-overflow">${meet.meet_book_title }</span>
					</div>

					<div>
						<p>현재 모임인원</p>
						<span id="now">${meet.meet_join_num}명</span>
					</div>
					<div>
						<p>모임정원</p>
						<span id="max">${meet.meet_member_num }명</span>
					</div>


				</div>





				<c:choose>


					<c:when test="${empty signInUserCode}">
						<button class="rightApply ra3 fhrmdls">
							<h2>
								<a href="./updateLike/${meet.meet_idx}?joiner=${signInUserCode}">모임가입하기</a>
							</h2>
						</button>

					</c:when>
					<c:when test="${signInUserCode eq meet.meet_host}">
						<button class="rightApply ra2">
							<h2>
								<a href="./delete?meet_idx=${meet.meet_idx }" class="meetDelete">모임삭제하기</a>
							</h2>
						</button>

					</c:when>

					<c:when test="${fn:contains(meet.meet_member_code, uc) }">
						<button class="rightApply ra1">
							<h2>
								<a href="./updateLike/${meet.meet_idx}?joiner=${signInUserCode}">모임탈퇴하기</a>
							</h2>
						</button>

					</c:when>



					<c:otherwise>
						<button class="rightApply ra3" id="disable">
							<h2>
								<a href="./updateLike/${meet.meet_idx}?joiner=${signInUserCode}">모임가입하기</a>
							</h2>
						</button>
					</c:otherwise>
				</c:choose>

			</div>
		</div>




	</div>

	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		setInterval(function() {

			$(".wpqkf").delay(3000)
			$(".wpqkf").animate({
				"margin-left" : "-623px"
			}, 500)
			$(".wpqkf").delay(3000)
			$(".wpqkf").animate({
				"margin-left" : "-1246px"
			}, 500)
			$(".wpqkf").delay(3000)
			$(".wpqkf").animate({
				"margin-left" : "0px"
			},500)

		}, 0)

		$('.meetDelete').click(function(event) {
			event.preventDefault();
			var result = confirm('모임을 정말 삭제할까요?');
			if (result) {
				location = $(this).attr('href');
				alert('삭제되었습니다.')
			}
		});

		
		$(".fhrmdls").click(function(){
			event.preventDefault();
			alert("로그인이 필요합니다.")
			
			
		});
		
		$(document).ready(function(){
			
			if (${meet.meet_join_num } == ${meet.meet_member_num }) {
					$("#disable").css({
						"opacity" : "0.5"
					});
				$("#disable").prop("disabled",true);
				$("#disable a").click(function() {
					
						event.preventDefault();
						alert("모임의 정원이 다 찼습니다.")
						
					});
				
			}
			
			
			
			
		});
		
		$(".carousel-item").eq(0).addClass("active");
		
	</script>

</body>
</html>