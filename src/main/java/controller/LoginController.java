package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.LoginDTO;
import domain.LoginVO;
import service.LoginServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("views/login.jsp"); dispatcher.forward(request,
		 * response);
		 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/login2.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8"); // 한글도 입력 가능하게 하기

		/*
		 * <jsp:UseBean id="dto" class="domain.LoginDTO/"> <jsp:SetProperty name="dto"
		 * Property="id" value=""> <jsp:GetProperty name="dto" Property="">
		 */
		// id, pwd, checkbox 정보 받아오기
		String uid = request.getParameter("uid");// id 넘어온다.
		String upw = request.getParameter("upw");// pwd 넘어온다.
		String saveId = request.getParameter("saveId");// 체크박스의 체크여부 넘어온다.

		LoginDTO dto = new LoginDTO();
		dto.setUid(uid);
		dto.setUpw(upw);

		LoginServiceImpl service = new LoginServiceImpl();
		LoginVO vo = service.read(dto);

		if (vo != null) {
			// true이면 세션생성 및 마이페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("sessId", vo.getUid());
			session.setAttribute("sessName", vo.getUname());
			session.setAttribute("sessSchName", vo.getSchoolname());

			// 아이디 저장
			Cookie cookieID = new Cookie("userId", uid);// 아이디 쿠키 생성
			// 비밀번호 저장
			Cookie cookiePW = new Cookie("userPW", upw);// 비밀번호 쿠키 생성

			if (saveId != null) { // 체크박스 체크여부에 따라 쿠키 저장 확인

				cookieID.setMaxAge(60 * 60 * 24);// 하루동안 쿠키 생성 (아이디)
				cookieID.setPath("/");// 최상위 경로 이하 설정

				cookiePW.setMaxAge(60 * 60 * 24);// 하루동안 쿠키 생성 (비밀번호)
				cookiePW.setPath("/");

				// 체크박스 체크 되었을 때
				// 쿠키 저장
				// response.addCookie(cookieID); //login.jsp
				// response.addCookie(cookiePW);//login.jsp
			} else {
				// 체크박스 체크 해제되었을 때
				// 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
				cookieID.setMaxAge(0);
				cookieID.setPath("/");

				cookiePW.setMaxAge(0);
				cookiePW.setPath("/");

				// response.addCookie(cookieID);//login.jsp
				// response.addCookie(cookiePW);//login.jsp
			}

			// 로그인시 마이페이지로.
			response.sendRedirect("MyPage");

		} else {
			// false이면 로그인페이지로 이동
			response.sendRedirect("Login");
		}
	}

}
