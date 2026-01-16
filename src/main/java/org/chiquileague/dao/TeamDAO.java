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
    /**
     * Fetch a team from the database searching by its id
     * @param id ID of the team requested
     */
    public static Team fetch(Integer id) {
        return fetch("SELECT * FROM club WHERE (id = ?);", id.toString());
    }

    /**
     * Fetch a team from the database searching by its name
     * @param name Name of the team requested
     */
    public static Team fetch(String name) {
        return fetch("SELECT * FROM club WHERE (name = ?);", name);
    }

    public static List<Player> getPlayers(Team team) {
        String query = "SELECT ps.id, ps.name, cl.name AS club FROM person ps " +
                "NATURAL JOIN player pl " +
                "JOIN club cl ON (pl.club_id = cl.id) " +
                "WHERE (cl.id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, team.getId().toString());
            ResultSet result = statement.executeQuery();

            List<Player> players = new ArrayList<>();
            while (result.next()) {
                players.add(PlayerDAO.fetch(result.getInt("id")));
            }
            return players;
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    private static Team fetch(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Team(result.getInt("id"),
                                result.getString("name"),
                                CompetitionDAO.fetchLeague(result.getInt("league_id"))
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
