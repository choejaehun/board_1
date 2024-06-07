<%@ page import="connector.MysqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="model.UserDTO" %>
<%@ page import="controller.UserController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MysqlConnector connector = new MysqlConnector();
    BoardController boardController = new BoardController(connector);


    String title = request.getParameter("title");
    String content = request.getParameter("content");
    BoardDTO boardDTO = new BoardDTO();

    boardDTO.setId(boardDTO.getId());
    boardDTO.setTitle(title);
    boardDTO.setContent(content);


    boardController.update(boardDTO);


%>
</body>
</html>
