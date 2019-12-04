package good;
import java.sql.*;

public class ProcedureCall {
	public static void main(String[] argv)
	{
		Connection conn;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:XE", 
					"user", "user");
		
		CallableStatement cs;
		
		cs = conn.prepareCall("{call resv_room (?, ?, ?, ?, ?)}");

		
		cs.setString(1, "010-1111-1111");
		cs.setString(2, "487");
		cs.setString(3,"luxury");
		cs.setString(4, "Single");
		cs.setString(5, "서울고구려");
		cs.executeUpdate();



		cs.close();
		conn.close();
	}catch(Exception e)
         {e.printStackTrace();}
  }
}
