<body>
<h3>글삭제</h3>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>
<%
  String q="";
  String de=request.getParameter("de");
  if(de!=null) {
    String pw=request.getParameter("pw");
    q = "delete from board where id=\"" + de + "\" and pw=";
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
    if(r==0) out.println("Failed deletion: "+q+"<p>");
    else out.println("Successfully deleted the record " + de + ", " + res + "<p>");
  }
%>
<form action="boarddel.jsp" method="post">
삭제할 번호(id)를 입력하세요: <input type=text name="de"><br>
암호를 입력하세요: <input type=password name="pw">
 <input type=submit> <input type=reset>
 </form>
 <p><a href="board.jsp">[게시판으로]</a>
      </body>
