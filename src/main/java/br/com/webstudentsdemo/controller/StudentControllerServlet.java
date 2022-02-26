package br.com.webstudentsdemo.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import br.com.webstudentsdemo.models.Student;
import br.com.webstudentsdemo.utils.StudentDataUtil;


@WebServlet("/student-controller")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentDataUtil studentDataUtil;
	
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	
	public void init() throws ServletException {
		try {
			studentDataUtil = new StudentDataUtil(dataSource);			
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			String paramCommand = request.getParameter("command");
			
			if(paramCommand == null) {
				paramCommand = "LIST";
			}
			
			switch(paramCommand) {				
			case "LIST":
				listStudents(request, response);
				break;
			
			case "ADD":
				addStudent(request, response);
				break;
			
			default:
				listStudents(request, response);
			}
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		String paramFirstName = request.getParameter("firstName");
		String paramLastName = request.getParameter("lastName");
		String paramEmail = request.getParameter("email");
				
		Student st = new Student();
		st.setName(paramFirstName);
		st.setLastName(paramLastName);
		st.setEmail(paramEmail);
		
		studentDataUtil.addStudent(st);
				
		listStudents(request, response);		
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		List<Student> students = studentDataUtil.getStudents();
		
		request.setAttribute("student_list", students);
		RequestDispatcher rd = request.getRequestDispatcher("list-students.jsp");
		rd.forward(request, response);
	}

}
