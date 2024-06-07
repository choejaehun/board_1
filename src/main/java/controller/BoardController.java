package controller;

import com.mysql.cj.protocol.Resultset;
import connector.MysqlConnector;
import model.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardController {
    private Connection connection;

    public BoardController(MysqlConnector connector) {
        connection = connector.makeConnection();
    }

   public ArrayList<BoardDTO> selectAll() {
        ArrayList<BoardDTO> list = new ArrayList<>();

        String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id";
       try {
           PreparedStatement preparedStatement = connection.prepareStatement(query);
           ResultSet resultSet = preparedStatement.executeQuery();

           while(resultSet.next()) {
               BoardDTO boardDTO = new BoardDTO();
               boardDTO.setId(resultSet.getInt("id"));
               boardDTO.setTitle(resultSet.getString("title"));
               boardDTO.setContent(resultSet.getString("content"));
               boardDTO.setEntrydate(resultSet.getDate("entry_date"));
               boardDTO.setModifydate(resultSet.getDate("modify_date"));
               boardDTO.setNickname(resultSet.getString("nickname"));
               boardDTO.setWriter_id(resultSet.getInt("writer_id"));

               list.add(boardDTO);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }


       return list;
   }
   public BoardDTO selectOne(int id) {
       String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id WHERE board.id = ?";

       try {
           PreparedStatement preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1, id);

           ResultSet resultSet = preparedStatement.executeQuery();

           while (resultSet.next()) {
               BoardDTO boardDTO = new BoardDTO();
               boardDTO.setId(resultSet.getInt("board.id"));
               boardDTO.setTitle(resultSet.getString("title"));
               boardDTO.setContent(resultSet.getString("content"));
               boardDTO.setEntrydate(resultSet.getDate("entry_date"));
               boardDTO.setModifydate(resultSet.getDate("modify_date"));
               boardDTO.setWriter_id(resultSet.getInt("writer_id"));
               boardDTO.setNickname(resultSet.getString("nickname"));

               return boardDTO;
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return null;
   }
   public void insert(BoardDTO boardDTO) {
        String query = "INSERT INTO board (title, content, writer_id) VALUES (?, ?, ?)";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, boardDTO.getTitle());
            preparedStatement.setString(2, boardDTO.getContent());
            preparedStatement.setInt(3, boardDTO.getWriter_id());
            preparedStatement.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
   }
   public void update(BoardDTO boardDTO) {
        String query = "UPDATE board SET title = ? , content = ? , writer_id = ? WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, boardDTO.getTitle());
            preparedStatement.setString(2, boardDTO.getContent());
            preparedStatement.setInt(3, boardDTO.getWriter_id());
            preparedStatement.setInt(4, boardDTO.getId());
            preparedStatement.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
   }
   public void delete(int id) {
        String query = "DELETE FROM board WHERE id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
   }
}
