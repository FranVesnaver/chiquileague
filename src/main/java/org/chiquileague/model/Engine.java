package org.chiquileague.model;

import org.chiquileague.dao.CompetitionDAO;
import org.chiquileague.dao.Database;
import org.chiquileague.dao.GameDAO;
import org.chiquileague.fixture.FixtureFactory;
import org.chiquileague.fixture.FixtureGenerator;
import org.chiquileague.mvc.Model;
import org.chiquileague.observer.Observer;
import org.chiquileague.observer.Subject;

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

public class Engine implements Model, Subject {
    private List<Observer> observers;
    private GameInfo gameLoaded;
    private Season season;

    public Engine() {
        this.observers = new ArrayList<>();
    }

    @Override
    public void connectDatabase() throws SQLException, IOException {
        Database.connect();
    }

    @Override
    public void newGame(String newGameName, Team selectedTeam) throws IOException {
        Path savesDir = Path.of("saves");
        Files.createDirectories(savesDir);  //creates the saves directory in case it don't exist

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

    @Override
    public void initializeCompetitions() {
        List<Competition> competitions = CompetitionDAO.fetchAll();
        for (Competition comp : competitions) {
            FixtureGenerator fixtureGenerator = FixtureFactory.getGenerator(comp.getCompetitionFormat());
            fixtureGenerator.generate(comp.getId(), gameLoaded.getTime().toLocalDate());
        }
        notifyObservers();
    }

    @Override
    public void loadGame(Path saveFile) throws SQLException {
        String saveFileName = saveFile.getFileName().toString().replace(".db","");
        Database.connectTo(saveFile);

        gameLoaded = GameDAO.fetch(saveFileName);
        notifyObservers();
    }

    @Override
    public void nextDay() {
        // TODO match simulation

        // pass 1 day
        LocalDate gameTime = gameLoaded.getTime().toLocalDate();
        gameLoaded.setTime(Date.valueOf(gameTime.plusDays(1)));
        notifyObservers();
    }

    @Override
    public void saveGameAndQuit() {
        Database.saveGame(gameLoaded);
        quitGame();
        notifyObservers();
    }

    @Override
    public void quitGame() {
        gameLoaded = null;
        notifyObservers();
    }

    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);

    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(gameLoaded);
        }
    }
}
