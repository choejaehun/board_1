<%@ page import="connector.MysqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 6. 7.
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 개별보기</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    MysqlConnector connector = new MysqlConnector();
    BoardController boardController = new BoardController(connector);
    BoardDTO boardDTO = boardController.selectOne(id);
    if(boardDTO != null) {
%>
<h1>제목: <%=boardDTO.getTitle()%></h1> <br/>
<h2>글번호: <%=boardDTO.getId()%></h2> <br/>
<h2>작성자: <%=boardDTO.getNickname()%></h2> <br/>
<h2>작성일: <%=boardDTO.getEntrydate()%></h2> <br/>
<h2>수정일: <%=boardDTO.getModifydate()%></h2> <br/>
<hr>
<h3><%=boardDTO.getContent()%></h3>
<%
    } else {

%>
<h1>해당 글 번호는 유효하지 않습니다.</h1>
<%
    }
%>
</body>
</html>
