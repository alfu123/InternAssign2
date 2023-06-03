package com.spring.LibraryCrud.Table;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
public class UserDetails {

	
	String username;
	String pass;

	public UserDetails(String userName, String pass) {
		super();
		this.username = userName;
		this.pass = pass;
	}

	public UserDetails() {
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

}
