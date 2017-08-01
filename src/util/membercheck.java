package util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class membercheck {
	public static boolean resu(String name,String pswd)
	{  boolean status=false;
		try{
		Connection conn=DBConn.getConnection();
		String s="Select * from member where USER_ID=? and PASSWORD=?";
		System.out.println("--------------------------------------------------------------");
		PreparedStatement ps=conn.prepareStatement(s);
		ps.setString(1, name);
		ps.setString(2, pswd);
		System.out.println(name+pswd);
		ResultSet rs=ps.executeQuery();
		status= rs.next();
		System.out.println(status+"----------------------------");
		}
		catch(Exception e)
		{
			System.out.println("error");
		}
		return status;
	}
}

