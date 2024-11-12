package projet;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connec {
public static Connection connecion ;
static {
		try{
		Class.forName("com.mysql.jdbc.Driver");
		connecion=DriverManager.getConnection("jdbc:mysql://localhost:3308/biblio?autoReconnect=true&useSSL=false","root","");
			System.out.println("connected!!");
	}
		catch(Exception e){
			System.out.println("connected not yet!!");
			
		}
		
}
public Connection getInstance(){
	return connecion;
}
	
}


