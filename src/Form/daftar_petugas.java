package Form;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author hades
 */

import com.mysql.jdbc.Statement;
import java.awt.event.KeyEvent;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Properties;
import javax.swing.JOptionPane;
import javax.swing.table.TableColumn;
import koneksi.Koneksi;
    

public class daftar_petugas extends javax.swing.JFrame {

    /**
     * Creates new form login
     */
    private String nama_lengkap,username,pass,status,no,nip;
    public daftar_petugas() {
        initComponents();
        setDefaultCloseOperation(server.DISPOSE_ON_CLOSE);
        data_tabel();
        lebarKolom();
    }
    
    
     private javax.swing.table.DefaultTableModel getDefaultTabelModel(){
        
        return new javax.swing.table.DefaultTableModel(
        new Object [][]{},
        new String[] {"Id_user","Nama Lengkap","UserName","Password","Status Level","NIP"}){ 
        boolean[] canEdit=new boolean[]{
        false,false,false,false,
        };
        
        public boolean isCellEdittable(int rowIndex,int coloumnIndex){
            return canEdit[coloumnIndex];
	}
     };
                
   }
     
    private javax.swing.table.DefaultTableModel tabelModel=getDefaultTabelModel();
    
    
     private void lebarKolom() {
        TableColumn lebar_kolom;
        lebar_kolom = tabel_petugas.getColumnModel().getColumn(0);
        lebar_kolom.setPreferredWidth(20);
        lebar_kolom = tabel_petugas.getColumnModel().getColumn(1);
        lebar_kolom.setPreferredWidth(150);
        lebar_kolom = tabel_petugas.getColumnModel().getColumn(2);
        lebar_kolom.setPreferredWidth(80);
        lebar_kolom = tabel_petugas.getColumnModel().getColumn(3);
        lebar_kolom.setPreferredWidth(80);
         lebar_kolom = tabel_petugas.getColumnModel().getColumn(4);
        lebar_kolom.setPreferredWidth(100);
        lebar_kolom = tabel_petugas.getColumnModel().getColumn(5);
        lebar_kolom.setPreferredWidth(200);
     }
    
     public void data_tabel(){
        tabel_petugas.setModel(tabelModel);
        try{
            Statement state=(Statement)Koneksi.koneksi().createStatement();
            ResultSet next_row=state.executeQuery("select * from petugas");
            String [] kolom={"Id_user","Nama Lengkap","UserName","Password","Status Level","NIP"};
            tabelModel.setDataVector(null, kolom);
            
             while(next_row.next()){
                 tabelModel.addRow(new Object[] {
                 next_row.getString("id_user"),
                 next_row.getString("nama_lengkap"),    
                 next_row.getString("username"),
                 next_row.getString("pass"),
                 next_row.getString("status"),
                 next_row.getString("nip"),
                 
                 
                 });
             }
             
        }catch(Exception e){
    
        }
    }
     
     
     private void simpan(){
         nama_lengkap=txt_nama_lkp.getText();
         nip=txt_nip.getText();
         username=txt_user.getText();
         pass=txt_pass.getText();
         if(cmb_status.getSelectedItem().equals("User")){
             status="User";
         }
         else if(cmb_status.getSelectedItem().equals("Admin")){
             status="Admin";
         }
         
         
         
         
         try{
        Statement statement =(Statement)Koneksi.koneksi().createStatement();
        statement.executeUpdate("insert into petugas (nama_lengkap,username,pass,status,nip) values('"
            +nama_lengkap+"','"
            +username+"','"
            +pass+"','"
            +status+"','"    
            +nip+"');");

        statement.close();
        JOptionPane.showMessageDialog(null,"Data Telah Disimpan....");
        }catch (Exception e){
        JOptionPane.showMessageDialog(null,""+e);
        }
     
     }
     
     
     private void clean(){
         
         txt_nama_lkp.setText("");
         txt_pass.setText("");
         txt_user.setText("");
         txt_nip.setText("");
         cmb_status.setSelectedIndex(0);
         jButton1.setText("save");
     
     
     }
     
     
     private void update(){
         int baris=tabel_petugas.getSelectedRow();
         no=(String)tabel_petugas.getValueAt(baris, 0);
         nip=txt_nip.getText();
         nama_lengkap=txt_nama_lkp.getText();
         username=txt_user.getText();
         pass=txt_pass.getText();
         if(cmb_status.getSelectedItem().equals("User")){
             status="User";
         }
         else if(cmb_status.getSelectedItem().equals("Admin")){
             status="Admin";
         }
         
         
         
         
     try{

        Statement state =(Statement)Koneksi.koneksi().createStatement();
        state.executeUpdate("UPDATE  petugas  SET  nama_lengkap='"+nama_lengkap
        +"',"+" username='"+username
        +"',"+" pass='"+pass
        +"',"+" status='"+status 
        +"',"+" nip='"+nip        
        +"' "+" where id_user='"+no+"';");

        state.close();
        JOptionPane.showMessageDialog(null, "Data telah di Ubah. . .");
        } catch(Exception e){
         JOptionPane.showMessageDialog(null,""+e);
        }
     
     }
     
     
     
