/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author Justin
 */
public class HealthCareSystemV2 extends Application {
    
    FXMLLoader loader;
    Parent root;
    Scene primaryScene;
    
    @Override
    public void start(Stage stage) throws Exception {
        loader = new FXMLLoader();
        loader.setLocation(HealthCareSystemV2.class.getResource("SignInPage.fxml"));
        
        root = loader.load(); //root => "LoginPage.fxml"
        primaryScene = new Scene(root); //primaryScene's root node => "root"
        
        //stage now shows "LoginPage.fxml"
        stage.setMinHeight(250);
        stage.setMinWidth(400);
        stage.setScene(primaryScene); //Stage's scene => "primaryScene"
        stage.show();
    }
    
    public static void main(String[] args) {
        launch(args);
    }
    
}
