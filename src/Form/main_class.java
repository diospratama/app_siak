package Form;


import com.mysql.jdbc.Statement;
import javax.swing.UIManager;
import de.javasoft.plaf.synthetica.SyntheticaBlackMoonLookAndFeel;
import de.javasoft.plaf.synthetica.SyntheticaSilverMoonLookAndFeel;
import java.sql.SQLException;
import koneksi.Koneksi;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author hades
 */



public class main_class {
    private static int cek=0;
    
    
    public int cek_login(){
        return cek=1;
    
    }
        
    public static void main(String []args) throws SQLException {
        
        Koneksi.koneksi();
        
    try
            {
                
                UIManager.setLookAndFeel(new SyntheticaBlackMoonLookAndFeel());
                
                
            } 
          catch (Exception ex) 
            {
                ex.printStackTrace();
            }
       
            
            if(cek==0){
        
                Login baru2=new Login();
                baru2.setVisible(true);  
            }
      
            else if(cek==1){
                server baru=new server();
                baru.setVisible(true);
            }
            
            
           
    }
    
    
}
