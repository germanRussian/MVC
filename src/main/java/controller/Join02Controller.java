package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.LoginVO;
import service.MyPageServiceImpl;

/**
 * Servlet implementation class Join01Controller
 */
@WebServlet("/Join02")
public class Join02Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join02Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher 
					= request.getRequestDispatcher("views/join02.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String schoolname = request.getParameter("schoolname");
		String gradeclass = request.getParameter("gradeclass");
		String upw = request.getParameter("upw");
		String route = request.getParameter("route");
		String boardingplace = request.getParameter("boardingplace");
		
		LoginVO vo = new LoginVO();
		vo.setUid(uid);
		vo.setUname(uname);
		vo.setSchoolname(schoolname);
		vo.setGradeclass(gradeclass);
		vo.setUpw(upw);
		vo.setRoute(route);
		vo.setBoardingplace(boardingplace);
		
		MyPageServiceImpl service = new MyPageServiceImpl();
		//service.insert(vo);
		
		response.sendRedirect("Join03");
		
	}


}



