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
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

/**
 *
 * @author Justin
 */
public class SignInPageController extends Controller {
    
    @FXML private TextField userIdFld;
    @FXML private PasswordField userPwFld;
    @FXML private Button signInBtn;
    @FXML private Button docRegBtn;
    @FXML private Label msgLbl;
    
    public void initializeController() {
        msgLbl.textProperty().bind(model.signInMsgProperty());
    }
    
    public void signInAction() {
        model.setUserId(userIdFld.getText());
        model.setUserPw(userPwFld.getText());
        model.signIn();
    }
    
}
