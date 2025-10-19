package org.chiquileague.view;

import org.chiquileague.dao.MatchDAO;
import org.chiquileague.dao.TeamDAO;
import org.chiquileague.model.*;
import org.chiquileague.mvc.View;
import org.chiquileague.observer.Observer;
import org.chiquileague.observer.Subject;

import java.util.List;

public class ConsoleView implements View, Observer {
    private GameInfo gameInfo;

    public ConsoleView(Subject subject) {
        subject.registerObserver(this);
    }

    @Override
    public void mainMenu() {
        System.out.println("CHIQUI LEAGUE");
        System.out.println("1 - Nueva partida");
        System.out.println("2 - Cargar partida");
        System.out.println("3 - Salir");
    }

    @Override
    public void gameMenu() {
        System.out.println("EQUIPO: " + gameInfo.getSelectedTeam().getName());
        System.out.println("FECHA: " + gameInfo.getTime());

        System.out.println("1) Ver plantel");
        System.out.println("2) Formación");
        System.out.println("3) Calendario");
        System.out.println("4) Información");
        System.out.println("5) Siguiente dia");
        System.out.println("6) Salir de la partida");
    }

    @Override
    public void errorMessage(String msg) {
        System.out.println("ERROR" + msg);
    }

    @Override
    public void print(String msg) {
        System.out.println(msg);
    }

    @Override
    public void showList(List<?> list) {
        int i;
        for (i = 0; i < list.size(); i++) {
            System.out.println(i+1 + ") " + list.get(i));
        }
        System.out.println(i+1 + ") Atras");
    }

    @Override
    public void showSquad() {
        List<Player> squad = TeamDAO.getPlayers(TeamDAO.fetch(gameInfo.getClubID()));
        for (Player player : squad) {
            System.out.print(player.getName() + " | ");
            for (Position position : player.getPositions()){
                System.out.print(position + " ");
            }
            System.out.println();
        }
        System.out.println("-----------------------------\n");
    }

    @Override
    public void formationMenu() {
        System.out.println();
        System.out.println("Formation");
        System.out.println("-----------------------------\n");
    }

    @Override
    public void calendarMenu() {
        System.out.println();
        System.out.println("CALENDARIO");
        List<Match> matches = Season.getFixtureByTeam(gameInfo.getSelectedTeam());
        for (Match match : matches)
            System.out.println(match.getDate() + " -- " + TeamDAO.fetch(match.getHomeClubID()).getName() + " v " + TeamDAO.fetch(match.getAwayClubID()).getName());
        System.out.println("-----------------------------\n");
    }

    @Override
    public void informationMenu() {
        System.out.println();
        System.out.println("Information");
        System.out.println("-----------------------------\n");
    }

    @Override
    public void nextDayMenu() {
        System.out.println("NEW DAY");
        System.out.println("Partidos de hoy " + gameInfo.getTime());
        List<Match> matches = MatchDAO.fetchMatchesOfTheDay(gameInfo.getTime());
        for (Match match : matches) {
            System.out.println("| " + match.getHomeClub().getName() + " v " + match.getAwayClub().getName());
        }
    }

    @Override
    public void update(GameInfo gameInfo) {
        this.gameInfo = gameInfo;
    }
}
