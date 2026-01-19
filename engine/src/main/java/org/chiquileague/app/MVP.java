package org.chiquileague.app;

import org.chiquileague.controller.MVPController;
import org.chiquileague.engine.Engine;
import org.chiquileague.controller.Controller;

import java.io.IOException;
import java.sql.SQLException;

public class MVP {
    public static void main (String[] args) throws SQLException, IOException {
        Engine engine = new Engine();
        Controller controller = new MVPController(engine);
        controller.startGameLoop();
    }
}
