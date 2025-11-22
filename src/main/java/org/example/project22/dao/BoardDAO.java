package org.example.project22.dao;

import org.example.project22.bean.BoardVO;
import org.example.project22.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT ="insert into BOARD (title,writer,content) values(?,?,?)";

    public int insertBoard(BoardVO vo){
        try{
            conn= JDBCUtil.getConnection();
            stmt=conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1,vo.getTitle());
            stmt.setString(2,vo.getWriter());
            stmt.setString(3,vo.getContent());
            stmt.executeUpdate();
            return 1;
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }

//    public static void main(String[] args) {
//        BoardVO vo=new BoardVO("글 제목입니다.","Sally","글 내용입니다.");
//        BoardDAO dao=new BoardDAO();
//        int result= dao.insertBoard(vo);
//        if(result ==1){
//            System.out.println("데이터 추가 완료!");
//        }
//    }
}
