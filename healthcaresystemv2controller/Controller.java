/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2controller;

import healthcaresystemv2.Model;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;
/* @author Justin */

public class Controller {
    private Model model;
    
    @FXML private Button exitBtn;
    @FXML private Button minimizeBtn;
    @FXML private Button sizeAdjustBtn;
    
    @FXML
    public void platformClose() {
        Platform.exit();
    }
    
    @FXML
    public void maximize() {
        
    }
    
    @FXML
    public void minimize() {
        
    }
    
    public void setModel(Model model) {
        this.model = model;
        model.addController(this);
    }
    
}
