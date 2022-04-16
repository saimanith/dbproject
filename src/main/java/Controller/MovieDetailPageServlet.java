package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MovieD;
import Model.MovieData;
/**
 * Servlet implementation class MovieDetailPageServlet
 */
@WebServlet("/MovieDetailPage")
public class MovieDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String movieItem = request.getParameter("movieItem");
		
		MovieD dao =new MovieD();		
		
		MovieData movieres = dao.getMovieDetailInfo(movieItem,"film");
		request.setAttribute("movieList", movieres);
		RequestDispatcher dispatcher = request.getRequestDispatcher("moviedetail.jsp");
		dispatcher.forward(request, response);
		System.out.println("------>"+movieres.getFilmID());
		System.out.println("------>"+movieres.getTitle());
		System.out.println("------>"+movieres.getDescription());
		System.out.println("------>"+movieres.getReleaseYear());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
