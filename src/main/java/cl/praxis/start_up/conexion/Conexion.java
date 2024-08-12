package cl.praxis.start_up.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static Connection connection = null;

    private Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/trabajadoresdb", "root", "mAcder");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static synchronized Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            new Conexion();
        }
        return connection;
    }
}
