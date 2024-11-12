package projet;
import java.sql.*;
public class Verification {
	ResultSet rst;
	Statement st;
	Connec cn=new Connec();
	
	public boolean verifier(String titre){
		boolean test=false;
		String title=null;
		String qr="select titre from livre where disponible='OUI' ";
		try{
			st=cn.getInstance().createStatement();
			rst=st.executeQuery(qr);
			while(rst.next()||test==true){
				title=rst.getString("titre");
				if(title.equals(titre)){
					test=true;
				}
				
			}
			
		}
		catch(SQLException ex){
			
		}
		
		
		return test; 
		
	}

}

