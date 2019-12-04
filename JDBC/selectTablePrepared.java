package good;
import java.sql.*;

public class selectTablePrepared {
	public static void main(String[] argv)
	{
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		try{
			//����̹��� �ε��Ѵ�.
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//������ �����Ѵ�.
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:XE", 
					"book_ex", "book_ex");
			
			//�з����͸� ���� statement ���� prepareStatement �����
			pstmt = conn.prepareStatement(
				"SELECT * FROM customer WHERE c_name = ?");
			
			//���ڰ��� �����Ѵ�. (���̳����� ��쿡�� Error�� ��Ƴ��� ����� --> ������ �Ҷ������� �����ʰ� Run�Ҷ� ��������)
			pstmt.setString(1, "������"); // ?�� �ش��ϴ� ���� ��������  set ����
			//SQL���� �����Ѵ�.
			rs = pstmt.executeQuery();
			while(rs.next())
			{
			   //�����͸� �޾ƿ´�.
			     String no = rs.getString(1);	         //�÷���ġ ����
			     String name = rs.getString("c_name");  //�÷��̸� ����                                                                                                                                                                                   
			     String addr = rs.getString(3);	
			     String phone = rs.getString("c_phone");
			     String dist = rs.getString(5);	
				//����� ����Ѵ�.
				System.out.println(" NO : " + no);
				System.out.println(" NAME : " + name);
				System.out.println(" ADDRESS : " + addr);
				System.out.println(" PHONE : " + phone);
				System.out.println(" DIST : " + dist);
				System.out.println(" ================================================== ");
			}
			//Result Set�� �ݴ´�.
			rs.close();
			//Statement�� �ݴ´�.
			pstmt.close();
			//������ �ݴ´�.
			conn.close();
		}catch(Exception e){e.printStackTrace();}
	}
}
