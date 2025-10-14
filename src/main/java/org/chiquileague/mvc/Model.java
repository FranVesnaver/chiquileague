package org.chiquileague.mvc;

import org.chiquileague.model.Team;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.SQLException;

public interface Model {
    void connectDatabase() throws SQLException, IOException;
    void newGame(String newGameName, Team selectedTeam) throws IOException;
    void initializeCompetitions();
    void loadGame(Path saveFile) throws SQLException;
    void nextDay();
    void saveGameAndQuit();
    void quitGame();
}
