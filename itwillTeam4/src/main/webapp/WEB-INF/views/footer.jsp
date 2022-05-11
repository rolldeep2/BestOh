<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>footer</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>


	<div id="footerWrap">

		<div id="footerTop">
			<div id="footerTopLeft">
				<div id="flogo">
					<a href="http://localhost:8181/team4"><!-- 서버구동하고 나중에 다시확인 --><img
						src="${pageContext.request.contextPath}/resources/img/flogo.png"
						alt="flogo" /></a>

				</div>

				<div id="footerTopRight">

					<ul id="fmenu">
						<li>책오 안내센터</li>
						<li><a href="https://open.kakao.com/o/g8fPcYZd"
							target="_blank">카카오톡 문의하기</a></li>
						<li>운영시간<br>평일 09:30 ~ 18:30 <br>점심 12:30 ~ 13:30
						</li>
					</ul>

				</div>

			</div>
		</div>

		<div id="footerBot">
			<p>책오</p>
			<span>사업자등록번호 : 100-10-100000 통신판매업신고 : 제 2022-서울강남-1000호 대표 : itwillTeam4<br> 
			주소 : 서울시 강남구 테헤란로 124 4층 itwillTeam4<br> 
				Copyright © 2022 itwillTeam4 Inc. All rights reserved
			</span>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
