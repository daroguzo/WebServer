<body>
<h3>글 수정</h3>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>
<%
  String q="";
  String idno = request.getParameter("idno");
  String input = request.getParameter("main");
  if(input!=null) {
    String pw=request.getParameter("pw");
    q = "update board set content=\"" + input + "\" where id=\"" + idno + "\" and pw=";
    q += "password(\"" + pw + "\")";
    Connection conn = null;
    Statement stmt = null;
    ResultSet res = null;
    String url = "jdbc:mysql://localhost:3306/kimjino1527";
    String id="kimjino1527";             // MySql DB login id
    String pww="Rlawlsdn2";       // MySql DB 암호
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(url,id,pww);
    stmt = conn.createStatement();
    int r=stmt.executeUpdate(q);
    if(r==0) out.println("Update Failed!: "+q+"<p>");
    else out.println("Successfully update the record " + idno + ", " + res + "<p>");
  }
%>
<form action="boardmodi.jsp" method="post">

암호를 입력하세요: <input type=password name="pw"><br><br>
<input type=text name="main" size="40" placeholder="내용을 입력하세요"  style="height:400px"><br><br>
<input type=hidden name="idno" value="<%=idno%>">
 <input type=submit> <input type=reset>
 </form>
	<p><a href="boardread.jsp?idno=<%=idno%>">[본문으로]</a>
         </body>
