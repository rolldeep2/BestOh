package edu.spring.team4.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

public class AuthInterceptor implements HandlerInterceptor{

	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle 호출");
		
		// 로그인 상태 여부
		HttpSession session = request.getSession();
		Object signInUserCode = session.getAttribute("signInUserCode");
		
		if (signInUserCode != null) {
			signInUserCode = session.getAttribute("signInUserCode").toString();
			log.info("로그인한 유저 코드: {}", signInUserCode);
			return true;
		} else {
			log.info("로그인 해.");
			// 요청 URL 정보를 찾아서 signin 요청에 요청 파라미터 추가
			String reqUrl = request.getRequestURL().toString();
			String reqParam = request.getParameter("act");
			String order = request.getParameter("order");
			log.debug("request URL: {}", reqUrl);
			log.debug("request Param: {}", reqParam);
			log.debug("request Param: {}", order);
//			if ( reqParam == null || reqParam.equals("free") || order.equals("0") || order.equals("1")
//					|| order.equals("3") || order.equals("4")) {
//				return true; 
//			}
			
			if ( reqParam == null || reqParam.equals("free")) {
				return true; 
			} 
			
			reqUrl = UriUtils.encode(reqUrl, "UTF-8");

			log.debug("URI 디코딩 후:{}", reqUrl);

			String query = request.getQueryString();
			String target ="";
			if (query == null) { //
				target = UriUtils.encode(reqUrl, "UTF-8");
			} else {	
				target = UriUtils.encode(reqUrl + "?" + query, "UTF-8");
			}

			//log.debug("URI 디코딩 후:{}", reqUrl);
			response.sendRedirect("http://localhost:8181/team4/board?signin=fail&url=" + target);
			return false;

		}
		
	}
	
}