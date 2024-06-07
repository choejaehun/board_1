package model;

import lombok.Data;

import java.util.Date;

@Data
public class BoardDTO {
    private int id;
    private String title;
    private String content;
    private Date entrydate;
    private Date modifydate;
    private int writer_id;
    private String nickname;
}
