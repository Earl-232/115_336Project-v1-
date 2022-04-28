package com.cs336.pkg;

public class Alert {
	String uname;
	int AucID;
	
	public Alert(String name, int id) {
		uname = name;
		AucID = id;
	}
	public String getuname() {
		return uname;
	}
	public int getAucID() {
		return AucID;
	}
}

