package good;
import java.sql.*;

public class selectTablePrepared {
	public static void main(String[] argv)
	{
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		try{
			//드라이버를 로딩한다.
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//연결을 설정한다.
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:XE", 
					"book_ex", "book_ex");
			
			//패러미터를 가진 statement 여서 prepareStatement 사용함
			pstmt = conn.prepareStatement(
				"SELECT * FROM customer WHERE c_name = ?");
			
			//인자값을 설정한다. (다이나믹인 경우에는 Error를 잡아내기 어려움 --> 컴파일 할때에러가 나지않고 Run할때 에러가남)
			pstmt.setString(1, "강주현"); // ?에 해당하는 값으 강주현을  set 해줌
			//SQL문을 실행한다.
			rs = pstmt.executeQuery();
			while(rs.next())
			{
			   //데이터를 받아온다.
			     String no = rs.getString(1);	         //컬럼위치 지정
			     String name = rs.getString("c_name");  //컬럼이름 지정                                                                                                                                                                                   
			     String addr = rs.getString(3);	
			     String phone = rs.getString("c_phone");
			     String dist = rs.getString(5);	
				//결과를 출력한다.
				System.out.println(" NO : " + no);
				System.out.println(" NAME : " + name);
				System.out.println(" ADDRESS : " + addr);
				System.out.println(" PHONE : " + phone);
				System.out.println(" DIST : " + dist);
				System.out.println(" ================================================== ");
			}
			//Result Set을 닫는다.
			rs.close();
			//Statement를 닫는다.
			pstmt.close();
			//연결을 닫는다.
			conn.close();
		}catch(Exception e){e.printStackTrace();}
	}
}
