package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class librariancheck {
	public static boolean resu(String name,String pswd)
	{  boolean status=false;
		try{
		Connection conn=DBConn.getConnection();
		String s="Select * from librarian where USERNAME=? and PASSWORD=?";
		System.out.println("--------------------------------------------------------------");
		PreparedStatement ps=conn.prepareStatement(s);
		ps.setString(1, name);
		ps.setString(2, pswd);
		System.out.println(name+pswd);
		ResultSet rs=ps.executeQuery();
		System.out.println(status+"----------------------------");
		status= rs.next();
		}
		catch(Exception e)
		{
			System.out.println("error"+e);
		}
		return status;
	}
}