     int row=0;
     private void tabelklik(){
         row=tabel_petugas.getSelectedRow();
         txt_nama_lkp.setText(tabel_petugas.getValueAt(row, 1).toString());
         txt_user.setText(tabel_petugas.getValueAt(row, 2).toString());
         txt_pass.setText(tabel_petugas.getValueAt(row, 3).toString());
         
         if(tabel_petugas.getValueAt(row, 4).toString().equals("User")){
             cmb_status.setSelectedIndex(1);
         }
         else if(tabel_petugas.getValueAt(row, 4).toString().equals("Admin")){
             cmb_status.setSelectedIndex(2);
         }
         txt_nip.setText(tabel_petugas.getValueAt(row, 5).toString());
         jButton1.setText("save ");
     
     }
     
     
     private void hapus(){
         int baris=tabel_petugas.getSelectedRow();
         no=(String)tabel_petugas.getValueAt(baris, 0);
         try{
             Statement statement=(Statement)Koneksi.koneksi().createStatement();
             statement.executeUpdate("delete from petugas where id_user='"+no+"';");
             statement.close();
             JOptionPane.showMessageDialog(null,"data telah terhapus");
         }catch(Exception e){
             JOptionPane.showMessageDialog(null,"data gagal dihapus");
         }
     
     }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txt_nama_lkp = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txt_pass = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        cmb_status = new javax.swing.JComboBox();
        txt_user = new javax.swing.JTextField();
        txt_nip = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabel_petugas = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowActivated(java.awt.event.WindowEvent evt) {
                formWindowActivated(evt);
            }
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        jPanel2.setBackground(new java.awt.Color(204, 204, 204));

        jPanel3.setBackground(new java.awt.Color(153, 153, 153));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/logo_siak.png"))); // NOI18N
        jLabel1.setText("SIAK");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel2.setText("Pengaturan Petugas");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        jLabel3.setText("Nama Lengkap");

        txt_nama_lkp.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        jLabel4.setText("Username");

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        jLabel5.setText("Password");

        txt_pass.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        jLabel6.setText("Status");

