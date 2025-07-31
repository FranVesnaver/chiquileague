package org.chiquileague.dao;

import org.chiquileague.model.League;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LeagueDAO {
    private Integer id;     //from competition
    private String name;    //from competition
    private Integer country_id;
    private Integer league_rank;

    /**
     * Fetch a league from the database searching by its id
     * @param id ID of the league requested
     */
    public LeagueDAO(Integer id) {
        this.id = id;
        String query = "SELECT id, name, country_id, league_rank FROM competition " +
                       "NATURAL JOIN league " +
                       "WHERE (id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                name = result.getString("name");
                country_id = result.getInt("country_id");
                league_rank = result.getInt("league_rank");
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    /**
     * Fetch a league from the database searching by its name
     * @param name Name of the league requested
     */
    public LeagueDAO(String name) {
        this.name = name;
        String query = "SELECT id, name, country_id, league_rank FROM competition " +
                "NATURAL JOIN league " +
                "WHERE (id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                id = result.getInt("id");
                country_id = result.getInt("country_id");
                league_rank = result.getInt("league_rank");
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public List<Team> getTeams(){
        String query = "SELECT club.id, name, league_id FROM club " +
                "JOIN league ON (club.league_id = league.id) " +
                "WHERE (league.id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            List<Team> teams = new ArrayList<>();

            while (result.next()) {
                teams.add(new Team(result.getInt("id"),
                                result.getString("name"),
                                result.getInt("league_id")
                        )
                );
            }

            return teams;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
