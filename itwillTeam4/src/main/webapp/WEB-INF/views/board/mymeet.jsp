<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
</head>
<body>
	<%@include file="../header.jsp"%>

	<div id="contentWrapFree" style="min-height: 3300px!important;">
		<div class="innerWrapFree" style="height: 3323px!important;">

			<div class="left-gnbFree">
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

			<div class="right-contentsFree">
				<div id="right-top-wrapReal">
					<div style="display: flex; justify-content: space-between;">
						<p id="right-contents-titleMymeet">나의 독서 모임 커뮤니티</p>

					</div>
					<div class="meetWrap">
						<ul class="meetUl">

							<c:forEach var="meet" items="${meetList}">
								<li><a href="http://localhost:8181/team4/meet/detail?meet_idx=${meet.meet_idx }">
										<div class="infoReal">
											<div class="infoReal1">
												<span class="meetTitle text-overflow note-title">${meet.meet_name }</span> <span class="meetThemeReal">${meet.meet_theme }</span>
												<div class="meetETC">

													<c:if test="${meet.meet_on_or_off == 1}">
														<span class="meetOnOff"> #온라인모임 </span>
													</c:if>


													<c:if test="${meet.meet_on_or_off == 2}">
														<span class="meetOnOff"> #오프라인모임 </span>
													</c:if>

												</div>

											</div>
											<div class="infoReal2">
												<span class="name">${meet.meet_host_name }</span> <span class="meetMember"> ${meet.meet_join_num } 명 참여중</span>
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




			</div>



		</div>


	</div>

	<%@include file="../footer.jsp"%>


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>