package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ActorD;
import DAO.MovieD;
import Model.ActorData;
import Model.MovieData;

/**
 * Servlet implementation class ActorDetailPageServlet
 */
@WebServlet("/ActorDetailPage")
public class ActorDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActorDetailPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String actorItem = request.getParameter("actorItem");
		
		ActorD dao =new ActorD();		
		
		ActorData actorres = dao.getActorDetailInfo(actorItem,"actor_info");
		request.setAttribute("actorList", actorres);
		RequestDispatcher dispatcher = request.getRequestDispatcher("actordetail.jsp");
		dispatcher.forward(request, response);
		System.out.println("------>"+actorres.getActorid());
		System.out.println("------>"+actorres.getFirstName());
		System.out.println("------>"+actorres.getLastName());
		System.out.println("------>"+actorres.getFilmsInfo());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
