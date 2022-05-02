package domain;

public class LoginDTO {
	
	//로그인 화면에 정보
	
	//필드
	private String uid;
	private String upw;
	
	
	
	//Get, Set 매소드
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	
	

}
