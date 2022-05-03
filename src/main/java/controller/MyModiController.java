package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.LoginVO;
import domain.MyPageDTO;
import service.MyPageServiceImpl;

/**
 * Servlet implementation class MyModiController
 */
@WebServlet("/MyModi")
public class MyModiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyModiController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MyPageDTO dto = new MyPageDTO();
		dto.setUid((String) session.getAttribute("sessId"));

		MyPageServiceImpl service = new MyPageServiceImpl();

		LoginVO vo = service.read(dto);

		request.setAttribute("vo", vo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("views/mymodi.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		LoginVO vo = new LoginVO();
		vo.setUid(request.getParameter("uid"));
		vo.setUname(request.getParameter("uname"));
		vo.setSchoolname(request.getParameter("schoolname"));
		vo.setGradeclass(request.getParameter("gradeclass"));
		vo.setUpw(request.getParameter("upw"));
		vo.setRoute(request.getParameter("route"));
		vo.setBoardingplace(request.getParameter("boardingplace"));

		MyPageServiceImpl service = new MyPageServiceImpl();
		service.update(vo);

		response.sendRedirect("MyPage");
	}

}
