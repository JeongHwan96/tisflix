package com.tis12345.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberBean {
	private int no;
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String interest;
	private String age;
	private String profileImg;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public MemberBean(int no, String id, String name, String password, String email, String phone, String interest,
			String age, String profileImg) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.interest = interest;
		this.age = age;
		this.profileImg = profileImg;
	}
	public MemberBean() {
		super();
	}
	@Override
	public String toString() {
		return "MemberBean [no=" + no + ", id=" + id + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", interest=" + interest + ", age=" + age + ", profileImg=" + profileImg + "]";
	}
	
}
