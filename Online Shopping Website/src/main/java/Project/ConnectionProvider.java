package Project;
import java.sql.*;

public class ConnectionProvider {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping", "root", "november21:)");
			return con;
		}
		catch(Exception e) {
			System.out.print(e);
			return null;
		}
	}

}
