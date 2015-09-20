/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

/**
 *
 * @author Justin
 */
public class SignInPageController implements Initializable {
    
    @FXML private TextField userId;
    @FXML private TextField password;
    @FXML private Button signInBtn;
    @FXML private Button docRegBtn;
    @FXML private Label message;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }    
    
}
