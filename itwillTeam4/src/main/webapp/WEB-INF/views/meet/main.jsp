<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오 게시판 메인</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
</head>
<body>

	<%@include file="../header.jsp"%>



	<div class="container-fluid">
		<div>
			<!-- 검색 기능 UI -->
			<form action="./search" method="get">
				<select name="type">
					<option value="1">제목</option>
					<option value="2">테마</option>
					<option value="3">호스트이름</option>
				</select> <input type="text" name="keyword" placeholder="검색어 입력" required />
				<input type="submit" value="검색" />
			</form>
		</div>


		<div>
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>테마</th>
						<th>호스트이름</th>
						<th>최대 인원 수</th>
						<th>현재 참여인원</th>
					</tr>
				</theads>
				<tbody>
					<c:forEach var="meet" items="${meetList}">
						<tr>
						    <td>${meet.meet_idx}</td>
							<td>
								<a href="./detail?meet_idx=${meet.meet_idx}">${meet.meet_name}</a>
                            </td>
							<td>${meet.meet_theme}</td>
							<td>${meet.meet_host_name}</td>
							<td>${meet.meet_member_num }</td>	
							<td>${meet.meet_join_num}</td>				
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>