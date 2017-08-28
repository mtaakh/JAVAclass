<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>

<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>

<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%
	String html = "";
	String count = "0";
	try{
		String queryURL = "http://career.go.kr/OpenApi/JobDicList.do?apikey=ac005861aef421b3570b4dde9a569157&gubun=job_dic_list&thisPage=1";

		URL url = new URL(queryURL);
		URLConnection connection = url.openConnection();
		InputStream is = connection.getInputStream();

		// 3. 질의결과 받기
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(is);

		// 4. 파싱
		Element root = doc.getDocumentElement();

		if("jobSearch".equals(root.getNodeName())){
	    	NodeList nodelist =  root.getChildNodes();

			for(int i=0; i<nodelist.getLength(); i++){
	        	// root node중 item node만  처리
	        	Node item = nodelist.item(i);

	        	if("list".equals(item.getNodeName())) {
	        		// list만 처리
					NodeList itemList = item.getChildNodes();

	        		count = item.getAttributes().getNamedItem("totalCount").getNodeValue();

			        html = "<table class=\"table_t5\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"540\" height=\"34\" background=\"http://career.go.kr/images/01_job/1_dic/01_list_bg_t_1.gif\">"+
	    			"<tr>"+
  					"<td width=\"44\">"+
  					"<p align=\"center\"><font color=\"white\">번호</font></p>"+
        			"</td>"+
        			"<td width=\"135\">"+
            		"<p align=\"center\"><font color=\"white\">직업명</font></p>"+
       	 			"</td>"+
        			"<td width=\"120\">"+
            		"<p align=\"center\"><font color=\"white\">분야</font></p>"+
        			"</td>"+
        			"<td width=\"241\">"+
            		"<p align=\"center\"><font color=\"white\">유사직업</font></p>"+
        			"</td>"+
    				"</tr>"+
					"</table>";

					html += "<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"540\" height=\"34\">";
					for(int j=0; j<itemList.getLength(); j++){

						Node items = itemList.item(j);

						if("content".equals(items.getNodeName())){
							// content만 처리
							NodeList itemList2 = items.getChildNodes();

							Node rnum = itemList2.item(1);
			             	Node jobdicSeq = itemList2.item(3);
			             	Node job = itemList2.item(5);
				            Node profession = itemList2.item(7);
				            Node similarJob = itemList2.item(9);

				            html += "<tr>" +
							"<td width=\"44\" class=\"board_td_sky\">"+
                    		"<p align=\"center\">"+rnum.getTextContent()+"</p>"+
      						"</td>"+
                			"<td width=\"135\" class=\"board_td_sky\">"+
                    		"<p align=\"left\"><a onclick=\"javascript:getDetail("+jobdicSeq.getTextContent()+",'','');\" title=\"상세보기\" style=\"cursor:pointer\">"+job.getTextContent()+"</a></p>"+
                			"</td>"+
                			"<td width=\"120\" class=\"board_td_sky\">"+
                   			"<p align=\"left\">"+profession.getTextContent()+"</p>"+
                			"</td>"+
                			"<td width=\"241\" class=\"board_td_sky\">"+
                    		"<p align=\"left\">"+similarJob.getTextContent()+"</p>"+
                			"</td>"+
                			"</tr>";

						}
					}

					if(itemList.getLength()==0){
						 html += "<tr>"+
                         "<td width=\"540\" height=\"150\">"+
                         "<p><font color=\"#FF320A\"><strong>검색결과</strong></font>가  없습니다.</p>"+
                         "</td>"+
                     	 "</tr>";

					}
					html += "</table>";
				}
	        }
		}

	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직업사전 OPEN-API 사용샘플</title>
<link rel="stylesheet" type="text/css" href="http://career.go.kr/css/career_job_link.css" />
<script type="text/javascript">
//---------------------------------
//제목 클릭시 (상세조회)
//---------------------------------
function getDetail(jobdicSeq,pgubn,job_nm){
	document.JobDicFrm.jobdicSeq.value = jobdicSeq;
	document.JobDicFrm.gubun.value 		= "job_dic_detail";
	document.JobDicFrm.action     		= "jobdicDetail_dom.jsp";
	document.JobDicFrm.submit();
}


</script>
</head>
<body>
<form name="JobDicFrm" method="post" >
	<input type="hidden" name="gubun" value="">
	<input type="hidden" name="jobdicSeq" value="">
</form>
<div align="center">
<table width="540" class="table_contents" cellpadding="0" cellspacing="0">
    <tr>
         <td width="540" height="30" bgcolor="#DEEEFE" style="border-top-width:1; border-bottom-width:1; border-top-color:rgb(153,153,153); border-bottom-color:rgb(153,153,153); border-top-style:solid; border-bottom-style:solid;">
			 <p>&nbsp;&nbsp;<img src="http://career.go.kr/images/01_job/1_dic/dot_blue.gif" width="9" height="10" border="0" alt="">총 <font color="#CC6600"><b><%=count%></b></font>건이 검색되었습니다.</p>
		</td>
	</tr>
    <tr>
        <td width="540" valign="top" align="center">
			<%=html%>
		</td>
	</tr>
	<tr>
		<td height="50"></td>
	</tr>
</table>
</div>
</body>
</html>

