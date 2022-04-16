package DAO;

import java.sql.*;
import java.util.*;

import Model.EmployeeData;
import Model.MovieData;
public class MovieDAO {
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String USER = "root";
	static final String PASSWD = "Bunty@921";
	
	private Connection conn = null;
	private Statement stmt = null;
	
	public MovieDAO() {
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
//			System.out.println("The number of columns = " + size);
//			System.out.println("The number of rows = " + res.size());
		}
		catch(SQLException se){
			se.printStackTrace();
		}
		return res;
	}
	
	
	
	public ArrayList<MovieData> getMovieInfo(String tbl){
		String sql = "SELECT * FROM" + tbl  + ";" ; 
		
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
			
			data.add(film);
		}
		
		return data;
	}
	
	
}
