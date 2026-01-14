package org.chiquileague.app;

import org.chiquileague.controller.MVPController;
import org.chiquileague.engine.Engine;
import org.chiquileague.mvc.Controller;
import org.chiquileague.mvc.Model;

import java.io.IOException;
import java.sql.SQLException;

public class MVP {
    public static void main (String[] args) throws SQLException, IOException {
        Model model = new Engine();
        Controller controller = new MVPController(model);
        controller.startGameLoop();
    }
}
