package com.cs336.pkg;

public class autoBid {
int AucID;
float bidIncr;
int upLimit;
String uname;

public autoBid(int id, float bidIn, int uL, String uN) {
	AucID = id;
	bidIncr = bidIn;
	upLimit = uL;
	uname = uN;
}
public int getAucID() {
	return AucID;
}
public float getbidInc() {
	return bidIncr;
}
public int getupLimit() {
	return upLimit;
}
public String getuname() {
	return uname;
}

}