/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author partha
 */
public class DBConnection
{
    
    public Connection con;
    
    public DBConnection()
    {
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/db_ca","root","a");
            
        }    
        catch(Exception ex)
        {
        }
    }
    
    
}
