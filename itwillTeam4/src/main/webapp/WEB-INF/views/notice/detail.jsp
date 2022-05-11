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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
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
					<li><a href="http://localhost:8181/team4/notice/main" class="on">공지사항/이벤트</a></li>

				</ul>
			</div>



			<div class="right-contentsDetail ">

				<div class="detailTop">
					<div class="detailTopWrap">
						<p class="detailTopA">${notice.notice_category }</p>
						<p class="detailTopTitle">${notice.notice_title }</p>
						
						<p class="detailTopDate">
							<fmt:formatDate value="${notice.notice_reg_date }"
								pattern="yyyy-MM-dd hh:mm:ss" />
						</p>
					</div>


				</div>
				<div class="detailContentWrap">
				
			
					<p class="detailContent">${notice.notice_content }</p>
					
				
				</div>
				<div class="noticeDetailBottom">
					<c:if test="${userAdminCheck == 1}">
		               <!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
		               <a href="../update?notice_idx=${notice.notice_idx}"><button class="btnUpdateNotice">수정</button></a>
		               <a id="menu-delete" href="../delete?notice_idx=${notice.notice_idx}"><button class="btnDeleteNotice">삭제</button></a>
		            </c:if>
		            
					<a href="http://localhost:8181/team4/notice/main"><button class="btn_create btn_list">목록</button></a>
				</div>
				

				


			</div>
		</div>
	</div>	






	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<script>
		
		$('#menu-delete').click(function(event){
  			event.preventDefault();
  			var result = confirm('정말 삭제할까요?');
  			if (result){
  				location = $(this).attr('href'); 
  				alert('삭제되었습니다.')
  			}
  		});</script>
</body>
</html>