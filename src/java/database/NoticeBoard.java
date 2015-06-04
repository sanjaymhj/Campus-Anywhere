/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author partha
 */
public class NoticeBoard {
    
    public static int getSeed()
    {
        
        DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
        ResultSet rs;
        int seed=0;
        try
        {
            pstmt=dbc.con.prepareStatement("select notice from seed");
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                seed=rs.getInt(1);
            }
            dbc.con.close();
        }
        
        catch(SQLException ex)
        {
        }
        finally
        {
            try {
                dbc.con.close();
            } catch (SQLException ex) {
                Logger.getLogger(NoticeBoard.class.getName()).log(Level.SEVERE, null, ex);
            }
                  
        }
        return seed;
    }
    
    public static void postNotice( String noticeid, String title, String notice)
    {
         DBConnection dbc=new DBConnection();
            PreparedStatement pstmt;
             DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            Date date =new Date();
        try 
        {
           
            pstmt=dbc.con.prepareStatement("insert into notice_board values (?,?,?,?)");
            pstmt.setString(1, noticeid);
            pstmt.setString(2, title);
            pstmt.setString(3, notice);
            pstmt.setString(4,dateformat.format(date));
            pstmt.executeUpdate();
            pstmt=dbc.con.prepareStatement("update seed set notice=?");
            pstmt.setInt(1, getSeed()+1);
            pstmt.executeUpdate();
            dbc.con.close();
        }
        
        catch (SQLException ex) 
        {
            Logger.getLogger(NoticeBoard.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
             try {
                 dbc.con.close();
             } catch (SQLException ex) {
                 Logger.getLogger(NoticeBoard.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
        
    }
    
    public static List<String[]> publishNotice(String id)
    {

         List<String[]> notices = new ArrayList<>();
        int i;
        DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
        ResultSet rs;
        try
        {
            pstmt=dbc.con.prepareStatement("select * from notice_board where notice_id like ?");
            pstmt.setString(1, id+"%");
            rs=pstmt.executeQuery();
            
            i=0;
            while(rs.next())
            {
                  notices.add(new String[] { rs.getString(1),rs.getString(2),rs.getDate(4).toString()});
              i++;
            }
            dbc.con.close();
        } 
        
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try {
                dbc.con.close();
            } catch (SQLException ex) {
                Logger.getLogger(NoticeBoard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return notices;
    }
    
    public static String getNotice(String id)
    {
         DBConnection dbc=new DBConnection();
        PreparedStatement pstmt;
        ResultSet rs;
        String notice=null;
        try
        {
            pstmt=dbc.con.prepareStatement("select content from notice_board where notice_id =?");
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                notice=rs.getString(1);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return notice;
    }
}
