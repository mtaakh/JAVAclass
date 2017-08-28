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

	String job_nm = "";		// 직업명
	String ability_nm = "";	// 핵심능력
	String similarJob_nm = ""; // 유사직업
	String specificity_nm = "";// 특성
	String aptitude_nm  = "";	// 적성및흥미
	String employment_nm = "";// 취업현황
	String preparation_nm = "";// 준비방법
	String possibility_nm = "";// 전망
	String major_nm = "";// 관련학과
	String capacity_nm  = "";// 관련자격
	String contact_nm = "";// 문의기관
	String division_nm = "";// 분류

	String jobdicSeq = request.getParameter("jobdicSeq");

	try{
		String queryURL = "http://career.go.kr/OpenApi/JobDicRequest.do?apikey=ac005861aef421b3570b4dde9a569157&gubun=job_dic_detail&jobdicSeq="+jobdicSeq;

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
	    	// node 전체 순회
			for(int i=0; i<nodelist.getLength(); i++){
	        	// root node중 item node만  처리
	        	Node item = nodelist.item(i);

	        	if("content".equals(item.getNodeName())) {
	        		// list만 처리
					NodeList itemList = item.getChildNodes();

					Node job = itemList.item(1);		// 직업명
					Node ability = itemList.item(3);	// 핵심능력
					Node similarJob = itemList.item(5); // 유사직업
					Node specificity = itemList.item(7);// 특성
					Node aptitude  = itemList.item(9);	// 적성및흥미
					Node employment = itemList.item(11);// 취업현황
					Node preparation = itemList.item(13);// 준비방법
					Node possibility = itemList.item(15);// 전망
					Node major = itemList.item(17);// 관련학과
					Node capacity  = itemList.item(19);// 관련자격
					Node contact = itemList.item(21);// 문의기관
					Node division = itemList.item(23);// 분류


					job_nm = job.getTextContent();
					ability_nm = ability.getTextContent();
					similarJob_nm = similarJob.getTextContent();
					specificity_nm = specificity.getTextContent();
					aptitude_nm = aptitude.getTextContent();
					employment_nm = employment.getTextContent();
					preparation_nm = preparation.getTextContent();
					possibility_nm = possibility.getTextContent();
					major_nm = major.getTextContent();
					capacity_nm = capacity.getTextContent();
					contact_nm = contact.getTextContent();
					division_nm = division.getTextContent();
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

</script>
</head>
<body>
<div align="center">
<table width="600" class="table_contents" cellpadding="0" cellspacing="0">
    <tr>
        <td width="600" valign="top" align="center">
			   <table cellpadding="0" cellspacing="0" width="600" class="table_t10" height="71" background="http://career.go.kr/images/01_job/1_dic/01_bg_tit_img1_1.gif">
                <tr>
                    <td width="600" valign="top">
                            <table class="table_t15" align="center" cellpadding="0" cellspacing="0" width="580">
                                <tr>
                                    <td width="32" height="13">
                                        <p><img src="http://career.go.kr/images/01_job/1_dic/01_icon_saram.gif" width="24" height="24" border="0" alt="직업"></p>
                                    </td>
                                    <td width="*" height="13">
                                        <p><strong><span id="job"><%=job_nm %></span></strong></p>
                                    </td>
                                 </tr>
                            </table>
                    </td>
                </tr>
            </table>
			<table cellpadding="0" cellspacing="0" width="600">
              <!-- 핵심능력 -->
	            <tr>
	                <td width="580" colspan="2">
	                    <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_13.gif" width="157" height="21" border="0" alt="핵심능력"></p>
	                </td>
	            </tr>
                <tr>
	                <td width="20" style="padding-top:12;" valign="top">
	                    <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
	                </td>
	                <td width="580" class="td_basic_content">
	                    <p><span id="ability"><%=ability_nm%></span></p>
	                </td>
	            </tr>

               <!-- 유사 직업명 -->
                 <tr>
                     <td width="580" colspan="2">
                         <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_1.gif" width="157" height="21" border="0" alt="유사직업명"></p>
                     </td>
                 </tr>
                 <tr>
                     <td width="20" style="padding-top:12;" valign="top">
                         <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
                     </td>
                     <td width="580" class="td_basic_content">
                         <p><span id="similarJob"><%=similarJob_nm %></span></p>
                     </td>
                 </tr>

				<!-- 특성 -->
                  <tr>
                      <td width="580" colspan="2" class="td_space_t10">
                          <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_2.gif" width="157" height="21" border="0" alt="특성"></p>
                      </td>
                  </tr>
                  <tr>
                      <td width="20" valign="top" style="padding-top:12;">
                          <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
                      </td>
                      <td width="580" class="td_basic_content" valign="top">
                          <p><span id="specificity"><%=specificity_nm%></span></p>
                      </td>
                  </tr>
  				<!-- 적성 및 흥미 -->
                  <tr>
                      <td width="580" colspan="2" class="td_space_t10">
                          <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_3.gif" width="157" height="21" border="0" alt="적성 및 흥미"></p>
                      </td>
                  </tr>
                  <tr>
                      <td width="20" valign="top" style="padding-top:12;">
                          <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
                      </td>
                      <td width="580" class="td_basic_content" valign="top">
                          <p><span id="aptitude"><%=aptitude_nm%></span></p>
                      </td>
                  </tr>

				<!-- 취업현황 -->
                  <tr>
                      <td width="580" colspan="2" class="td_space_t10">
                          <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_4.gif" width="157" height="21" border="0" alt="취업현황"></p>
                      </td>
                  </tr>

          		<tr>
                  <td width="20" valign="top" style="padding-top:12;">
                      <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
                  </td>
                  <td width="580" class="td_basic_content" valign="top">
                      <p><span id="employment"><%=employment_nm%></span></p>
                  </td>
                </tr>

               <!-- 준비방법 -->
	  			<tr>
	                  <td width="580" colspan="2" class="td_space_t10">
	                      <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_5.gif" width="157" height="21" border="0" alt="준비방법"></p>
	                  </td>
	             </tr>
	             <tr>
	                  <td width="20" valign="top" style="padding-top:12;">
	                      <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
	                  </td>
	                  <td width="580" class="td_basic_content" valign="top">
	                      <p><span id="preparation"><%=preparation_nm%></span></p>
	                  </td>
	             </tr>
                <!-- 전망 -->
      			  <tr>
                      <td width="580" colspan="2" class="td_space_t10">
                          <p><img src="http://career.go.kr/images/01_job/1_dic/01_subtit_dic_6.gif" width="157" height="21" border="0" alt="전망"></p>
                      </td>
                  </tr>
                  <tr>
                      <td width="20" valign="top" style="padding-top:12;">
                          <p align="right"><img src="http://career.go.kr/images/01_job/dot_s6.gif" width="5" height="6" border="0" alt=""></p>
                      </td>
                      <td width="580" class="td_basic_content" valign="top">
                          <p><span id="possibility"><%=possibility_nm%></span></p>
                      </td>
                  </tr>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>