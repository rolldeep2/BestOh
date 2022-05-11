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

			<div class="right-contents">
				<div id="right-top-wrap">
					<p id="right-contents-title">공지사항</p>
					<c:if test="${userAdminCheck ==1 }">
						<a href="./insert">
							<span id="noticeInsert">공지사항작성</span>
						</a>

					</c:if>
					<ul class="searchTap">
						<li><a href="?act=공지사항">공지사항</a></li>
						<li><a href="?act=이벤트">이벤트</a></li>
						<li><a href="?act=FAQ">FAQ</a></li>
					</ul>
				</div>

				<ul class="boardList">
					<li class="boardListTop boardCategory">구분</li>
					<li class="boardListTop boardTitle">제목</li>
					<li class="boardListTop boardRegDate">날짜</li>

				</ul>
				<c:forEach var="Notice" begin="0" end="19" step="1" items="${noticeList}">
					<ul class="boardList">
						<li class="boardCategory"><p>${Notice.notice_category}</p></li>
						<li class="boardTitle"><a href="./detail/${Notice.notice_idx }">${Notice.notice_title }</a></li>
						<li class="boardRegDate"><fmt:formatDate value="${Notice.notice_reg_date }" pattern="yyyy-MM-dd" /></li>
					</ul>
				</c:forEach>

				<div class="paginationCSS" style="display: block; text-align: center;">
					<ul class="pagination">

						<c:if test="${paging.startPage != 1 }">
							<li class="page-item"><a href="main?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" class="page-link">&lt;</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item active"><a class="page-link mypage">
											<b>${p }</b>
										</a></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a href="main?nowPage=${p }&cntPerPage=${paging.cntPerPage}" class="page-link">${p }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item"><a href="main?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage} " class="page-link">&gt;</a></li>
						</c:if>
					</ul>
				</div>


			</div>
		</div>
	</div>









	<%@include file="../footer.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>