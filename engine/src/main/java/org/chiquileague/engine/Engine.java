package org.chiquileague.engine;

import org.chiquileague.dao.*;
import org.chiquileague.fixture.FixtureFactory;
import org.chiquileague.fixture.FixtureGenerator;
import org.chiquileague.model.*;
import org.chiquileague.view.EngineObserver;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Engine {
    private final List<EngineObserver> observers;
    private GameInfo gameLoaded;
    private Season season;

    public Engine() {
        this.observers = new ArrayList<>();
    }

    public void connectDatabase() throws SQLException, IOException {
        Database.connect();
    }

    public void newGame(String newGameName, Team selectedTeam) throws IOException {
        Path savesDir = Path.of("saves");
        Files.createDirectories(savesDir);  //creates the saves directory in case it doesn't exist

        Path newGamePath = savesDir.resolve(newGameName + ".db");

        try (InputStream inputStream = Database.class.getResourceAsStream(Database.getDbResourcePath())) {
            if (inputStream == null) throw new FileNotFoundException("Error al cargar el archivo base de la base de datos");
            Files.copy(inputStream, newGamePath, StandardCopyOption.REPLACE_EXISTING);
            Database.connectTo(newGamePath);
            gameLoaded = Database.createGame(newGameName, selectedTeam.getId());

        } catch (SQLException e) {
            Files.delete(newGamePath);
            throw new RuntimeException("Error al crear la partida: " + e);
        }
        notifyObservers();
    }

    public void initializeCompetitions() {
        List<Competition> competitions = CompetitionDAO.fetchAll();
        for (Competition comp : competitions) {
            FixtureGenerator fixtureGenerator = FixtureFactory.getGenerator(comp.getCompetitionFormat());
            fixtureGenerator.generate(comp.getId(), gameLoaded.getTime().toLocalDate());
        }
        notifyObservers();
    }

    public void loadGame(Path saveFile) throws SQLException {
        String saveFileName = saveFile.getFileName().toString().replace(".db","");
        Database.connectTo(saveFile);

        gameLoaded = GameDAO.fetch(saveFileName);
        notifyObservers();
    }

    public void nextDay() {
        // TODO match simulation

        // pass 1 day
        LocalDate gameTime = gameLoaded.getTime().toLocalDate();
        gameLoaded.setTime(Date.valueOf(gameTime.plusDays(1)));
        notifyObservers();
    }

    public void saveGameAndQuit() {
        Database.saveGame(gameLoaded);
        quitGame();
        notifyObservers();
    }

    public void quitGame() {
        gameLoaded = null;
        notifyObservers();
    }

    public void registerObserver(EngineObserver observer) {
        observers.add(observer);
    }

    public void removeObserver(EngineObserver observer) {
        observers.remove(observer);

    }

    public void notifyObservers() {
        for (EngineObserver observer : observers) {
            observer.update(gameLoaded);
        }
    }
}
