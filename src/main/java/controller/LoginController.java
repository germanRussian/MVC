package controller;

import java.io.IOException;
import java.util.PropertyPermission;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.jaspic.PersistentProviderRegistrations.Property;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		/*
		 * <jsp:UseBean id="dto" class="domain.LoginDTO/"> <jsp:SetProperty name="dto"
		 * Property="id" value=""> <jsp:GetProperty name="dto" Property="">
		 */
		
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		
		LoginDTO dto = new LoginDTO();
		dto.setUid(uid);
		dto.setUpw(upw);
		
		LoginServiceImpl service = new LoginServiceImpl();
		LoginVO vo = service.read(dto);
		
		if(vo != null) {
			//true이면 세션생성 및 마이페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("sessId", vo.getUid());
			session.setAttribute("sessName", vo.getUname());
			session.setAttribute("sessSchName", vo.getSchoolname());
			response.sendRedirect("MyPage");
			
		} else {
			//false이면 로그인페이지로 이동
			response.sendRedirect("Login");
		}
	}

}





