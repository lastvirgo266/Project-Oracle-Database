import java.sql.*;

//예약자 명단 출력
public class selectTable {
	public static void main(String[] argv)
	{
		Connection conn;
		Statement stmt;
		ResultSet rs;
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:XE", 
				"user", "user");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM reservation");
			
			while(rs.next())
			{
				String no = rs.getString("resv_no");
				String name = rs.getString("resv_name");	
				String phone = rs.getString("resv_phonenumber");	

				System.out.println(" NO : " + no);
				System.out.println(" NAME : " + name);
				System.out.println(" PHONE : " + phone);
				System.out.println(" ================================================== ");
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){e.printStackTrace();}
	}
}
