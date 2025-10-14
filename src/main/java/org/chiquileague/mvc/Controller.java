package org.chiquileague.mvc;

import java.io.IOException;
import java.sql.SQLException;

public interface Controller {
    void startGameLoop() throws SQLException, IOException;
    void newGame() throws SQLException, IOException;
    void loadGame() throws IOException, SQLException;
}
