/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcaresystemv2;

import healthcaresystemv2controller.Controller;
import java.io.IOException;
import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Justin
 */
public class HealthCareSystemV2 extends Application {
    
    private FXMLLoader loader;
    private Parent root;
    private Scene primaryScene;
    private Stage stage;
    private Model model;
    private Controller controller;
    
    private double x, y;
    
    @Override
    public void start(Stage stage) throws Exception {
        this.stage = stage;
        
        model = Model.getModelInstance();
        model.setStage(stage);
        loader = new FXMLLoader();
        loadFirstPage();
        
        //stage now shows "LoginPage.fxml"
        stage.initStyle(StageStyle.TRANSPARENT);
        stage.setMinHeight(250);
        stage.setMinWidth(400);
        stage.setScene(primaryScene); //Stage's scene => "primaryScene"
        stage.show();
    }
    
    public void setSceneDraggable() {
        primaryScene.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                x = mouseEvent.getSceneX();
                y = mouseEvent.getSceneY();
            }
        });
        primaryScene.setOnMouseDragged(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                stage.setX(mouseEvent.getScreenX() - x);
                stage.setY(mouseEvent.getScreenY() - y);
            }
        });
    }
    
    public void loadFirstPage() {
        try {
            loader.setLocation(HealthCareSystemV2.class.getResource(Model.SIGNINPAGE));
            root = loader.load(); //root => "LoginPage.fxml"
            primaryScene = new Scene(root); //primaryScene's root node => "root"
            setSceneDraggable();
            controller = loader.getController();
            controller.setModel(model);
            controller.initializeController();
        } catch (IOException e) {
            System.err.println("Loading Error in loadFirstPage.");
            System.err.println(e);
        }
    }
    
    public static void main(String[] args) {
        launch(args);
    }
    
}
