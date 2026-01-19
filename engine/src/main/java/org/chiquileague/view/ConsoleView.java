package org.chiquileague.view;

import org.chiquileague.dao.MatchDAO;
import org.chiquileague.dao.TeamDAO;
import org.chiquileague.engine.Engine;
import org.chiquileague.model.*;

import java.util.List;

public class ConsoleView implements EngineObserver {
    private GameInfo gameInfo;

    public ConsoleView(Engine engine) {
        engine.registerObserver(this);
    }

    public void mainMenu() {
        System.out.println("CHIQUI LEAGUE");
        System.out.println("1 - Nueva partida");
        System.out.println("2 - Cargar partida");
        System.out.println("3 - Salir");
    }

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

    public void errorMessage(String msg) {
        System.out.println("ERROR" + msg);
    }

    public void print(String msg) {
        System.out.println(msg);
    }

    public void showList(List<?> list) {
        int i;
        for (i = 0; i < list.size(); i++) {
            System.out.println(i+1 + ") " + list.get(i));
        }
        System.out.println(i+1 + ") Atras");
    }

    public void showSquad() {
        List<Player> squad = TeamDAO.getPlayers(gameInfo.getSelectedTeam());
        for (Player player : squad) {
            System.out.print(player.getName() + " | ");
            for (Position position : player.getPositions()){
                System.out.print(position + " ");
            }
            System.out.println();
        }
        System.out.println("-----------------------------\n");
    }

    public void formationMenu() {
        System.out.println();
        System.out.println("Formation");
        System.out.println("-----------------------------\n");
    }

    public void calendarMenu() {
        System.out.println();
        System.out.println("CALENDARIO");
        List<Match> matches = Season.getFixtureByTeam(gameInfo.getSelectedTeam());
        for (Match match : matches){
            System.out.println(match.getDate() + " -- " + match.getHomeClub().getName() + " v " + match.getAwayClub().getName());
        }
        System.out.println("-----------------------------\n");
    }

    public void informationMenu() {
        System.out.println();
        System.out.println("Information");
        System.out.println("-----------------------------\n");
    }

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
