<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.io.*,java.sql.*,java.util.*" %> 
<HTML>
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

}
</style>
<HEAD>
<SCRIPT language="javascript">
function check(){
 with(document.msgdel){		
  if(password.value.length == 0){
   alert("비밀번호를 입력해 주세요!!");
   password.focus();
   return false;
  }	
  document.msgdel.submit();
 }
}
</SCRIPT> 
<link href="freeboard.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="./jquery/jquery-3.5.1.js"></script>
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</HEAD>
<BODY>
<%@ include file="./navbar.jsp" %>
<%@ include file="./dbconn.jsp" %>
<FORM name="msgdel" method=post action=freeboard_deldb.jsp>
 <input type="hidden" name="id" value="<%=request.getParameter("id")%>"  >
 <input type="hidden" name="page" value="<%=request.getParameter("page")%>"  >
 <div class="container text-center" style="background-color:#FFFFFF">
	
  <div class="form-group row">
		<div class = "my-box" align="center" style = "background-color:#FFFFFF; margin-bottom :30px" ><A href="freeboard_list.jsp"><FONT color=black face=굴림 size=10><STRONG>Delete</STRONG></FONT></A></div>
		</div>
<div class="form-group row" style="margin-left:170px">
			
			<div class="col-5">
				<input type="password" id="password"  name="password" class="form-control"style="border-color:#000000; margin-left:190px; "placeholder="PassWord을 입력하세요"></div>
			
		</div>
	
		<div class="form-group row">
			<div class="col-12" style="display:inline-block; text-align:center;">
			<a href="freeboard_list.jsp?go=<%=request.getParameter("page")%> "><img src="image/list.jpg" width="48" height="19" border="0"class="img-fluid"></a>
			&nbsp;&nbsp;
			<a href="#" onClick="check();"><img src="image/del.jpg" width="46" height="19" border="0"class="img-fluid"></a>
			
					
			</div>                                                              
                                                         
   </div>
   </div>
   </FORM>
</BODY>
<%@ include file="./footer.jsp" %>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</HTML>