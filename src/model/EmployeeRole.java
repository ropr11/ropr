package model;
// default package
// Generated Mar 19, 2014 11:06:25 AM by Hibernate Tools 4.0.0

/**
 * EmployeeRole generated by hbm2java
 */
public class EmployeeRole implements java.io.Serializable {

	private Integer roleId;
	private String role;

	public EmployeeRole() {
	}

	public EmployeeRole(String role) {
		this.role = role;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
