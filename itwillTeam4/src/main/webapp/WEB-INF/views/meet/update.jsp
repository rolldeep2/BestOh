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



</head>
<body>
	<%@include file="../header.jsp"%>






	<form action="./update?meet_idx=${meet.meet_idx}" method="post">
		<input type="hidden" name="meet_idx" value="${meet.meet_idx}" />
		<div class="contentWrapMeet">

			<div class="innerWrapMeetFlex">
				<div class="leftDetail">

					<div class="leftDetailTop">

						<div class="leftDetailTop2">
							<input type="text" value="${meet.meet_name }" class="upName"
								name="meet_name"> <input type="submit" class="btn_con"
								value="완료">


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
							해당 모임은 [<span><select name="meet_theme" class="selectForm">
									<option value="책수다형">책수다형</option>
									<option value="독서토론형">독서토론형</option>
									<option value="덕후형">덕후형</option>
									<option value="생활습관 개선형">생활습관 개선형</option>
									<option value="낭독형">낭독형</option>
									<option value="챌린지형">챌린지형</option>
									<option value="스터디형">스터디형</option>
							</select></span>] 모임입니다.
						</p>



					</div>
					<div class="detailFormsWrap">
						<div class="detailForms">
							<h3>호스트</h3>
							<p style="margin-bottom:30px;">${meet.meet_host_name }</p>
						</div>

						<div class="detailForms">
							<h3>우리 모임을 소개합니다:)</h3>
							<textarea name="meet_intro" class="applyInputText upText"
								placeholder="개설할 모임에 대한 소개를 입력해주세요.(최대 500자)" maxlength="500"
								rows="5" required>${meet.meet_intro }</textarea>
						</div>

						<div class="detailForms">
							<h3>모임 장소</h3>
							<div class="selectRadioUp">
								<div class="radio">
									<label style="margin-right: 84px;"><input type="radio"
										name="meet_on_or_off" value="1" checked>온라인</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="meet_on_or_off"
										value="2">오프라인</label>
								</div>
							</div>
						</div>


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
													<span class="meetIntro text-overflow-line2">${host_meet.meet_intro }</span>


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



					<button class="rightApply ra3 fhrmdls" disabled>
						<h2>
							수정중
						</h2>
					</button>



				</div>
			</div>




		</div>

	</form>
	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		setInterval(function() {

			$(".wpqkf").delay(1500)
			$(".wpqkf").animate({
				"margin-left" : "-623px"
			}, 1000)
			$(".wpqkf").delay(1500)
			$(".wpqkf").animate({
				"margin-left" : "-1246px"
			}, 1000)
			$(".wpqkf").delay(1500)
			$(".wpqkf").animate({
				"margin-left" : "0px"
			}, 1000)

		}, 2500)

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
		
		
		
	</script>
</body>
</html>