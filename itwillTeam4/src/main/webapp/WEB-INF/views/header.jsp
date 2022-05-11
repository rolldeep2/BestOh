<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>header</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">

</head>
<body>
	<div id="wrap">
		<div id="header" class="content">
			<h1 id="logo">
				<a href="http://localhost:8181/team4"> <!-- 서버구동하고 다시 확인해야함 -->
					<img
					src="${pageContext.request.contextPath}/resources/img/logo2.png"
					alt="logo" />
				</a>
			</h1>


			<ul id="navui1" class="menu">

				<li id="board"><a href="http://localhost:8181/team4/board">커뮤니티</a></li>
				<li id="notice"><a
					href="http://localhost:8181/team4/notice/main">공지사항</a></li>
			</ul>



			<div>
				<!-- 검색 기능 UI -->
				<form action="http://localhost:8181/team4/meet/find" method="post"
					id="searchWrap">
					<input type="text" name="search3" placeholder="함께 읽고 싶은 책을 검색해보세요."
						required>
					<button type="submit">
						<img
							src="${pageContext.request.contextPath}/resources/img/search.png"
							alt="search">
					</button>

				</form>
			</div>



			<a href="http://localhost:8181/team4/meet/find" id="meetSearch">
				<div id="meet">
					<h2>독서모임 찾기</h2>
				</div>
			</a>


			<ul id="navui2" class="menu">




				<c:if test="${empty signInUserCode}">

					<li id="login">
						<!--  <a href="./user/signin">-->로그인
					</li>

				</c:if>
				<c:if test="${not empty signInUserCode }">
					<li id="logout"><a
						href="http://localhost:8181/team4/user/mypage">마이페이지</a></li>
					<li id="logout"><a
						href="http://localhost:8181/team4/user/signout?url=${requestScope['javax.servlet.forward.servlet_path']}">로그아웃</a></li>

				</c:if>

			</ul>



		</div>
	</div>
	<div class="modalBackground">
		<div id="loginModal">
			<p>로그인</p>

			<div id="loginClose" class="close">
				<img
					src="${pageContext.request.contextPath}/resources/img/close.png"
					alt="close">
			</div>
			<form
				action="http://localhost:8181/team4/user/signin?url=${requestScope['javax.servlet.forward.servlet_path']}"
				method="post">
				<div id="loginInput">
					<div class="loginInputForm">
						<input type="text" name="user_id" id="idInput"
							placeholder="아이디(이메일) 입력" autofocus required>

					</div>
					<div class="loginInputForm">
						<input type="password" name="user_pwd" placeholder="비밀번호 입력"
							autofocus required>
					</div>

					<div>
						<input type="submit" id="login_confirm" value="로그인" />
					</div>
				</div>
			</form>

			<span id="callRegister">회원가입</span><span id="callSearch">아이디/비밀번호
				찾기</span>

		</div>


		<div id="registerModal">
			<p>회원가입</p>

			<div id="registerClose" class="close">
				<img
					src="${pageContext.request.contextPath}/resources/img/close.png"
					alt="close">
			</div>
			<form
				action="http://localhost:8181/team4/user/register?url=${requestScope['javax.servlet.forward.servlet_path']}"
				method="post">
				<div id="registerInput">
					<div class="form-group">
						<label class="font-weight-bold" for="inputName_1">이메일</label>
						<div>
							<input type="email" class="form-control ywForm" name="user_id"
								id="user_id" placeholder="abc@abc.com" required autofocus>
						</div>
						<div class="nullbox" id="nullbox1"></div>
						<div class="valid_id">사용 가능한 아이디입니다.</div>
						<div class="invalid_id">아이디가 중복됐습니다.</div>
					</div>



					<div class="form-group">
						<label class="font-weight-bold" for="inputName_1"
							style="margin-bottom: 13px;">비밀번호</label>
						<div>
							<input type="password" id="user_pwd_ck" name="user_pwd_ck"
								placeholder="비밀번호 입력" required />
						</div>
						<div>
							<input type="password" id="user_pwd" name="user_pwd"
								placeholder="비밀번호 확인" required />
							<div class="nullbox" id="nullbox3"></div>
							<div class="invalid_pwd">비밀번호가 틀렸습니다.</div>
						</div>
					</div>

					<div class="form-group">
						<label class="font-weight-bold" for="inputName_1">닉네임</label>
						<div>
							<input type="text" id="user_nn" name="user_nn"
								placeholder="닉네임 입력" required />
							<div class="nullbox" id="nullbox2"></div>
							<div class="valid_nn">사용 가능한 닉네임입니다.</div>
							<div class="invalid_nn">닉네임이 중복됐습니다.</div>
						</div>

					</div>



					<div class="form-group ">
						<label class="font-weight-bold" for="inputName_1">이름</label>
						<div>
							<input type="text" name="user_name" placeholder="이름 입력" required />
						</div>

					</div>


					<div class="form-group">
						<label class="font-weight-bold" for="inputName_1">전화번호</label>
						<div>
							<input type="text" name="user_phone"
								placeholder="전화번호 입력 (01012345678)" required />
						</div>

					</div>


					<div class="tagInput" style="display: none;">
						<input type="text" name="user_tag"
							placeholder="선호 태그 입력 (#편안한 #로맨스 #소설)" />
					</div>


					<div>
						<input type="submit" id="btn-complete" value="회원가입" />
					</div>
				</div>
			</form>


		</div>

		<div id="searchModal">

			<div id="searchClose" class="close">
				<img
					src="${pageContext.request.contextPath}/resources/img/close.png"
					alt="close">
			</div>
			<div class="full">
				<div class="container">
					<div class="area_inputs wow fadeIn">
						<div class="searchModalTop">
							<p class="searchModalP">아이디/비밀번호 찾기</p>
							<p class="searchModalP2">인증된 이메일만 정보 찾기가 가능합니다 :)</p>
						</div>
						<div class="btnWrap">
							<div style="margin-bottom: 10px;"
								class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="search_1"
									name="search_total" checked="checked"> <label
									class="custom-control-label font-weight-bold " for="search_1">아이디
									찾기</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="search_2"
									name="search_total"> <label
									class="custom-control-label font-weight-bold " for="search_2">비밀번호
									찾기</label>
							</div>
						</div>
						<div id="searchI">
							<div class="form-group">
								<label class="font-weight-bold" for="inputName_1">이름</label>
								<div>
									<input type="text" class="form-control ywForm" id="inputName_1"
										name="inputName_1" placeholder="이름 입력">
								</div>
							</div>
							<div class="form-group">
								<label class="font-weight-bold" for="inputPhone_1">전화번호</label>
								<div>
									<input type="text" class="form-control ywForm"
										id="inputPhone_1" name="inputPhone_1"
										placeholder="전화번호 입력 (01012345678)">
								</div>
							</div>
							<div class="form-group">
								<button id="searchBtn" type="button"
									class="btn btn-primary btn-block ywBtn">찾기</button>
							</div>
							<div class="searchResult" style="margin-top: 20px;">
								<b id="id_value2" style="float: left;">이메일은 : </b>
								<p id="id_value"
									style="display: block; left: 10px; position: relative;"></p>
							</div>
						</div>
						<div id="searchP" style="display: none;">
							<div class="form-group">
								<label class="font-weight-bold" for="inputId">이메일</label>
								<div>
									<input type="text" class="form-control ywForm" id="inputId"
										name="inputId" placeholder="abc@abc.com">
								</div>
							</div>
							<div class="form-group">
								<label class="font-weight-bold" for="inputPhone_2">전화번호</label>
								<div>
									<input type="email" class="form-control ywForm"
										id="inputPhone_2" name="inputPhone_2"
										placeholder="전화번호 입력 (01012345678)">
								</div>
							</div>
							<div class="form-group">
								<button id="searchBtn2" type="button"
									class="btn btn-primary btn-block ywBtn">찾기</button>
							</div>
							<div class="searchResultY" style="margin-top: 20px;">
								<p id="pwd_value"></p>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		$("#login").click(function() {
			$(".modalBackground").fadeIn(300);
			$("#loginModal").fadeIn(300);

		});

		$("#loginClose").click(function() {
			$(".modalBackground").fadeOut(300);
			$("#loginModal").fadeOut(300);
		});

		$("#callRegister").click(function() {
			$("#registerModal").fadeIn(300);

		});

		$("#registerClose").click(function() {
			$("#registerModal").fadeOut(300);
		});

		$("#callSearch").click(function() {
			$("#searchModal").fadeIn(300);

		});

		$("#searchClose").click(function() {
			$("#searchModal").fadeOut(300);
		});

		$("#search_1").click(function() {

			$("#searchI").show();
			$("#searchP").hide();

		});

		$("#search_2").click(function() {

			$("#searchI").hide();
			$("#searchP").show();

		});

		$(document)
				.ready(
						function() {

							// userid 아이디를 갖는 HTML 요소(input)에 변화가 생겼을 때 호출될 이벤트 리스너 콜백 함수를 등록. 
							$('#user_id')
									.change(
											function(event) {
												// Ajax를 이용해서 아이디 중복 체크
												var params = {
													user_id : $(this).val()
												};
												// $.post(Ajax 요청 주소, 요청 파라미터, 응답 성공일 때 실행될 콜백 함수);
												$
														.post(
																'./user/checkid',
																params,
																function(
																		response) {
																	if (response == 'valid_id') { // 사용 가능한 아이디(DB에 없는 아이디)인 경우

																		$(
																				"#nullbox1")
																				.hide();
																		$(
																				'.valid_id')
																				.show(); // valid div 보여줌.
																		$(
																				'.invalid_id')
																				.hide(); // valid div 없앰(display=none).
																		$(
																				'#btn-complete')
																				.removeAttr(
																						'disabled'); // 버튼 활성화
																	} else {
																		$(
																				"#nullbox1")
																				.hide();
																		$(
																				'.valid_id')
																				.hide(); // valid div 없앰(display=none).
																		$(
																				'.invalid_id')
																				.show(); // invalid div 보여줌.
																		$('#btn-complete').attr('disabled','true'); // 버튼 비활성화
																	}
																});
											});

							$('#user_nn')
									.change(
											function(event) {
												var params_nn = {
													user_nn : $(this).val()
												};
												$
														.post(
																'./user/checknn',
																params_nn,
																function(
																		response) {
																	if (response == 'valid_nn') { // 사용 가능한 아이디(DB에 없는 아이디)인 경우
																		$(
																				"#nullbox2")
																				.hide();
																		$(
																				'.valid_nn')
																				.show(); // valid div 보여줌.
																		$(
																				'.invalid_nn')
																				.hide(); // valid div 없앰(display=none).
																		$(
																				'#btn-complete')
																				.removeAttr(
																						'disabled'); // 버튼 활성화
																	} else {
																		$(
																				"#nullbox2")
																				.hide();
																		$(
																				'.valid_nn')
																				.hide(); // valid div 없앰(display=none).
																		$(
																				'.invalid_nn')
																				.show(); // invalid div 보여줌.
																		$(
																				'#btn-complete')
																				.attr(
																						'disabled',
																						'true'); // 버튼 비활성화
																	}
																});
											});

							$('#user_pwd').change(
									function(event) {
										if ($('#user_pwd_ck').val() == $(
												'#user_pwd').val()) {
											$('.invalid_pwd').hide(); // valid div 없앰(display=none).
											$('#btn-complete').removeAttr(
													'disabled'); // 버튼 활성화
										} else {
											$("#nullbox3").hide();
											$('.invalid_pwd').show(); // invalid div 보여줌.
											$('#btn-complete').attr('disabled',
													'true'); // 버튼 비활성화
										}
									});

							// 회원가입 성공, 실패 메시지
							$('#btn-complete')
									.click(
											function(event) {
												alert("회원가입에 성공하였습니다! \n아이디/비밀번호찾기 서비스를 이용하시려면 이메일 인증도 진행해주세요.");
											});

							if (location.href == "http://localhost:8181/team4/?register=fail") {
								if ('${register}' == false) {
									$("#registerModal").fadeIn(300);
									alert("회원가입 정보를 다시 입력해 주세요.");
								}
							}

							// 로그인 실패

							var url = window.location.href;
							if (url.indexOf("fail") != -1) {
								$(".modalBackground").fadeIn(300);
								$("#loginModal").fadeIn(300);
							}

							/* if (location.href == "http://localhost:8181/team4/?signin=fail"){
								//if ('${signin}' == false) {
									$(".modalBackground").fadeIn(300);
									$("#loginModal").fadeIn(300);
									alert("로그인 정보를 다시 입력해 주세요.");
								//}
							} */

							var idV = "";
							$("#searchBtn")
									.click(
											function() {
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/user/userSearch?inputName_1="
																	+ $(
																			'#inputName_1')
																			.val()
																	+ "&inputPhone_1="
																	+ $(
																			'#inputPhone_1')
																			.val(),
															success : function(
																	data) {
																if (data == 0) {
																	$(
																			'#id_value')
																			.text(
																					"회원 정보를 확인해주세요!");
																} else {
																	$(
																			'#id_value')
																			.text(
																					data);
																	// 아이디값 별도로 저장
																	idV = data;
																}
															}
														});
											});
							
							
							// TODO
							
							$("#searchBtn2").click(function(){
								
								$.ajax({
									type:"POST",
									url:"${pageContext.request.contextPath}//user/userPwdY?inputId="
											+$('#inputId').val(),
									success:function(data){
										if(data == 0){
											$('#pwd_value').text("회원 정보를 확인해주세요!");	
										} else {
											
											$.ajax({type : "GET",
												url : "${pageContext.request.contextPath}/user/searchPassword",
												data : {
												inputId : $('#inputId').val(),
												inputPhone_2 : $('#inputPhone_2').val()},
													success : function(data) {
														alert("가입하신 이메일(아이디)로 임시 비밀번호를 전송했습니다!");
														$("#searchModal").fadeOut(300);
													}
												});
											
										}
									}
								});
								
							});
						

							

						});
	</script>
</body>
</html>