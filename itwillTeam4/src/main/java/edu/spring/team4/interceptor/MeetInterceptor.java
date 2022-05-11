package edu.spring.team4.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.UriUtils;

public class MeetInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 상태 여부
		HttpSession session = request.getSession();
		Object signInUserCode = session.getAttribute("signInUserCode");
		
		if (signInUserCode != null) {
			signInUserCode = session.getAttribute("signInUserCode").toString();
			return true;
		} else {
			// 요청 URL 정보를 찾아서 signin 요청에 요청 파라미터 추가
			String reqUrl = request.getRequestURL().toString();
			String reqParam = request.getParameter("act");
//			if ((reqParam != null && reqParam.equals("free")) || reqParam == null) {
//				return true;
//			} 


			reqUrl = UriUtils.encode(reqUrl, "UTF-8");


			String query = request.getQueryString();
			String target ="";
			if (query == null) { //
				target = UriUtils.encode(reqUrl, "UTF-8");
			} else {
				target = UriUtils.encode(reqUrl + "?" + query, "UTF-8");
			}

			//log.debug("URI 디코딩 후:{}", reqUrl);
			response.sendRedirect("http://localhost:8181/team4/?signin=fail&url=" + target);
			return false;

		}
		
	}

}
