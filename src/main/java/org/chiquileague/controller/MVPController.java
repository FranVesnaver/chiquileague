package org.chiquileague.controller;

import org.chiquileague.dao.*;
import org.chiquileague.model.*;
import org.chiquileague.mvc.Controller;
import org.chiquileague.mvc.Model;
import org.chiquileague.mvc.View;
import org.chiquileague.observer.Subject;
import org.chiquileague.view.ConsoleView;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class MVPController implements Controller {
    private Model model;
    private View view;

    private static final Scanner scanner = new Scanner(System.in);

    public MVPController(Model model) {
        this.model = model;
        this.view = new ConsoleView((Subject) model);
    }

    @Override
    public void startGameLoop() throws SQLException, IOException {
        int option = 0;
        int exitOption = 3;

        while (option != exitOption) {
            view.mainMenu();
            option = scanner.nextInt();
            switch (option) {
                case 1: newGame(); break;
                case 2: loadGame(); break;
                case 3: break;
                default: view.errorMessage("Ingrese una opción válida"); break;
            }
        }
    }

    @Override
    public void newGame() throws SQLException, IOException {
        int back;

        model.connectDatabase();
        view.print("NUEVA PARTIDA");

        // SELECTING A COUNTRY
        List<Country> countries = CountryDAO.fetchAll();
        back = countries.size()+1;
        view.print("Seleccioná un país: ");
        view.showList(countries);
        int countryOption = validateOption(back);
        if (countryOption == back) return;
        Country selectedCountry = countries.get(countryOption-1);

        // SELECTING A LEAGUE FROM THE SELECTED COUNTRY
        view.print("Seleccioná una liga: ");
        List<League> leagues = CountryDAO.getLeagues(selectedCountry);
        back = leagues.size()+1;
        view.showList(leagues);
        int leagueOption = validateOption(back);
        if (leagueOption == back) return;
        League selectedLeague = leagues.get(leagueOption-1);

        // SELECTING A TEAM FROM THE SELECTED LEAGUE
        view.print("Seleccioná un equipo: ");
        List<Team> teams = CompetitionDAO.getTeamsByLeague(selectedLeague);
        back = teams.size()+1;
        view.showList(teams);
        int teamOption = validateOption(back);
        if (teamOption == back) return;
        Team selectedTeam = teams.get(teamOption-1);

        view.print("EQUIPO ELEGIDO: " + selectedTeam.getName() + " (" + selectedTeam.getId() + ") de " + selectedLeague.getName());
        view.print("Confirmar?");
        view.print("1 - Si");
        view.print("2 - No");
        int confirm = validateOption(2);
        if (confirm == 2) return;

        view.print("Nombre para la nueva partida (si ya hay una con ese nombre se sobreescibirá): ");
        String newGameName = scanner.next();

        try {
            model.newGame(newGameName, selectedTeam);
            model.initializeCompetitions();
        } catch (Exception e) {
            view.print(e.getMessage());
        }
    }

    @Override
    public void loadGame() throws IOException, SQLException {
        List<Path> saveFiles = Database.getSavedGames();

        if (saveFiles.isEmpty()) {
            view.print("No hay partidas guardadas");
            return;
        }

        // TEST THIS
        int back = saveFiles.size()+1;
        List<String> saveFilesNames = saveFiles.stream().map((p) -> p.getFileName().toString().replace(".db","")).collect(Collectors.toList());
        view.showList(saveFilesNames);

        int gameOption = validateOption(back);
        if (gameOption == back) return;

        model.loadGame(saveFiles.get(gameOption-1));

        view.print("Cargando partida... " + saveFiles.get(gameOption-1).getFileName().toString().replace(".db",""));
        gameMenu();
    }

    private void gameMenu() {
        int gameOption = 0;
        int exitGame = 6;

        while (gameOption != exitGame) {
            view.gameMenu();

            gameOption = scanner.nextInt();
            switch (gameOption) {
                case 1: squad(); break;
                case 2: formation(); break;
                case 3: calendar(); break;
                case 4: information(); break;
                case 5: nextDay(); break;
                case 6: break;
                default: view.errorMessage("Ingrese una opción válida"); break;
            }
        }

        view.print("¿Querés guardar el progreso?");
        view.print("1) Si");
        view.print("2) No");
        int save = validateOption(2);
        if (save == 1)
            model.saveGameAndQuit();
        else
            model.quitGame();
    }

    private void squad(){
        view.print("");
        view.print("PLANTEL");
        view.showSquad();
    }

    private void formation(){
        // TODO
        view.print("");
        view.print("Formation");
        view.print("-----------------------------\n");
    }

    private void calendar(){
        view.showCalendar();
    }

    private void information() {
        // TODO
        view.print("");
        view.print("Information");
        view.print("-----------------------------\n");
    }

    private void nextDay(){
        model.nextDay();
        view.print("NEW DAY");
        view.showMatchesOfTheDay();
    }

    /**
     * Validates a user input when choosing an option in a menu.
     * Prints a warning if the input is not valid and
     * requests a new input to the user
     * @param back the value of the back (or return) option
     * @return the value of the option selected by the user
     */
    private static int validateOption(int back){
        int option = 0;
        while (option == 0) {
            option = scanner.nextInt();
            if (option <= 0 || option > back) {
                option = 0;
                System.out.println("Ingrese una opción válida");
            }
        }
        return option;
    }
}
