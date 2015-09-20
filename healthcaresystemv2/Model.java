/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2;

import healthcaresystemv2controller.Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/* @author Justin */

public class Model {
    private static Model uniqueModel = null;
    
    private ArrayList<Controller> controllerList;
    final private ArrayList<String> pageList;
    
    public final static String SIGNINPAGE = "SignInPage.fxml";
    public final static String PATIENTPAGE = "PatientPage.fxml";
    public final static String DOCTORPAGE = "DoctorPage.fxml";
    public final static String ADMINPAGE = "AdminPage.fxml";
    
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";
    private static final String DB_URL = "jdbc:mysql://localhost/healthcaresystem";
    
    private static Connection connDB = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;
    
    private String crntUserId;
    private String crntUuserPw;
    
    private Model() {
        controllerList = new ArrayList<>();
        pageList = new ArrayList<>();
        pageList.add(SIGNINPAGE);
        pageList.add(PATIENTPAGE);
//        pageList.add(DOCTORPAGE);
//        pageList.add(ADMINPAGE);
        try {
            connDB = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            System.out.println("DB Connected...");
            statement = connDB.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch(SQLException e) {
            System.err.print(e);
        }
    }
    
    public static Model getModelInstance() throws SQLException {
        if(uniqueModel == null) {
            uniqueModel = new Model();
        }
        return uniqueModel;
    }
    
    public void addController(Controller controller) {
        controllerList.add(controller);
    }
    
    public ArrayList<String> pageList() {
        return pageList;
    }
    
}
