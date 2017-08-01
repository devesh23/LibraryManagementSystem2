package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddBook {
	static int i=0;
	public static int addbook(BookBean mb)
	{ System.out.println(i +"------------------------------------------------------");
		Connection conn=DBConn.getConnection();
		PreparedStatement stmt;
		try {
			String ll="no";
			stmt = conn.prepareStatement("insert into book values(?,?,?,?,?,?,?)");
		stmt.setInt(1, mb.getNum());
		stmt.setString(2, mb.getName());
		stmt.setString(3, mb.getAuthor());
		stmt.setString(4, ll);
		stmt.setString(5, mb.getPublication());
		stmt.setString(6, mb.getEdition());
		stmt.setInt(7, Integer.parseInt(mb.getCost()));
		 i=stmt.executeUpdate(); 
		 System.out.println(i +"--------------------------------------------");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return i;
	}
}
