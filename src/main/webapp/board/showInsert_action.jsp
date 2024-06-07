<%@ page import="model.BoardDTO" %>
<%@ page import="controller.BoardController" %>
<%@ page import="connector.MysqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int writer_id = Integer.parseInt(request.getParameter("writer_id"));

    BoardDTO boardDTO = new BoardDTO();
    boardDTO.setTitle(title);
    boardDTO.setContent(content);
    boardDTO.setWriter_id(writer_id);

    MysqlConnector connector = new MysqlConnector();
    BoardController boardController = new BoardController(connector);

    boardController.insert(boardDTO);

    response.sendRedirect("/board/showList.jsp");

%>
</body>
</html>
