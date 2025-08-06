package org.chiquileague.app;

import org.chiquileague.dao.*;
import org.chiquileague.model.*;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class MVP {

    private static int option = 0;
    private static final int exitOption = 3;

    private static GameInfo gameLoaded;

    private static final Scanner scanner = new Scanner(System.in);


    public static void main (String[] args) throws IOException, SQLException {
        while (option != exitOption) {
            printMenu();
            option = scanner.nextInt();
            switch (option) {
                case 1: newGame(); break;
                case 2: loadGame(); break;
                case 3: break;
                default: System.out.println("Ingrese una opción válida"); break;
            }
        }
    }

    private static void printMenu() {
        System.out.println("CHIQUI LEAGUE");
        System.out.println("1 - Nueva partida");
        System.out.println("2 - Cargar partida");
        System.out.println("3 - Salir");

    }

    private static void newGame() throws SQLException, IOException {
        Database.connect();
        int countryOption;
        int leagueOption;
        int teamOption;
        int confirm;
        int back;
        int i;

        System.out.println("NUEVA PARTIDA");

        // SELECTING A COUNTRY
        List<Country> countries = Database.fetchCountries();
        back = countries.size()+1;
        System.out.println("Seleccioná un país: ");
        for (Country country : countries) {
            System.out.println(country.getId() + ") " + country.getName());
        }
        System.out.println(back + ") Volver");
        countryOption = validateOption(back);
        if (countryOption == back) return;
        Country selectedcountry = countries.get(countryOption-1);
        CountryDAO countryDAO = new CountryDAO(countryOption);

        // SELECTING A LEAGUE FROM THE SELECTED COUNTRY
        System.out.println("Seleccioná una liga: ");
        List<League> leagues = countryDAO.getLeagues();
        back = leagues.size()+1;
        i = 1;
        for (League league : leagues) {
            System.out.println(i++ + ") " + league.getName());
        }
        System.out.println(back + ") Volver");
        leagueOption = validateOption(back);
        if (leagueOption == back) return;
        League selectedLeague = leagues.get(leagueOption-1);
        LeagueDAO leagueDAO = new LeagueDAO(selectedLeague.getId());


        // SELECTING A TEAM FROM THE SELECTED LEAGUE
        System.out.println("Seleccioná un equipo: ");
        List<Team> teams = leagueDAO.getTeams();
        back = teams.size()+1;
        i = 1;
        for (Team team : teams) {
            System.out.println(i++ + ") " + team.getName());
        }
        System.out.println(back + ") Volver");
        teamOption = validateOption(back);
        if (teamOption == back) return;
        Team selectedTeam = teams.get(teamOption-1);


        System.out.println("EQUIPO ELEGIDO: " + selectedTeam.getName() + " (" + selectedTeam.getId() + ") de " + selectedLeague.getName());
        System.out.println("Confirmar?");
        System.out.println("1 - Si");
        System.out.println("2 - No");
        confirm = validateOption(2);
        if (confirm == 2) return;

        initializeGame(selectedTeam);
    }

    private static void initializeGame(Team selectedTeam) throws IOException {
        System.out.println("Nombre para la nueva partida (si ya hay una con ese nombre se sobreescibirá): ");
        String newGame = scanner.next();

        Path savesDir = Path.of("saves");
        Files.createDirectories(savesDir);  //creates the saves directory in case it don't exist
        try {
            Path newGamePath = savesDir.resolve(newGame + ".db");

            try (InputStream inputStream = Database.class.getResourceAsStream(Database.getDbResourcePath())) {
                if (inputStream == null) throw new FileNotFoundException("Error al cargar el archivo base de la base de datos");
                Files.copy(inputStream, newGamePath, StandardCopyOption.REPLACE_EXISTING);
                Database.connectTo(newGamePath);
                Database.createGame(newGame, selectedTeam.getId());
                System.out.println("Partida creada");

            } catch (SQLException e) {
                Files.delete(newGamePath);
                throw new RuntimeException(e);
            }

        } catch (IOException e) {
            System.out.println("Error al crear partida: " + e.getMessage());
        }

    }

    private static void loadGame(){
        int back;
        int gameOption = 0;
        int i = 1;
        Path savesDir = Path.of("saves");
        try {

            if (!Files.exists(savesDir) || !Files.isDirectory(savesDir)) {
                System.out.println("No hay partidas guardadas");
                return;
            }

            List<Path> saveFiles = Files.list(savesDir).filter(p -> p.toString().endsWith(".db")).collect(Collectors.toList());

            if (saveFiles.isEmpty()) {
                System.out.println("No hay partidas guardadas");
                return;
            }

            back = saveFiles.size()+1;
            System.out.println("Partidas guardadas:");
            for (Path saveFile : saveFiles) {
                System.out.println(i++ + ") " + saveFile.getFileName().toString().replace(".db",""));
            }
            System.out.println(back + ") Volver");

            gameOption = validateOption(back);
            if (gameOption == back) return;

            Path selectedPath = saveFiles.get(gameOption-1);
            String saveFileName = selectedPath.getFileName().toString().replace(".db","");
            Database.connectTo(selectedPath);


            System.out.println("Cargando partida... " + saveFileName);

            GameDAO gameDAO = new GameDAO(saveFileName);
            gameLoaded = gameDAO.getModel();
            gameMenu();
        } catch (IOException | SQLException e) {
            System.out.println("Error al cargar la partida: " + e.getMessage());
        }
    }

    private static void gameMenu(){
        int exitGame = 5;
        int gameOption = 0;

        while (gameOption != exitGame) {
            System.out.println("EQUIPO: " + gameLoaded.getSelectedTeam().getName());
            System.out.println("FECHA: " + gameLoaded.getTime());

            System.out.println("1) Ver plantel");
            System.out.println("2) Formación");
            System.out.println("3) Calendario");
            System.out.println("4) Siguiente dia");
            System.out.println("5) Salir de la partida");

            gameOption = scanner.nextInt();
            switch (gameOption) {
                case 1: squad(); break;
                case 2: formation(); break;
                case 3: calendar(); break;
                case 4: nextDay(); break;
                case 5: break;
                default: System.out.println("Ingrese una opción válida"); break;
            }
        }
        System.out.println("¿Querés guardar el progreso?");
        System.out.println("1) Si");
        System.out.println("2) No");
        int save = validateOption(2);
        if (save == 1)
            Database.saveGame(gameLoaded);

        System.out.println();
        gameLoaded = null;
    }

    private static void squad(){
        List<Player> squad = new TeamDAO(gameLoaded.getClubID()).getPlayers();
        for (Player player : squad) {
            System.out.print(player.getName() + " | ");
            for (Position position : player.getPositions()){
                System.out.print(position + " ");
            }
            System.out.println();
        }
        System.out.println();
    }

    private static void formation(){
        System.out.println("Formation\n");
    }

    private static void calendar(){
        System.out.println("Calendar\n");
    }

    private static void nextDay(){
        System.out.println("Next day\n");
        LocalDate gameTime = gameLoaded.getTime().toLocalDate();
        gameLoaded.setTime(Date.valueOf(gameTime.plusDays(1)));
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
