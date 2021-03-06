<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    						
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>책오</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
		<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
	</head>
		<body>
			<div style="margin: 100px;">
			<a><img src="${pageContext.request.contextPath}/resources/img/logo2.png"		style="height: 80px;" /></a> <br>
			<br>
			<h3>안녕하세요, ${param.user_nn} 님</h3>
			<br>
			<p>환영합니다!</p>
			<br>
			<p>이메일 인증이 정상적으로 이루어 졌습니다.</p>
			<br>
			<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
			<br> <a href="${pageContext.request.contextPath}/">책오 페이지로 이동하기</a>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
      	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>