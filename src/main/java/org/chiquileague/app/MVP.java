package org.chiquileague.app;

import org.chiquileague.dao.*;
import org.chiquileague.model.Country;
import org.chiquileague.model.League;
import org.chiquileague.model.Player;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class MVP {

    private static int option = 0;
    private static final int exitOption = 3;

    private static final Scanner scanner = new Scanner(System.in);


    public static void main (String[] args) throws IOException, SQLException, ClassNotFoundException {
        Database.connect();
        while (option != exitOption) {
            printMenu();
            option = scanner.nextInt();
            if (option < 1 || option > 3) {
                System.out.println("Ingrese una opción válida");
            } else if (option == 1) {
                newGame();
            } else if (option == 2) {
                loadGame();
            }
        }
    }

    private static void printMenu() throws IOException {
        System.out.println("CHIQUI LEAGUE");
        System.out.println("1 - Nueva partida");
        System.out.println("2 - Cargar partida");
        System.out.println("3 - Salir");

    }

    private static void newGame(){
        int countryOption = 0;
        int leagueOption = 0;
        int teamOption = 0;
        int back;
        int i;

        List<Country> countries = Database.fetchCountries();
        back = countries.size()+1;

        // SELECTING A COUNTRY
        System.out.println("Seleccioná un país: ");
        for (Country country : countries) {
            System.out.println(country.getId() + ") " + country.getName());
        }
        System.out.println(back + ") Volver");
        while (countryOption == 0) {
            countryOption = scanner.nextInt();
            if (countryOption < 1 || countryOption > back) {
                countryOption = 0;
                System.out.println("Ingrese una opción válida");
            }
        }
        if (countryOption == back) return;
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
        while (leagueOption == 0) {
            leagueOption = scanner.nextInt();
            if (leagueOption < 1 || leagueOption > back) {
                leagueOption = 0;
                System.out.println("Ingrese una opción válida");
            }
        }
        if (leagueOption == back) return;
        leagueOption = leagues.get(leagueOption-1).getId();
        LeagueDAO leagueDAO = new LeagueDAO(leagueOption);


        // SELECTING A TEAM FROM THE SELECTED LEAGUE
        System.out.println("Seleccioná una equipo: ");
        List<Team> teams = leagueDAO.getTeams();
        back = teams.size()+1;
        i = 1;
        for (Team team : teams) {
            System.out.println(i++ + ") " + team.getName());
        }
        System.out.println(back + ") Volver");
        while (teamOption == 0) {
            teamOption = scanner.nextInt();
            if (teamOption < 1 || teamOption > back) {
                teamOption = 0;
                System.out.println("Ingrese una opción válida");
            }
        }
        if (teamOption == back) return;
        Team selectedTeam = teams.get(teamOption-1);

        System.out.println("EQUIPO ELEGIDO: " + selectedTeam.getName() + " (" + selectedTeam.getId() + ")"); //testing
        List<Player> players = new TeamDAO(selectedTeam.getId()).getPlayers();
        for (Player player : players) {
            System.out.println(player.getName());
        }                                                                                                   //testing
    }

    private static void loadGame(){

    }
}
