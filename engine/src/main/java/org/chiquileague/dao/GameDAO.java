package org.chiquileague.dao;

import org.chiquileague.model.GameInfo;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class GameDAO {
    public static GameInfo fetch(Integer id) {
        return fetch("SELECT * FROM game WHERE (id = ?);", id.toString());
    }

    public static GameInfo fetch(String name) {
        return fetch("SELECT * FROM game WHERE (name = ?);", name);
    }

    private static GameInfo fetch(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new GameInfo(
                    result.getInt("id"),
                    result.getString("name"),
                    result.getInt("club_id"),
                    Date.valueOf(result.getString("time"))
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