        cmb_status.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "--Level Status--", "User", "Admin" }));

        txt_user.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N

        txt_nip.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        txt_nip.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_nipKeyTyped(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        jLabel7.setText("NIP");

        jButton1.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/save(16_2).png"))); // NOI18N
        jButton1.setText("save");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/save(16).png"))); // NOI18N
        jButton2.setText("clean");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/delete.png"))); // NOI18N
        jButton3.setText("delete");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        tabel_petugas.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        tabel_petugas.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tabel_petugas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tabel_petugasMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tabel_petugas);

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 525, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(23, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jPanel1.setBackground(new java.awt.Color(153, 153, 153));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 50, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel4)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel7))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(txt_nama_lkp, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 203, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                        .addComponent(txt_user, javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(cmb_status, javax.swing.GroupLayout.Alignment.LEADING, 0, 129, Short.MAX_VALUE)
                                        .addComponent(txt_pass, javax.swing.GroupLayout.Alignment.LEADING))
                                    .addComponent(txt_nip, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jButton1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jButton2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jButton3)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txt_nama_lkp, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txt_user, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(cmb_status, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(txt_pass, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_nip, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        setSize(new java.awt.Dimension(581, 486));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
       
        
        
      
    }//GEN-LAST:event_formWindowOpened

    private void formWindowActivated(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowActivated
        // TODO add your handling code here:
    }//GEN-LAST:event_formWindowActivated

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        if(txt_nama_lkp.getText().equals("")||txt_user.getText().equals("")||txt_nip.getText().equals("")
           ||txt_pass.getText().equals("")||cmb_status.getSelectedItem().equals("--Level Status--")){
           JOptionPane.showMessageDialog(null,"Field belum dilengkapi");
        
        }
        else{
                if(txt_nip.getText().length()<18){JOptionPane.showMessageDialog(null,"NIP kurang dari 18 digit");}
                
                else{
                    if(cmb_status.getSelectedItem().equals("--Level Status--")){
                        JOptionPane.showMessageDialog(null,"Field Status belum diisi");
                    }
                    else if(jButton1.getText().equals("save")){
                    simpan();
                    clean();
                    data_tabel();
                    lebarKolom();
                    }

                    else if(jButton1.getText().equals("save ")){
                        String[] Opsi={"YA","TIDAK"};
                        int Pilih =JOptionPane.showOptionDialog(null,"Anda Yakin Mengubah Data Ini?","Pertanyaan",JOptionPane.YES_NO_OPTION,JOptionPane.QUESTION_MESSAGE,null,Opsi,Opsi[0]);
                        if(Pilih==JOptionPane.YES_OPTION){
                        update();
                        clean();
                        data_tabel();
                        lebarKolom();
                        } else if(Pilih==JOptionPane.NO_OPTION)
                               data_tabel();
                               lebarKolom(); 

                    }
                }
    }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        clean();
        
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
       
        String[] Opsi={"YA","TIDAK"};
        int Pilih =JOptionPane.showOptionDialog(null,"Anda Yakin Ingin Menghapus Data ini?","Pertanyaan",JOptionPane.YES_NO_OPTION,JOptionPane.QUESTION_MESSAGE,null,Opsi,Opsi[0]);
        if(Pilih==JOptionPane.YES_OPTION){
        hapus();
        clean();
        data_tabel();
        lebarKolom();
        
        } else if(Pilih==JOptionPane.NO_OPTION){
              data_tabel();
              lebarKolom();  
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void tabel_petugasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tabel_petugasMouseClicked
        // TODO add your handling code here:
        if(evt.getClickCount()==1){
           
               tabelklik();
        }
        
    }//GEN-LAST:event_tabel_petugasMouseClicked

    private void txt_nipKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nipKeyTyped
        // TODO add your handling code here:
        char karakter = evt.getKeyChar();
    if(!(((karakter >= '0') && (karakter <= '9') || (karakter == KeyEvent.VK_BACK_SPACE) || (karakter == KeyEvent.VK_DELETE)))){
        getToolkit().beep();
        evt.consume();
    }
        else if(txt_nip.getText().length()==18){evt.consume();}
    }//GEN-LAST:event_txt_nipKeyTyped

    /**
     * @param args the command line arguments
     */
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox cmb_status;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tabel_petugas;
    private javax.swing.JTextField txt_nama_lkp;
    private javax.swing.JTextField txt_nip;
    private javax.swing.JTextField txt_pass;
    private javax.swing.JTextField txt_user;
    // End of variables declaration//GEN-END:variables
}
