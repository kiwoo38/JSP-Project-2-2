package org.example.project22.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {

                Class.forName("org.mariadb.jdbc.Driver");

                con = DriverManager.getConnection(
                        "jdbc:mariadb://walab.handong.edu:3306/W25_22200816",
                        "W25_22200816",
                        "Baa8ge"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
//    public static void main(String[] args) {
//        Connection conn = getConnection();
//        if(conn != null) {
//            System.out.println("DB 연결 성공!");
//        }
//    }

}
