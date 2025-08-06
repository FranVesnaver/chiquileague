package org.chiquileague.dao;

import org.chiquileague.model.Player;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeamDAO {
    private Integer id;
    private String name;
    private Integer leagueID;

    private List<Player> players;

    /**
     * Fetch a team from the database searching by its id
     * @param id ID of the team requested
     */
    public TeamDAO(Integer id) {
        fetch("SELECT * FROM club WHERE (id = ?);", id.toString());
    }

    /**
     * Fetch a team from the database searching by its name
     * @param name Name of the team requested
     */
    public TeamDAO(String name) {
        fetch("SELECT * FROM club WHERE (name = ?);", name);
    }

    public List<Player> getPlayers() {
        String query = "SELECT ps.id, ps.name, cl.name AS club FROM person ps " +
                "NATURAL JOIN player pl " +
                "JOIN club cl ON (pl.club_id = cl.id) " +
                "WHERE (cl.id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            players = new ArrayList<>();
            while (result.next()) {
                players.add(new Player(result.getInt("id"),
                                       result.getString("name")));
            }
            return players;
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public Team getModel(){
        return new Team(id, name, leagueID);
    }

    private void fetch(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                id = result.getInt("id");
                name = result.getString("name");
                leagueID = result.getInt("league_id");
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
