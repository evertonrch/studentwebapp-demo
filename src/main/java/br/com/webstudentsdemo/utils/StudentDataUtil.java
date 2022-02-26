package br.com.webstudentsdemo.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.com.webstudentsdemo.models.Student;

public class StudentDataUtil {
	
	private DataSource dataSource;
	
	public StudentDataUtil(DataSource ds) {
		dataSource = ds;
	}
	
	public List<Student> getStudents() throws SQLException {
		String query = "SELECT * FROM student";
		List<Student> students = new ArrayList<>();
		
		try (Connection conn = dataSource.getConnection();
			 PreparedStatement ps = conn.prepareStatement(query)) {
			ps.execute();	
			
			try (ResultSet results = ps.getResultSet()){
				while(results.next()) {
					students.add(
							new Student(
							results.getInt("id"),
							results.getString("first_name"),
							results.getString("last_name"),
							results.getString("email")));
				}
			}
		}
		return students;
	}

	public void addStudent(Student st) throws SQLException {
		String query = "INSERT INTO student(first_name, last_name, email) VALUES (?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(query);
			pst.setString(1, st.getName());
			pst.setString(2, st.getLastName());
			pst.setString(3, st.getEmail());
			pst.execute();
		}
		finally {
			if(pst != null) {
				pst.close();
			}
			if(conn != null) {
				conn.close();
			}
		}		
	}
}
