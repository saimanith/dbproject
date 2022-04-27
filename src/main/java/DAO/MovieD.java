package DAO;
import java.sql.*;
	import java.util.*;

	import Model.EmployeeData;
	import Model.MovieData;
public class MovieD {
	
	
		static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
		static final String USER = "root";
		static final String PASSWD = "Bunty@921";
		
		private Connection conn = null;
		private Statement stmt = null;
		
		public MovieD() {
			makeConnection("sakila");
		}

		void makeConnection(String dbname) {
			final String dbURL = "jdbc:mysql://localhost/" + dbname + "?autoReconnect=true&useSSL=false";
			System.out.println("Trying......");
			try {
				Class.forName(JDBC_DRIVER);
				conn = DriverManager.getConnection(dbURL, USER, PASSWD);
				System.out.println("got connection....");
				stmt = conn.createStatement();
				System.out.println("Database Connected.....");
			}
			catch (SQLException se) {
				se.printStackTrace();
			}
			
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void close() {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		public List<Map<String, Object>> runSQL(String sql){
			if(stmt == null) return null;
			
			List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();
			
			try {
				ResultSet rs = stmt.executeQuery(sql);
				ResultSetMetaData metaData = rs.getMetaData();
				int size = metaData.getColumnCount();
				
				while(rs.next()) {
					Map<String, Object> row = new HashMap<String, Object>();
					for(int i = 1; i <= size; i++) {
						row.put(metaData.getColumnName(i), rs.getObject(i));
					}
					res.add(row);
				}
				rs.close();
//				System.out.println("The number of columns = " + size);
//				System.out.println("The number of rows = " + res.size());
			}
			catch(SQLException se){
				se.printStackTrace();
			}
			return res;
		}
		
		
		
		public ArrayList<MovieData> getMovieInfo(String tbl){
			//String sql = "SELECT * FROM " + tbl  + ";" ; 
			
			String sql = "select * from "+ tbl +  ";";
			
			List<Map<String, Object>> res1 = runSQL(sql) ; 
			
			if(res1.size() == 0) return null;
			
			ArrayList<MovieData> data =  new ArrayList<MovieData>();
			
			for(int i = 0; i < res1.size(); i++) {
				Map<String, Object> row = res1.get(i);
				MovieData film = new MovieData();
				
				
				Object filmID = (Object) row.get("film_id");
				film.setFilmID(filmID.toString());
				
				Object title = (Object) row.get("title");
				film.setTitle(title.toString());
				
				Object description = (Object) row.get("description");
				film.setDescription(description.toString());
				
				Object releaseYear = (Object) row.get("release_year");
				film.setReleaseYear(releaseYear.toString());
				
				Object languageid = (Object)row.get("language_id");
				film.setLanguageid(languageid.toString());
				
				Object length = (Object)row.get("length");
				film.setLength(length.toString());
				
				Object rating = (Object)row.get("rating");
				film.setRating(rating.toString());
				
				
				
				
				data.add(film);
			}
			
			return data;
		}
		
		public MovieData getMovieDetailInfo(String filmid,String tbl){
			int fID = Integer.parseInt(filmid);
			String sql = "SELECT * FROM " + tbl  + " WHERE film_id="+fID+";" ; 
			
			
			Map<String, Object> res1 = runSQLForDetail(sql) ; 
			
			//System.out.println(">>>>>>>>>>>"+res1.size());
			if(res1.size() == 0) return null;
			
			MovieData film = new MovieData();
			
				Map<String, Object> row = res1;
				
				
				Object filmID = (Object) res1.get("film_id");
				film.setFilmID(filmID.toString());
				
				Object title = (Object) res1.get("title");
				film.setTitle(title.toString());
				
				Object description = (Object) res1.get("description");
				film.setDescription(description.toString());
				
				Object releaseYear = (Object) res1.get("release_year");
				film.setReleaseYear(releaseYear.toString());
				
				Object languageid = (Object)res1.get("language_id");
				film.setLanguageid(languageid.toString());
				
				Object length = (Object)res1.get("length");
				film.setLength(length.toString());
				
				Object rating = (Object)res1.get("rating");
				film.setRating(rating.toString());
				
				
			
			return film;
		}

		private Map<String, Object> runSQLForDetail(String sql) {
			// TODO Auto-generated method stub
			if(stmt == null) return null;
			
			Map<String, Object> res = new HashMap<String, Object>();
			
			try {
				ResultSet rs = stmt.executeQuery(sql);
				ResultSetMetaData metaData = rs.getMetaData();
				int size = metaData.getColumnCount();
				System.out.println("&&&&&&&&&"+size);
				while(rs.next()) {
					for(int i = 1; i <= size; i++) {
						res.put(metaData.getColumnName(i), rs.getObject(i));
					}
				}
				rs.close();
//				System.out.println("The number of columns = " + size);
//				System.out.println("The number of rows = " + res.size());
			}
			catch(SQLException se){
				se.printStackTrace();
			}
			return res;
		}
		
		public ArrayList<MovieData> getMovieInfoForSearch(String sval,String tbl){
			//String sql = "SELECT * FROM " + tbl  + ";" ;
			
			String sql= "select * from "+tbl+" f join film_actor fa on f.film_id=fa.film_id join actor_info ai on fa.actor_id=ai.actor_id where f.title like '%"+sval+"%' or f.description like '%"+sval+"%' or ai.first_name like '%"+sval+"%' or ai.last_name like '%"+sval+"%';"; 
			
			List<Map<String, Object>> res1 = runSQL(sql) ; 
			
			if(res1.size() == 0) return null;
			
			ArrayList<MovieData> data =  new ArrayList<MovieData>();
			
			for(int i = 0; i < res1.size(); i++) {
				Map<String, Object> row = res1.get(i);
				MovieData film = new MovieData();
				
				
				Object filmID = (Object) row.get("film_id");
				film.setFilmID(filmID.toString());
				
				Object title = (Object) row.get("title");
				film.setTitle(title.toString());
				
				Object description = (Object) row.get("description");
				film.setDescription(description.toString());
				
				Object releaseYear = (Object) row.get("release_year");
				film.setReleaseYear(releaseYear.toString());
				
				Object languageid = (Object)row.get("language_id");
				film.setLanguageid(languageid.toString());
				
				Object length = (Object)row.get("length");
				film.setLength(length.toString());
				
				Object rating = (Object)row.get("rating");
				film.setRating(rating.toString());
				
				Object actorFirstName=(Object)row.get("first_name");
				film.setActorFirstName(actorFirstName.toString());

				Object actorLastName=(Object)row.get("last_name");
				film.setActorLastName(actorLastName.toString());
				
				data.add(film);
			}
			
			return data;
		}

		public ArrayList<MovieData> getMoviesOfGenre(String genre,String tbl) {
			// TODO Auto-generated method stub
			String sql = "select * from "+ tbl +" where description like \"%"+genre+"%\" ;";
			
			List<Map<String, Object>> res1 = runSQL(sql) ; 
			
			if(res1.size() == 0) return null;
			
			ArrayList<MovieData> data =  new ArrayList<MovieData>();
			
			for(int i = 0; i < res1.size(); i++) {
				Map<String, Object> row = res1.get(i);
				MovieData film = new MovieData();
				
				
				Object filmID = (Object) row.get("film_id");
				film.setFilmID(filmID.toString());
				
				Object title = (Object) row.get("title");
				film.setTitle(title.toString());
				
				Object description = (Object) row.get("description");
				film.setDescription(description.toString());
				
				Object releaseYear = (Object) row.get("release_year");
				film.setReleaseYear(releaseYear.toString());
				
				Object languageid = (Object)row.get("language_id");
				film.setLanguageid(languageid.toString());
				
				Object length = (Object)row.get("length");
				film.setLength(length.toString());
				
				Object rating = (Object)row.get("rating");
				film.setRating(rating.toString());
				
				
				
				
				data.add(film);
			}
			
			return data;
		}
		
		
		
	}


