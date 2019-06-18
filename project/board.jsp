<body>
<h3>게시판</h3>
<form action="boardread.jsp" method="post">
<table>
<tr bgcolor='lightblue'>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>
<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet res = null;
  int i;
  String idno;
  String url = "jdbc:mysql://localhost:3306/kimjino1527";
  String id="kimjino1527";             // MySql DB login id
  String pww="Rlawlsdn2";       // MySql DB 암호
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(url,id,pww);
  stmt = conn.createStatement();
  String q="";

  String na=request.getParameter("na");
  if(na!=null) {
    String co = request.getParameter("co");
    String da = request.getParameter("da");
    String ip = request.getParameter("ip");
    String pw = request.getParameter("pw");
    q = "insert into board (name,content,date,ip,pw) values(\"";
    q += na + "\",\"" + co + "\",\"" + da + "\",\"" + ip;
    q += "\",password(\"" + pw + "\"))";
 // out.println(q+":"+"<br>");
      stmt.executeUpdate(q);
    }
  //    q = "show columns from board";
    q = "select id, name, watch from board";
    res = stmt.executeQuery(q);
    ResultSetMetaData rmd = res.getMetaData();
    int nf = rmd.getColumnCount();
    out.println("<tr bgcolor='lightblue'>");
    for(i=1; i<=nf; i++)
    out.print("<th>"+rmd.getColumnName(i)+"</th>");
    out.println("</tr>\n");
	
    while( res.next() ) {  // not completed....
      out.print("<tr bgcolor='honeydew'>");
      for(i=1; i<=nf; i++){
	if(i==1){
	 out.print("<td><a href=\"boardread.jsp?idno=" + res.getString(i)  + " \">"+res.getString(i)+"</a></td>");
 	}else{
         out.print("<td>"+res.getString(i)+"</td>");		
       } 
      }
   	 out.println("</tr>\n");
    }

  %>
  </table>
</form>
  <p>
     <a href="boardwrite.jsp">[글쓰기]</a>
     <a href="boarddel.jsp">[글삭제]</a>
  </body>
