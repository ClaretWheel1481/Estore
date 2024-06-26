package org.qvtu.hlx307.estore.web.filter;

/**
 * Servlet implementation class AutoLoginFilter
 */

import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.service.UserService;
import org.qvtu.hlx307.estore.utils.CookieUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
//
//@WebServlet("")
//public class AutoLoginFilter extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	public void init(FilterConfig filterConfig) throws ServletException {
//
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response,
//                         FilterChain chain) throws IOException, ServletException {
//		// 处理请求乱码
//		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
//		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//
//		// 处理自动登录
//		// 1.如果用户已经登录不需要自动登录
//		User user = (User) httpServletRequest.getSession().getAttribute("user");
//		if (user == null) {
//			// 没有登录，进行自动登录
//			// 2.判断访问的资源路径，例如登录，注册不需要进行自动登录
//			String uri = httpServletRequest.getRequestURI();
//			String contextPath = httpServletRequest.getContextPath();
//			String path = uri.substring(contextPath.length());
//			if (!("/regist".equals(path) || "/regist.jsp".equals(path)
//					|| "/login.jsp".equals(path) || "/logout".equals(path))) {
//
//				// 3.得到Cookie
//				Cookie cookie = CookieUtils.findCookieByName(
//						httpServletRequest.getCookies(), "autologin");
//				if (cookie != null) {
//
//					// 有cookie，进行登录操作.
//					String username = URLDecoder.decode(cookie.getValue()
//							.split("::")[0], "utf-8");
//					String password = cookie.getValue().split("::")[1];
//
//					UserService service = new UserService();
//					try {
//						User u = service.login(username, password);
//						if (u != null) {
//							httpServletRequest.getSession().setAttribute(
//									"user", u);// 进行自动登录.
//						}
//					} catch (javax.security.auth.login.LoginException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		}
//		// 放行
//		chain.doFilter(httpServletRequest, httpServletResponse);
//	}
//
//	public void destroy() {
//
//	}
//}
