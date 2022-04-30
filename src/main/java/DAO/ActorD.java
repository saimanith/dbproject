package DAO;

import java.sql.*;
import java.util.*;

import Model.ActorData;
import Model.EmployeeData;
import Model.MovieData;

public class ActorD {

	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String USER = "root";
	static final String PASSWD = "Bunty@921";

	private Connection conn = null;
	private Statement stmt = null;

	public ActorD() {
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
		} catch (SQLException se) {
			se.printStackTrace();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Map<String, Object>> runSQL(String sql) {
		if (stmt == null)
			return null;

		List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();

		try {
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData metaData = rs.getMetaData();
			int size = metaData.getColumnCount();

			while (rs.next()) {
				Map<String, Object> row = new HashMap<String, Object>();
				for (int i = 1; i <= size; i++) {
					row.put(metaData.getColumnName(i), rs.getObject(i));
				}
				res.add(row);
			}
			rs.close();
//				System.out.println("The number of columns = " + size);
//				System.out.println("The number of rows = " + res.size());
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return res;
	}

	public ArrayList<ActorData> getActorInfo(String tbl) {
		String sql = "SELECT * FROM " + tbl + ";";

		List<Map<String, Object>> res1 = runSQL(sql);

		if (res1.size() == 0)
			return null;

		ArrayList<ActorData> data = new ArrayList<ActorData>();

		for (int i = 0; i < res1.size(); i++) {
			Map<String, Object> row = res1.get(i);
			ActorData actor = new ActorData();

			Object actorID = (Object) row.get("actor_id");
			actor.setActorid(actorID.toString());

			Object firstName = (Object) row.get("first_name");
			actor.setFirstName(firstName.toString());

			Object lastName = (Object) row.get("last_name");
			actor.setLastName(lastName.toString());

			Object filmsInfo = (Object) row.get("film_info");
			actor.setFilmsInfo(filmsInfo.toString());

			data.add(actor);
		}

		return data;
	}

	public ActorData getActorDetailInfo(String actorid, String tbl) {
		int aID = Integer.parseInt(actorid);
		String sql = "SELECT * FROM " + tbl + " WHERE actor_id=" + aID + ";";

		Map<String, Object> res1 = runSQLForDetail(sql);

		// System.out.println(">>>>>>>>>>>"+res1.size());
		if (res1.size() == 0)
			return null;

		ActorData actor = new ActorData();

		Map<String, Object> row = res1;

		Object actorID = (Object) res1.get("actor_id");
		actor.setActorid(actorID.toString());

		Object firstName = (Object) res1.get("first_name");
		actor.setFirstName(firstName.toString());

		Object lastName = (Object) res1.get("last_name");
		actor.setLastName(lastName.toString());

		Object filmsInfo = (Object) res1.get("film_info");
		actor.setFilmsInfo(filmsInfo.toString());

		return actor;
	}

	private Map<String, Object> runSQLForDetail(String sql) {
		// TODO Auto-generated method stub
		if (stmt == null)
			return null;

		Map<String, Object> res = new HashMap<String, Object>();

		try {
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData metaData = rs.getMetaData();
			int size = metaData.getColumnCount();
			//System.out.println("&&&&&&&&&" + size);
			while (rs.next()) {
				for (int i = 1; i <= size; i++) {
					res.put(metaData.getColumnName(i), rs.getObject(i));
				}
			}
			rs.close();
//				System.out.println("The number of columns = " + size);
//				System.out.println("The number of rows = " + res.size());
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return res;
	}
}
