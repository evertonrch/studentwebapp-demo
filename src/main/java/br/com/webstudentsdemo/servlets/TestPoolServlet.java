package br.com.webstudentsdemo.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/test-pool")
public class TestPoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Set up response
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		//Get connection
		Connection conn = null;
		Statement stmt = null;
		ResultSet results = null;
		
		//Query
		try {
			conn = dataSource.getConnection();
			
			String query = "SELECT * FROM student";
			stmt = conn.createStatement();
			
			results = stmt.executeQuery(query);
			while(results.next()) {
				String firstName = results.getString("first_name");
				String lastName = results.getString("last_name");
				String email = results.getString("email");
				
				out.println(firstName + " " + lastName + " - " + email);
			}
		}
		catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		}
		
	}

}
