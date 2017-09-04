package ex06Mybatis;

public class MyBoardDTO {
	
	private int mId;
	private String mWriter;
	private String mContent;
	
	//기본생성자 : 스프링JDBC를 사용할땐 반드시 필요함(커맨드 객체를 사용하기 때문)
	public MyBoardDTO(){}
	
	//인자생성자
	public MyBoardDTO(int mId, String mWriter, String mContent) {

		this.mId = mId;
		this.mWriter = mWriter;
		this.mContent = mContent;
	}
	
	//getter() / setter()
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmWriter() {
		return mWriter;
	}
	public void setmWriter(String mWriter) {
		this.mWriter = mWriter;
	}
	public String getmContent() {
		return mContent;
	}
	public void setmContent(String mContent) {
		this.mContent = mContent;
	}
	
}
