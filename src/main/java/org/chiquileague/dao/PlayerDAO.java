package org.chiquileague.dao;

import org.chiquileague.model.Player;
import org.chiquileague.model.Position;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO {
    /**
     * Fetch a player from the database searching by its id
     * @param id ID of the player requested
     */
    public static Player fetch(Integer id) {
        String query1 = "SELECT * FROM player NATURAL JOIN person WHERE (id = ?);";
        String query2 = "SELECT name AS pos FROM player pl " +
                "JOIN player_position pp ON (pp.player_id = pl.id) " +
                "JOIN f_position ps ON (pp.position_id = ps.id) " +
                "WHERE (pl.id = ?);";
        return fetch(query1, query2, id.toString());
    }

    /**
     * Fetch a player from the database searching by its name
     * @param name Name of the player requested
     */
    public static Player fetch(String name) {
        String query1 = "SELECT * FROM player NATURAL JOIN person WHERE (name = ?);";
        String query2 = "SELECT ps.name AS pos FROM person pr NATURAL JOIN player pl " +
                "JOIN player_position pp ON (pp.player_id = pl.id) " +
                "JOIN f_position ps ON (pp.position_id = ps.id) " +
                "WHERE (pr.name = ?);";
        return fetch(query1, query2, name);
    }

    private static Player fetch(String query1, String query2, String x) {
        try (PreparedStatement statement1 = Database.getConnection().prepareStatement(query1);
             PreparedStatement statement2 = Database.getConnection().prepareStatement(query2)) {
            statement1.setString(1, x);
            ResultSet result1 = statement1.executeQuery();
            statement2.setString(1, x);
            ResultSet result2 = statement2.executeQuery();

            Player player;
            if (result1.next()) {
                List<Position> positions = new ArrayList<>();
                while (result2.next()){
                    positions.add(Position.valueOf(result2.getString("pos")));
                }
                player = new Player(result1.getInt("id"),
                                    result1.getString("name"),
                                    java.sql.Date.valueOf(result1.getString("birth_date")),
                                    result1.getInt("age"),
                                    result1.getString("nationality"),

                                    result1.getString("foot"),
                                    result1.getFloat("height"),
                                    result1.getInt("ya_id"),
                                    positions
                );
                return player;
            }

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
