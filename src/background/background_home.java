/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package background;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;
/**
 *
 * @author hades
 */
public class background_home extends JPanel {
    private Image image3;
    
    public background_home(){
    
        image3 = new ImageIcon(getClass().getResource("/gambar/map_indonesia.png")).getImage();
    }
    
     @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
     
        Graphics gd = (Graphics2D) g.create();
     
        gd.drawImage(image3, 0,0,getWidth(),getHeight(), this);
        // menggambar image
        gd.dispose();
    }
    
}
