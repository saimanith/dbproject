package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmployeeDAO;
import DAO.MovieD;
import Model.MovieData;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet("/Movies")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		// String button = request.getParameter("moviebutton");
		//System.out.println("----------->" + request.getParameter("Moviesname"));
		MovieD dao = new MovieD();
//		

		ArrayList<MovieData> movieres = dao.getMovieInfo("film");
		request.setAttribute("movieList", movieres);
		RequestDispatcher dispatcher = request.getRequestDispatcher("movie.jsp");
		dispatcher.forward(request, response);

//		PrintWriter out = response.getWriter();
//		out.println("<table width=80% style=height:10% cellpadding=10 border=1>");
//		out.println("<thead>");
//		out.println("<tr>");
//		out.println("<th>film_id</th>");
//		out.println("<th>title</th>");
//		out.println("<th>description</th>");
//		out.println("<th>release_year</th>");;
//		out.println("<tr>");
//		out.println("</thead>");
//
//		
//		
//		
//		
//		
//				
//		for(int i=0; i<movieres.size(); i++) {
//			System.out.println(movieres.get(i));
//			if(movieres.get(i) == null) continue;
//			
//			out.println("<td>");
//			out.println(movieres.get(i).getFilmID());
//			out.println("</td>");
//						
//			out.println("<td>");
//			out.println(movieres.get(i).getTitle());
//			out.println("</td>");
//			
//			out.println("<td>");
//			out.println(movieres.get(i).getDescription());
//			out.println("</td>");
//			
//			
//			out.println("<td>");
//			out.println(movieres.get(i).getReleaseYear());
//			out.println("</td>");//	
//
//			out.println("</tr>");
//		}
//		out.println("</table>");
//		dao.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
