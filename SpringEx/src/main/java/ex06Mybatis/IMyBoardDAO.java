package ex06Mybatis;

import java.util.ArrayList;

public interface IMyBoardDAO {
	
	//리스트
	public ArrayList<MyBoardDTO> list();
	//쓰기
	public void write(String mWriter, String mContent);
	//상세보기
	public MyBoardDTO view(String mId);
	//삭제
	public void delete(String mId);
	
}
