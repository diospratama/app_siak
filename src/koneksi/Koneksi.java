/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package koneksi;

import Form.main_class;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.sql.SQLException;


 

/**
 *
 * @author Bolehjadi
 */
public class Koneksi {
    
  
   
    private static Connection cn ;
    

        
      public static java.sql.Connection koneksi() throws SQLException{
        
        Properties properties = new Properties();
        try {
            //load file database.properties
            properties.load(new FileInputStream("database.properties"));
        } catch (IOException ex) {
            System.out.println("Gagal load file database.properties");
        }
 
        String driverName = properties.getProperty("driverName");
        String jdbcUrl = properties.getProperty("jdbcUrl");
        String user = properties.getProperty("user");
        String password = properties.getProperty("password");
        String serverName = properties.getProperty("serverName");
        String port = properties.getProperty("port");
        String databaseName = properties.getProperty("databaseName");
        
        try{
            cn=(Connection) DriverManager.getConnection
                    ("jdbc:mysql://"+serverName+"/"+databaseName,user,password);
        
        
        }catch(SQLException e){
            
            JOptionPane.showMessageDialog(null,"Koneksi database gagal");
            main_class baru= new main_class();
            baru.cek_login();
        }
              
        
        
        return cn;
       
       
    }
    
}
