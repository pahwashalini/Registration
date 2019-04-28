package project4;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;  

public class MySQLAccess {

	 private Connection connect = null;
	  private Statement statement = null;
	  private PreparedStatement preparedStatement = null;
	  private ResultSet resultSet = null;

	  final private static String host = "localhost";
	  final private static String user = "shalini";
	  final private static String passwd = "Apr2019!";
	  
	  public static Connection getConnection() {
		  Connection  connect=null;;
	        try {
	        	 Class.forName("com.mysql.jdbc.Driver");	
	            try {
	            	 connect = DriverManager.getConnection("jdbc:mysql://" + host + "/mydb?"+ "user=" + user + "&password=" + passwd );
	            } catch (SQLException ex) {
	                
	                System.out.println("Failed to create the database connection."); 
	            }
	        } catch (ClassNotFoundException ex) {
	            
	            System.out.println("Driver not found."); 
	        }
	        return connect;
	    }
	  private int InsertRegistrationOfCase( RegistrationOfCases obj) throws Exception {
		    try {
		    	   connect=getConnection();
		   	    
			       statement = connect.createStatement();  
			       preparedStatement = connect.prepareStatement("insert into  mydb.Registration values ( ?, ?, ?, ? , ?,?)");
			      // RegistrationSerialNo,RegistrationDate  ,ModeOfInformation,PlaceOfOccurence  ,InvestigatingOfficerName ;
			      String str=obj.getRegistrationDate();  
			      Date date=Date.valueOf(str);
			      preparedStatement.setInt(1, obj.getRegistrationSerialNo());
			      preparedStatement.setDate(2, date);
			      preparedStatement.setString(3, obj.getModeOfInformation());
			      preparedStatement.setString(4, obj.getPlaceOfOccurence());
			      preparedStatement.setString(5, obj.getInvestigatingOfficerName());
			      preparedStatement.setInt(6, 0);
			      preparedStatement.executeUpdate();   	     
			      
			    } 	catch (Exception e) { return 0; } 
			    	finally { close(); }
		    return 1;
		    }
		    
	  public String Freeze( String RegNo) throws Exception {
		    try {
		    	   connect=getConnection();
		   	    
			       statement = connect.createStatement();  
			      preparedStatement = connect.prepareStatement("Update mydb.Registration set Freeze=1 where RegistrationSerialNo=?");			     
			      preparedStatement.setInt(1, Integer.parseInt(RegNo));			     			     
			      preparedStatement.executeUpdate();   	     
			      
			    } 	catch (Exception e) { return String.valueOf(e); } 
			    	finally { close(); }
		    return "1";
		    }
		    

	  public String AddRegistrationOfCase( RegistrationOfCases obj) throws Exception {
	    try {
	    	String Noerror="1";
	    	RegistrationOfCases Existobj=GetRegistrationByRegNo(obj.getRegistrationSerialNo());
	    	if(Existobj==null)
	    	{
	    		InsertRegistrationOfCase(obj);
	    	}
	    	else
	    	{
	    		Noerror=UpdateRegistrationOfCase(obj);
	    	}
	    	
	    	return Noerror;
	    }catch(Exception e) {return  String.valueOf(e);}
	  }
	  public String UpdateRegistrationOfCase( RegistrationOfCases obj) throws Exception {
		    try {	    	
		    	
		    		connect=getConnection();		   	    
			       statement = connect.createStatement();  
			       preparedStatement = connect.prepareStatement("Update mydb.Registration set ModeOfInformation=?,PlaceOfOccurence=? , InvestigatingOfficerName=? where RegistrationSerialNo=? ");
			     
			      preparedStatement.setString(1, obj.getModeOfInformation());
			      preparedStatement.setString(2, obj.getPlaceOfOccurence());
			      preparedStatement.setString(3, obj.getInvestigatingOfficerName());
			      preparedStatement.setInt(4, obj.getRegistrationSerialNo());			     
			      preparedStatement.executeUpdate();  
		    	return "1";
		    }catch(Exception e) {return  String.valueOf(e);}
		  }
	  
	   private void close() {
	    try {
	      if (resultSet != null) {
	        resultSet.close();
	      }

	      if (statement != null) {
	        statement.close();
	      }

	      if (connect != null) {
	        connect.close();
	      }
	    } catch (Exception e) {

	    }
	  }
	   public ArrayList<RegistrationOfCases> GetRegistrationOfCases( ) throws Exception {
			 try {  			    
				 connect=getConnection();
				 statement = connect.createStatement();		     
			      resultSet = statement.executeQuery("select * from mydb.Registration ");
			      ArrayList<RegistrationOfCases> arr= GetObjectFromResultSet(resultSet);
			     return arr;
			      
		    } 	catch (Exception e) { throw e; } 
		    	finally { close(); }
		   }
	   public RegistrationOfCases  GetRegistrationByRegNo( int RegNo) throws Exception {
		 try {  
		    
			 connect=getConnection();
			 statement = connect.createStatement();		     
		      resultSet = statement.executeQuery("select * from mydb.Registration where RegistrationSerialNo="+String.valueOf(RegNo));
		      
		      ArrayList<RegistrationOfCases> arr= GetObjectFromResultSet(resultSet);
		     return arr.get(0);
		      
	    } 	catch (Exception e) { return null; } 
	    	finally { close(); }
	   }
	   
	   
	   private ArrayList<RegistrationOfCases> GetObjectFromResultSet(ResultSet resultSet) throws SQLException {
		  //RegistrationSerialNo,RegistrationDate  ,ModeOfInformation,PlaceOfOccurence  ,InvestigatingOfficerName
		   ArrayList<RegistrationOfCases> RegList = new ArrayList<>();
		  
		    while (resultSet.next()) {
		    	 int Freeze = resultSet.getInt("Freeze");
		    	 int RegistrationSerialNo = resultSet.getInt("RegistrationSerialNo");
			      String ModeOfInformation = resultSet.getString("ModeOfInformation");
			      String PlaceOfOccurence = resultSet.getString("PlaceOfOccurence");
			      String RegistrationDate = resultSet.getString("RegistrationDate");
			      String InvestigatingOfficerName = resultSet.getString("InvestigatingOfficerName");
			      RegistrationOfCases obj=new RegistrationOfCases(RegistrationSerialNo,RegistrationDate,ModeOfInformation,PlaceOfOccurence,InvestigatingOfficerName,Freeze);
			      RegList.add(obj);
		    }
		    return RegList;
		    
		  }
}
	  
	   

