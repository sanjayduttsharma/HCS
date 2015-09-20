/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2;

import healthcaresystemv2controller.Controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javafx.application.Platform;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.scene.Scene;
import javafx.scene.input.KeyCombination;
import javafx.stage.Stage;

/* @author Justin */

public class Model {
    private static Model uniqueModel = null;
    
    private Stage stage;
    private Scene primaryScene;
    
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
    
    private StringProperty userId = new SimpleStringProperty(this, "userId");
    private StringProperty userPw = new SimpleStringProperty(this, "userPw");
    private StringProperty signInMsg = new SimpleStringProperty(this, "signInMsg");
    
    private Model() {
        controllerList = new ArrayList<>();
        pageList = new ArrayList<>();
        pageList.add(SIGNINPAGE);
        pageList.add(PATIENTPAGE);
//        pageList.add(DOCTORPAGE);
//        pageList.add(ADMINPAGE);
        
        try {
            connDB = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);            
            statement = connDB.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("DB Connected.");
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
    
    public void setStage(Stage stage) {
        this.stage = stage;
    }
    
    public void setScene(Scene scene) {
        primaryScene = scene;
    }
    
    public ArrayList<String> pageList() {
        return pageList;
    }
    
    public void platformExit() {
        Platform.exit();
    }
    
    public void maximize() {
        stage.setFullScreenExitKeyCombination(KeyCombination.NO_MATCH);
        if(stage.isFullScreen())
            stage.setFullScreen(false);
        else
            stage.setFullScreen(true);
    }
    
    public void minimize() {
        stage.setIconified(true);
    }
    
    // =============== Sign in ===================
    public void signIn() {
        String idColumn, pwColumn, tableName;
        String query;
        
        if(userId.get() == null)
            userId.set("");
        
        userId.set(userId.get().toUpperCase());
        if(userId.get().startsWith("P")) {
            idColumn = "patient_id";
            pwColumn = "password";
            tableName = "patient";
        }
        else if(userId.get().startsWith("D")) {
            idColumn = "doctor_id";
            pwColumn = "password";
            tableName = "doctor";
        }
        else if(userId.get().startsWith("A")) {
            idColumn = "admin_id";
            pwColumn = "password";
            tableName = "administrator";
        }
        else if(userId.get().equals("")) {
            signInMsg.set("You must enter your User ID");
            return;
        }
        else if(userPw.get().equals("")) {
            signInMsg.set("You must enter your Password");
            return;
        }
        else if(userId.get().equals("") && userPw.get().equals("")) {
            signInMsg.set("You must enter your User ID and Password");
            return;
        }
        else {
            signInMsg.set("Wrong User ID/Password!");
            return;
        }
        
        query = "SELECT " + idColumn + ", " + pwColumn + " FROM " + tableName;
        query += " WHERE " + idColumn + " = '" + userId.get() + "' && " + pwColumn + " = '" + userPw.get() + "'";
        
        System.out.println(query); //debugging purposes
        
        try {
            resultSet = statement.executeQuery(query);
            if(resultSet.isBeforeFirst())
                signInMsg.set("Sign in successful!");
            else
                signInMsg.set("Wrong User ID/Password");
        } catch(SQLException e) {
            System.err.println(e);
        }
        
    }
    
    public StringProperty signInMsgProperty() {
        return signInMsg;
    }
    
    public StringProperty userIdProperty() {
        return userId;
    }
    
    public StringProperty userPwProperty() {
        return userPw;
    }
    
}
