package com.hanains.board.vo;

public class UserVo {

	private String userID;
	private String password;
	private String joinDate;
	private Long userRole;
	private String name;
	private Long no;

	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public Long getUserRole() {
		return userRole;
	}
	public void setUserRole(Long userRole) {
		this.userRole = userRole;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "UserVo [userID=" + userID + ", password=" + password + ", joinDate=" + joinDate + ", userRole="
				+ userRole + ", name=" + name + ", no=" + no + "]";
	}
	
	
	
}
