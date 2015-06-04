/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import partha.chat.servlet.ManageChatServlet;
//import static partha.chat.servlet.ManageChatServlet.rooms;

/**
 *
 * @author partha
 */
public class Registration {
    
     public static String generateIdOf(String cat)
    {
        
        DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
        ResultSet rs;
        int seed=0;
        String id=null;
        try
        {
            System.out.println("Registration.java inside try");
            String sql,sqlup;
            if(cat.equalsIgnoreCase("professor"))
            {
                sql="select prof from seed";
                sqlup="update seed set prof=? where prof=?";
                id="prof0";
            }
            else
            {
                sql="select stu from seed";
                sqlup="update seed set stu=? where stu=?";
                id="stu0";
                
            }
                
            pstmt=dbc.con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                seed=rs.getInt(1);
            }
            
            pstmt=dbc.con.prepareStatement(sqlup);
            pstmt.setInt(1, seed+1);
            pstmt.setInt(2, seed++);
            pstmt.executeUpdate();
            dbc.con.close();
            
        }
        
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        finally
        {
            try {
                dbc.con.close();
            } catch (SQLException ex) {
                Logger.getLogger(NoticeBoard.class.getName()).log(Level.SEVERE, null, ex);
            }
                  
        }
        id=id+seed;
        System.out.println("return time");
        return id;
    }
     
    public static void register(HashMap profiledata)
    {
        putLoginData((String)profiledata.get("id"),(String)profiledata.get("pass"));
        putProfileData(profiledata);
        
    }
    private static void putLoginData(String username, String password)
    {
        DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
         try 
         {
             pstmt=dbc.con.prepareStatement("insert into login values (?,?)");
             pstmt.setString(1,username);
             pstmt.setString(2, password);
             pstmt.executeUpdate();
             
         }
         catch (SQLException ex) 
         {
             Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
         }
        
                

    }
     
    private static void putProfileData(HashMap profiledata)
    {
        DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
         try 
         {
             
             String sql;
            if(((String)profiledata.get("id")).contains("prof"))
            {
                sql="insert into tbl_profile_prof values (?,?,?,?,?,?,?,?,?,?,?)";
            }
            else
            {
                sql="insert into tbl_profile values (?,?,?,?,?,?,?,?,?,?,?)";
            }
                
            pstmt=dbc.con.prepareStatement(sql);
          
            pstmt.setString(1,((String)profiledata.get("id")));
            pstmt.setString(2,((String)profiledata.get("fname")));
            pstmt.setString(3,((String)profiledata.get("lname")));
            pstmt.setString(4,((String)profiledata.get("dob")));
            pstmt.setString(5,((String)profiledata.get("email")));
            pstmt.setString(6,((String)profiledata.get("gen")));
            pstmt.setString(7,((String)profiledata.get("edu")));
            pstmt.setString(8,((String)profiledata.get("school")));
            pstmt.setString(9,((String)profiledata.get("country")));
            pstmt.setString(10,((String)profiledata.get("city")));
            pstmt.setString(11,((String)profiledata.get("mobile")));
            pstmt.executeUpdate();
             
         }
         catch (SQLException ex) 
         {
             Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
         }
        
    }
    
    
   
    
}
