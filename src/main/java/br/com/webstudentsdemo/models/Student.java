package br.com.webstudentsdemo.models;

public class Student {

	private Integer id;
	private String name;
	private String lastName;
	private String email;
	
	public Student() {}
	
	public Student(String name, String lastName, String emal) {
		setName(name);
		setLastName(lastName);
		setEmail(email);
	}
	
	public Student(Integer id, String name, String lastName, String email) {
		setId(id);
		setName(name);
		setLastName(lastName);
		setEmail(email);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Student [Id()=" + getId() + ", Name()=" + getName() + ", LastName()=" + getLastName()
				+ ", Email()=" + getEmail() + "]";
	}
	
}
