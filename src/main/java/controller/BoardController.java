package controller;

import connector.MysqlConnector;
import model.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardController {
    private Connection connection;

    public BoardController(MysqlConnector connector) {
        connection = connector.makeConnection();
    }

    public BoardDTO boardDTO() {
        BoardDTO result = null;
        String query = "SELECT * FROM board";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultset = preparedStatement.executeQuery();
            if (resultset.next()) {
                result = new BoardDTO();
                result.setId(resultset.getInt("id"));
                result.setTitle(resultset.getString("title"));
                result.setContent(resultset.getString("content"));
                result.setWriter_id(resultset.getInt("writer_id"));



            }

        }
        catch (SQLException e) {
            e.printStackTrace() ;

        }
        return result;
    }
}
