<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<HTML>

<HEAD>
<style type="text/css">
.my-box { 
border:4px;
border-style:double none double none ;
padding:5px; 
color:black; 
width : 750;
display: block; 
margin-right: auto;
margin-left: auto;
margin-top: 60px;
}
</style>
<TITLE>게시판(검색모드)</TITLE>

<link href="fboard.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="./jquery/jquery-3.5.1.js"></script>
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<SCRIPT language="javascript">
function check(){
	  with(document.msgsearch){
	   if(sval.value.length == 0){
	    alert("검색어를 입력해 주세요!!");
	    sval.focus();
	    return false;
	   }	
	   document.msgsearch.submit();
	  }
	 }
	 function rimgchg(p1,p2) {
	  if (p2==1) 
	   document.images[p1].src= "image/open.gif";
	  else
	   document.images[p1].src= "image/arrow.gif";
	  }

	 function imgchg(p1,p2) {
	  if (p2==1) 
	   document.images[p1].src= "image/open.gif";
	  else
	   document.images[p1].src= "image/close.gif";
	 }
	</SCRIPT>
</HEAD>

<BODY>
<div class="container-fluid">
<%@ include file="./navbar.jsp" %>
<%@ include file="./dbconn.jsp" %>
<p>
<P><div class = "my-box" align="center"><A href="freeboard_list.jsp"><FONT color=black face=굴림 size=10><STRONG>우리 한번 대화나 해볼까?</STRONG></FONT></A></div></p>
<br>
<div align=right><A href="freeboard_write.jsp"><img src="./image/Pencil.JPG" width="50" height="50" class="img-fluid"></A></div>

     <FORM method=post name=search action="freeboard_search.jsp">
 <TABLE border=0 width=80%>
  
  
    
     <SELECT style="display:none" name=stype >
