/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.sql.*;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author partha
 */
public class Login {
    
    public static int checkLoginData(String userName, String password)
    {
      
        ResultSet rs=null;
        PreparedStatement pstmt;
        DBConnection dbc=new DBConnection();
        
        int log=0;
        try {

	pstmt=dbc.con.prepareStatement("select * from login where loginid=?");
	pstmt.setString(1,userName);
	rs=pstmt.executeQuery();
	if (rs.next()) { 
		
		if (rs.getString(2).equals(password)) { 
			log=1;
		}
		else	{ 
			log=2;	
		}
	} 
	else {
		log=3;
	}
        dbc.con.close();
}	
catch (Exception e) { 
	
}
        finally{
            try {
                dbc.con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return log;
       
    }

    
public static HashMap getProfile(String username)
{
    
    ResultSet rs=null;
    PreparedStatement pstmt;
    DBConnection dbc=new DBConnection();
    String sql=null;
    HashMap profiledata=new HashMap();
    if(username.startsWith("prof"))
    {
        sql="select * from tbl_profile_prof where id=?";
    }
    else
    {
        sql="select * from tbl_profile where roll=?";
    }   
    
    try
    {
        pstmt=dbc.con.prepareStatement(sql);
        pstmt.setString(1,username);
        rs=pstmt.executeQuery();
        if(rs.next())
                {
                    profiledata.put("id", rs.getString(1));
                    profiledata.put("fname", rs.getString(2));
                    profiledata.put("lname", rs.getString(3));
                    profiledata.put("dob", rs.getDate(4).toString());
                    profiledata.put("email", rs.getString(5));
                    if(rs.getString(6).equalsIgnoreCase("m"))
                    {
                        profiledata.put("sex","Male");
                    }
                    else if(rs.getString(6).equalsIgnoreCase("f"))
                    {
                        profiledata.put("sex","Female");
                    }
                    else
                    {
                        profiledata.put("sex","Other");
                    }
                    
                    profiledata.put("edu_level", rs.getString(7));
                    profiledata.put("school", rs.getString(8));
                    profiledata.put("country", rs.getString(9));
                    profiledata.put("city", rs.getString(10));
                    profiledata.put("mobile", rs.getString(11));
                    dbc.con.close();
                }
    }
    catch(Exception ex)
    {
    
    }
    finally{
        try {
            dbc.con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    return profiledata;
}

public static String getPasswordOf(String username)
{
    String password=null;
     ResultSet rs=null;
    PreparedStatement pstmt;
    DBConnection dbc=new DBConnection();
     try {

	pstmt=dbc.con.prepareStatement("select password from login where loginid=?");
	pstmt.setString(1,username);
	rs=pstmt.executeQuery();
        if(rs.next())
        {
            password=rs.getString(1);
        }
     }
     catch(Exception ex)
     {
         
     }
    return password;
}
    
    
}

