package com.cs336.pkg;

public class Winner {
	String uname;
	int AucID;
	float reservePrice;
	float highestPrice;
	
	public Winner(String uN,int id, float rP,float hP) {
		uname = uN;
		AucID = id;
		reservePrice = rP;
		highestPrice = hP;

	}
	public String getuname() {
		return uname;
		
	}
	public int getAucID() {
		return AucID;
	}
	public boolean getWinner() {
		return reservePrice<highestPrice;
	}
}