<% 
 String cond = null;
 int what = 1;
 String val=null;  
 if (request.getParameter("stype") != null) {
  what = Integer.parseInt(request.getParameter("stype"));
  val= request.getParameter("sval");
  if (what==1) {
   out.println("<OPTION value=1 selected>이름");
   cond = " where name like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=1 >이름");
  if (what==2) {
   out.println("<OPTION value=2 selected>제목");
   cond = " where subject like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=2>제목");
  if (what==3) { 
   out.println("<OPTION value=3 selected>내용");
   cond = " where content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=3>내용");
  if (what==4) {
   out.println("<OPTION value=4 selected>이름/제목");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=4>이름/제목");
  if (what==5) {
   out.println("<OPTION value=5 selected>이름/내용");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=5>이름/내용");
  if (what==6) {
   out.println("<OPTION value=6 selected>제목/내용");
   cond = " where subject  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=6>제목/내용");
  if (what==7) {
   out.println("<OPTION value=7 selected>이름/제목/내용");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=7>이름/제목/내용");
  if (val.trim().equals(""))
   cond = "";
 }
 
%>
     </SELECT>
	
  
 </TABLE>
</FORM>
<CENTER>
 <TABLE class="table" width="80">
  <thead>
     <tr class="b-hed" align="center" bgcolor =#2C2C2C>
      <th scope="col"><FONT color=#FFFFFF>번호</th></FONT>
      <th scope="col" width="300"><FONT color=#FFFFFF>제목</th></FONT>
      <th scope="col"><FONT color=#FFFFFF>등록자</th></FONT>
      <th scope="col"><FONT color=#FFFFFF>날짜</th></FONT>
      <th scope="col"><FONT color=#FFFFFF>조회</th></FONT>
      <td scope="col"><FONT color=#FFFFFF>감춤</th></FONT>
    </tr>
  </thead>



<% 
 Vector name=new Vector();
 Vector inputdate=new Vector();
 Vector email=new Vector();
 Vector subject=new Vector();
 Vector rcount=new Vector();
 Vector keyid=new Vector();
 Vector step=new Vector();
 
 int where=1;

 int totalgroup=0;
 int maxpages=2;
 int startpage=1;
 int endpage=startpage+maxpages-1;
 int wheregroup=1;
 
 if (request.getParameter("go") != null) {
  where = Integer.parseInt(request.getParameter("go"));
  wheregroup = (where-1)/maxpages + 1;
  startpage=(wheregroup-1) * maxpages+1;  
  endpage=startpage+maxpages-1; 
 } else if (request.getParameter("gogroup") != null) {
  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
  startpage=(wheregroup-1) * maxpages+1;  
  where = startpage ; 
  endpage=startpage+maxpages-1; 
 }
 int nextgroup=wheregroup+1;
 int priorgroup= wheregroup-1;
 
 int nextpage=where+1;
 int priorpage = where-1;
 int startrow=0;
 int endrow=0;
 int maxrows=5;
 int totalrows=0;
 int totalpages=0;
 
 int id=0;
 
 String em=null;
// Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
 
 try {
  st = con.createStatement();
  String sql = "select * from freeboard " + cond;
  sql = sql + " order by id desc" ;
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("해당하는 글이 없습니다");
  } else {
   do {
    keyid.addElement(new Integer(rs.getInt("id")));
    name.addElement(rs.getString("name"));
    email.addElement(rs.getString("email"));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    inputdate.addElement(idate);
    subject.addElement(rs.getString("subject"));
    rcount.addElement(new Integer(rs.getInt("readcount")));
    step.addElement(new Integer(rs.getInt("step")));
   }while(rs.next());
   totalrows = name.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;

   for(int j=startrow;j<=endrow;j++) {
    String temp=(String)(email.elementAt(j));
    if ((temp == null) || (temp.equals("")) ) 
     em= (String)name.elementAt(j); 
    else
     em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";
    id= totalrows-j;
    if(j%2 == 0){
        out.println("<TR bgcolor='#2C2C2C' onMouseOver=\" bgColor= '#bdbebd'\" onMouseOut=\"bgColor='#2C2C2C'\"><TR FONT color='#FFFFFF'>");	
       } else {
        out.println("<TR bgcolor='#2C2C2C' onMouseOver=\" bgColor= '#bdbebd'\" onMouseOut=\"bgColor='#2C2C2C'\"><TR FONT color='#FFFFFF'>");
       } 
       out.println("<TD  class=\"b-hed\" align=center><FONT color=#000000>");
       out.println(id+"</TD>");
       out.println("<TD class=\"b-hed\" align=center><FONT color=#000000>");
       int stepi= ((Integer)step.elementAt(j)).intValue();
       int imgcount = j-startrow; 
       if (stepi > 0 ) {
        for(int count=0; count < stepi; count++)
         out.print("&nbsp;&nbsp;");
        out.println("<IMG name=icon"+imgcount+ " src=image/arrow.gif>");
        out.print("<A href=freeboard_read.jsp?id=");
        out.print(keyid.elementAt(j) + "&page=" + where );
        out.print(" onmouseover=\"rimgchg(" + imgcount + ",1)\"");
        out.print(" onmouseout=\"rimgchg(" + imgcount + ",2)\">");
       } else {
        
        out.print("<A href=freeboard_read.jsp?id=");
        out.print(keyid.elementAt(j) + "&page=" + where );
        out.print(" onmouseover=\"imgchg(" + imgcount + ",1)\"");
        out.print(" onmouseout=\"imgchg(" + imgcount + ",2)\">");
       }
       out.println(subject.elementAt(j) + "</a></TD>");
       out.println("<TD class=\"b-hed\" align=center><FONT color=#000000>");
       out.println(em+ "</TD>");
       out.println("<TD class=\"b-hed\" align=center><FONT color=#000000>");
       out.println(inputdate.elementAt(j)+ "</TD>");
       out.println("<TD class=\"b-hed\" align=center><FONT color=#000000>");
       out.println(rcount.elementAt(j)+ "</TD>");
    // 추가    
       out.println("<td>"); 

       if (stepi > 0 ) {
           for(int count=0; count < stepi; count++)
//            out.print("&nbsp;&nbsp;");
           out.println("<div class=\"container_div\"><IMG name=icon"+imgcount+ " src=image/arrow.gif>");
           out.print("<A href=freeboard_read.jsp?id=");
           out.print(keyid.elementAt(j) + "&page=" + where );
           out.print(" onmouseover=\"rimgchg(" + imgcount + ",1)\"");
           out.print(" onmouseout=\"rimgchg(" + imgcount + ",2)\">");
          } else {
           out.println("<div class=\"container_div\"><IMG name=icon"+imgcount);
           out.print("<A href=freeboard_read.jsp?id=");
           out.print(keyid.elementAt(j) + "&page=" + where );
           out.print(" onmouseover=\"imgchg(" + imgcount + ",1)\"");
           out.print(" onmouseout=\"imgchg(" + imgcount + ",2)\">");
          }
       out.println(subject.elementAt(j) + "</a>");
       out.println("<div class=\"container_div\" align=\"right\"><small>");
       out.println(em+ "&nbsp;&nbsp; | &nbsp;&nbsp;");
       out.println(inputdate.elementAt(j)+ "&nbsp;&nbsp; | &nbsp;&nbsp;조회수 : ");
       out.println(rcount.elementAt(j)+ "</small></div>");
       out.println("</div>");  
       out.println("</TD>");
   //추가 끝    
       
       out.println("</TR>");
      }
      rs.close();
     }
     out.println("</TABLE>");
     st.close();
     con.close();
    } catch (java.sql.SQLException e) {
     out.println(e);
    } 
 if (wheregroup > 1) {
  out.print("[<A href=freeboard_search.jsp?gogroup=1"); 
  out.print("&stype="+ what+"&sval=" + val +">처음</A>]");
  out.print("[<A href=freeboard_search.jsp?gogroup="+priorgroup);
  out.print("&stype="+ what+"&sval=" + val +">이전</A>]");
 } else {
  out.println("[처음]") ;
  out.println("[이전]") ;
 }
 if (name.size() !=0) {
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
   out.print("[<A href=freeboard_search.jsp?go="+jj);
   out.print("&stype="+ what+"&sval=" + val +">" + jj + "</A>]") ;
   }
  }
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=freeboard_search.jsp?gogroup="+ nextgroup);
  out.print("&stype="+ what+"&sval=" + val +">다음</A>]");
  out.print("[<A href=freeboard_search.jsp?gogroup="+totalgroup); 
  out.print("&stype="+ what+"&sval=" + val +">마지막</A>]");
 } else {
  out.println("[다음]");
  out.println("[마지막]");
 }
 out.println ("검색된 글 수 :"+totalrows);
 out.println("</CENTER>");
%>
<br><br>
	<FORM class="form-inline" method="post" name="msgsearch" action="freeboard_search.jsp">
	<div class="container-fluid row">
		<div class="col-sm-3"></div>
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-2">
					<SELECT class="form-select" name="stype">
			    		<OPTION value=1 >이름
			    		<OPTION value=2 >제목
			    		<OPTION value=3 >내용
			    		<OPTION value=4 >이름+제목
			    		<OPTION value=5 >이름+내용
			    		<OPTION value=6 >제목+내용
			    		<OPTION value=7 >이름+제목+내용
			   		</SELECT>
			   	</div>
			   	<div class="col-sm-5">
		   			<input class="form-control" type=text  name="sval" placeholder="내용을 입력하세요"></input>
		   		</div>
		   		<div class="col-sm-5">
		   			<a href="#" onClick="check();"><button type="button" class="btn btn-Secondary" style="width:30%;">검색</button></a>
		   		</div>
		   	</div>
			<br>
		</div>
		<div class="col-sm-1"></div>
	</div>
	</FORM>
</div>
</BODY>
<%@ include file="./footer.jsp" %>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</HTML>