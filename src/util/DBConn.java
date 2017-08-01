package util;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConn {

   public static Connection getConnection(){
	Connection conn=null;
	try{
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  System.out.println("Driver is loaded");
		  conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "root");
		  System.out.println("Connected");
	     
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 return conn;	
   }
}
