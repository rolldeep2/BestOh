<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책오</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/meet.css"
	type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>

</head>
<body>
	<%@include file="../header.jsp"%>







	<div class="contentWrapMeet">
		<div class="innerWrapMeet">


			<div class="rightInputTop">

				<h2>독서 모임 개설</h2>
			</div>
			<div class="applyInput">

				<form method="post">
					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>독서 모임 테마</p>
						</div>

						<select name="meet_theme" class="selectForm">
							<option value="책수다형">책수다형</option>
							<option value="독서토론형">독서토론형</option>
							<option value="덕후형">덕후형</option>
							<option value="생활습관 개선형">생활습관 개선형</option>
							<option value="낭독형">낭독형</option>
							<option value="챌린지형">챌린지형</option>
							<option value="스터디형">스터디형</option>
						</select>
					</div>

					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>독서 모임명</p>
						</div>
						<div class="inputFormsRight">
							<input type="text" name="meet_name" class="applyInputText"
								placeholder="독서 모임 이름을 입력해주세요.(최대 16자)" maxlength="16" required
								autofocus />
						</div>
					</div>

					<div class="applyInputForms bigForm">

						<div class="inputFormsLeft ">
							<p>독서 모임 소개</p>
						</div>
						<div class="inputFormsRight">
							<textarea name="meet_intro" class="applyInputText"
								placeholder="개설할 모임에 대한 소개를 입력해주세요.(최대 500자)" maxlength="500"
								rows="5" required></textarea>
						</div>
					</div>


					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>독서 모임 정원</p>
						</div>
						<select name="meet_member_num" class="selectForm">
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="8">8</option>
							<option value="10">10</option>
							<option value="12">12</option>
							<option value="15">15</option>
							<option value="18">18</option>
							<option value="20">20</option>
						</select>
					</div>

					<div class="applyInputForms">

						<div class="inputFormsLeft">
							<p>온라인/오프라인</p>
						</div>
						<div class="selectRadio">
							<div class="radio">
								<label style="margin-right: 84px;"><input type="radio"
									name="meet_on_or_off" value="1" checked>온라인</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="meet_on_or_off" value="2">오프라인</label>
							</div>
						</div>
					</div>
					<div>
						<input type="hidden" name="meet_host_name" value="${signInUserId}" required/>
					</div>
					<div>
						<input type="hidden" name="meet_host" value="${signInUserCode}" required readonly/>
					</div>
					<div>
						<input type="hidden" name="meet_member_code" value="${signInUserCode}" required readonly/>
					</div>
					<div>
						<input type="hidden" name="meet_join_num" value="1" required readonly/>
					</div>


					

					<div class="applyInputForms bigbigForm">

						<div class="inputFormsLeft">
							<p>도서 선정</p>
						</div>
						<div class="book_info_div">
							<div class="book_info"></div>
							<div class="book_info2">



								<input type="text" id="meet_book_title"
									placeholder="책 제목을 입력해주세요." name="meet_book_title" required /> <input type="button"
									id="btn_book_search" name="btn_book_search" value="검색" />
								



								<div>
									<input type="text" id="meet_book_authors" name="meet_book_authors" value=""
										placeholder="저자" required readonly />
								</div>
								<div>
									<input type="text" id="meet_book_pub" name="meet_book_pub"  value=""
										placeholder="출판사" required readonly />
								</div>
								<div>
									<input type="hidden" id="meet_book_img" name="meet_book_img"  value="" required />
								</div>
								<div>
									<input type="hidden" id="meet_book_tag"  name="meet_book_tag" value=""  />
								</div>


							</div>


							<div id="btns" class="btns">
								<input type="button" id="btn_prev" class="searchBtn1"> <input
									type="button" id="btn_next" class="searchBtn2">
							</div>
						</div>
					</div>
					<div>
						<input type="submit" class="btn_create" value="등록" />
					</div>
				</form>

			</div>






		</div>



	</div>






	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">




		var n = 0;
		var msg;
		$(document)
				.ready(
						function() {
							$('#btn_book_search')
									.click(
											function(event) {
												var title = $(
														'#meet_book_title')
														.val();
												$
														.ajax({
															method : "GET",
															url : "https://dapi.kakao.com/v3/search/book?target=title",
															data : {
																query : title,
																size : 50
															},
															headers : {
																Authorization : "KakaoAK 3f1fb761122afdd0796567178c84f3dc"
															},
															success : function(
																	info) {
																msg = info;
																console
																		.log(msg);
																if (msg.documents.lenght != 0) {
																	getBookInfo(n);
																} else {
																	alert("도서 검색 실패!")
																}
															}
														})
											});

						});
		$('#btn_prev').click(function() {
			if (n > 0) {
				n--;
				getBookInfo(n);
			}
		});
		$('#btn_next').click(function() {
			if (n < msg.documents.length - 1) {
				n++;
				getBookInfo(n);
			}
		});
		function getBookInfo(n) {
			var list_info = '';
			$('.book_info').empty();
			list_info += '<div>' + '<img src='+msg.documents[n].thumbnail+'/>'
					+ '</div>' + '</div>';
			$('.book_info').html(list_info);
			$('#meet_book_title').val(msg.documents[n].title);
			$('#meet_book_authors').val(msg.documents[n].authors);
			$('#meet_book_pub').val(msg.documents[n].publisher);
			$('#meet_book_img').val(msg.documents[n].thumbnail);
			$('.book_info2').show();
			$('#btns').show();
		};
	</script>




</body>
</html>