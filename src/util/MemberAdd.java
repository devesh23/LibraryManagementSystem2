package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberAdd {
    static int i=0;
	public static int adduser(MemberBean mb)
	{ System.out.println(i +"------------------------------------------------------");
		Connection conn=DBConn.getConnection();
		PreparedStatement stmt;
		try {
			stmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?)");
		 
		stmt.setString(1, mb.getUsername());
		stmt.setString(2, mb.getName());
		stmt.setString(3, mb.getEmail());
		stmt.setString(6, mb.getPhoneNumber());
		stmt.setString(5, mb.getUsername());
		stmt.setString(4, mb.getPassword());
		 i=stmt.executeUpdate(); 
		 System.out.println(i +"--------------------------------------------");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return i;
	}
}
