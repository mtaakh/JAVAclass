package models;

public class PagingUtilSug {
	
	public static String pagingImg(int getTotalShowCount, int pageSize, 
									int blockPage, int nowPage, String page){
		
		String pagingStr = "<div class='row text-center'>"
				+"<ul class='pagination pagination'>";
		
		//1. 전체페이지 구하기
		int totalPage = (int)(Math.ceil(((double)getTotalShowCount/pageSize)));
		
		int intTemp = ((nowPage-1) / blockPage) * blockPage + 1;
		
		//처음페이지 & 이전페이지를 위한 로직
		if(intTemp != 1){
			pagingStr += "<li><a href='./Suggest.jsp?nowPage=1'><span class='glyphicon glyphicon-backward'></span></a></li>";
			
			pagingStr += "<li><a href='./Suggest.jsp?nowPage="+(intTemp-blockPage)+"'>"
					+"<span class='glyphicon glyphicon-chevron-left'></span></a></li>";
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직 : 블럭페이지 수만큼 or 마지막페이지가 될때까지 페이지를 표시함
		while(blockCount<=blockPage && intTemp<=totalPage){
			//현재페이지인경우
			if(intTemp==nowPage){
				pagingStr += "<li><span style='color:red;'>"+intTemp+"</span></li>";
			}
			else{
				pagingStr += "<li><a href='./Suggest.jsp?nowPage="+intTemp+"'>"+intTemp+"</a></li>";
			}
			
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		}
		
		//다음 및 마지막 페이지를 위한 로직
		if(intTemp <= totalPage){
			pagingStr += "<li><a href='./Suggest.jsp?nowPage="+intTemp+"'>"
					+ "<span class='glyphicon glyphicon-chevron-right'></span></a></li>";
			
			pagingStr += "<li><a href='./Suggest.jsp?nowPage="+totalPage+"'>"
					+ "<span class='glyphicon glyphicon-forward'></span></a></li>"
					+ "</div>";
		}

		return pagingStr;
		
	}

}
