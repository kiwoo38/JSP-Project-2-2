package org.example.project22.dao;

import org.example.project22.bean.BoardVO;
import org.example.project22.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT ="insert into BOARD (title,writer,content) values(?,?,?)";
    private final String BOARD_LIST ="select * from BOARD order by regdate desc";
    private final String BOARD_SEARCH_TITLE =
            "select * from BOARD where title like ? order by regdate desc";
    private final String BOARD_SEARCH_WRITER =
            "select * from BOARD where writer like ? order by regdate desc";

    private final String BOARD_DELETE = "delete from BOARD where seq=?";

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
    public List<BoardVO> getBoardList(){
        List<BoardVO> list = new ArrayList<BoardVO>();
        System.out.println("===> JDBC로 getBoardList()기능 처리");
        try{
            conn= JDBCUtil.getConnection();
            stmt=conn.prepareStatement(BOARD_LIST);
            rs=stmt.executeQuery();
            while(rs.next()){
                BoardVO one = new BoardVO();
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setRegdate(rs.getString("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public List<BoardVO> searchBoard(String type, String keyword) {
        List<BoardVO> list = new ArrayList<>();

        try {
            conn = JDBCUtil.getConnection();

            String sql = "title".equals(type) ? BOARD_SEARCH_TITLE : BOARD_SEARCH_WRITER;
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");

            rs = stmt.executeQuery();
            while (rs.next()) {
                BoardVO one = new BoardVO();
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setRegdate(rs.getString("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int deleteBoard(int seq) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, seq);
            int result = stmt.executeUpdate();
            return result;   // 1이면 성공, 0이면 실패
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (Exception e) {}
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
