<body>
<h3>내용 읽기</h3>
<table>
<tr bgcolor='lightblue'>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>
<%
  String idno = request.getParameter("idno");


  Connection conn = null;
  Statement stmt = null;
  String url = "jdbc:mysql://localhost:3306/kimjino1527";
  String id="kimjino1527";             // MySql DB login id
  String pww="Rlawlsdn2";       // MySql DB 암호


  // 조회수 값 가져오기
  int watch=0;
  String stringWatch = null;
  ResultSet res2 = null;
  ResultSet res3 = null;

  try {
    Class.forName("com.mysql.jdbc.Driver"); //mysql을 사용
    conn = DriverManager.getConnection(url,id,pww); //아이디, 비밀번호, 주소를 넣고 연결
    stmt = conn.createStatement();
    res2 = stmt.executeQuery("select watch from board where id="+idno);
    while( res2.next() ) {
       watch = Integer.parseInt(res2.getString(1)); 
    }
   }catch(SQLException e) {       //try문 종료
    out.println(e.getMessage());
   }
   finally {
     if(res2 != null)try{res2.close();}catch(SQLException ex){}
     if(stmt != null)try{stmt.close();}catch(SQLException ex){}
     if(conn != null)try{conn.close();}catch(SQLException ex){}
   }
  watch += 1;

  stringWatch = Integer.toString(watch);

  try {
     Class.forName("com.mysql.jdbc.Driver"); //mysql을 사용
     conn = DriverManager.getConnection(url,id,pww); //아이디, 비밀번호, 주소를 넣고 연결
     stmt = conn.createStatement();
     stmt.executeUpdate("update board set watch=\"" + stringWatch  + "\" where id=" + idno);
     
    }catch(SQLException e) {       //try문 종료
     out.println(e.getMessage());
    }
    finally {
      if(res3 != null)try{res3.close();}catch(SQLException ex){}
      if(stmt != null)try{stmt.close();}catch(SQLException ex){}
      if(conn != null)try{conn.close();}catch(SQLException ex){}
    }

  conn = null;
  stmt = null;
  ResultSet res = null;
  int i;
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(url,id,pww);
  stmt = conn.createStatement();

 
  String q="select id, name, content, date, ip, pw, watch from board where id=" + idno;
  res = stmt.executeQuery(q);
  ResultSetMetaData rmd = res.getMetaData();
  int nf = rmd.getColumnCount();
  out.println("<tr bgcolor='lightblue'>");
  for(i=1; i<=nf; i++)
    out.print("<th>"+rmd.getColumnName(i)+"</th>");
  out.println("</tr>\n");

  while( res.next() ) {  // not completed....
    out.print("<tr bgcolor='honeydew'>");
    for(i=1; i<=nf; i++) out.print("<td>"+res.getString(i)+"</td>");
    out.println("</tr>\n");
  }
%>
</table>
<br><br>
 <h3> 댓 글</h3><br>
<table>
<tr bgcolor='lightblue'>
<%
  int j;
  ResultSet res4 = null;
  String q4="select * from reply where id = " + idno;
  res4 = stmt.executeQuery(q4);
  ResultSetMetaData rmd2 = res4.getMetaData();
  int nf2 = rmd2.getColumnCount();
  out.println("<tr bgcolor='lightblue'>");
  for(j=1; j<=nf2; j++)
    out.print("<th>"+rmd.getColumnName(j)+"</th>");
  out.println("</tr>\n");

  while( res4.next() ) {  // not completed....
    out.print("<tr bgcolor='honeydew'>");
    for(j=1; j<=nf2; j++) out.print("<td>"+res4.getString(j)+"</td>");
    out.println("</tr>\n");
  }
%>
</table>

<p><a href="board.jsp">[게시판으로]</a>
   <a href="boardmodi.jsp?idno=<%=idno%>">[글 수정]</a>
   <a href="boardreply.jsp?idno=<%=idno%>">[댓글 쓰기]</a>
</body>
