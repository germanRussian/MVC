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
import service.MyPageService;
import service.MyPageServiceImpl;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/MyPage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MyPageDTO dto = new MyPageDTO();
		dto.setUid((String)session.getAttribute("sessId"));
		
		MyPageServiceImpl service = new MyPageServiceImpl();
		
		
		
		LoginVO vo = service.read(dto);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/mypage.jsp");
		dispatcher.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/mypage.jsp");
		dispatcher.forward(request, response);
	}

}
