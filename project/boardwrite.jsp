<body>
<h3>글 쓰 기</h3>
<form action="board.jsp" method=post>
 name: <input type="text" name="na" value="test"><br>
 Content: <input type="text" name="co" value="test"><br>
 password: <input type="password" name="pw" value="test"><br>
<%@ page import="java.util.*" %>
<%
  Date date = new Date();
  String d = String.valueOf(date);
  String ip = request.getRemoteAddr();
  out.println("IP: "+ip+"<br>Date: "+d);
%>
   <input type=hidden name="da" value="<%=d %>"><br>
   <input type=hidden name="ip" value="<%=ip%>">
   <input type=submit> <input type=reset>
 </form>
 <p><a href="board.jsp">[게시판으로]</a>
 <body>
