package org.chiquileague.dao;

import org.chiquileague.model.GameInfo;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class GameDAO {
    private Integer id;
    private String name;
    private Integer clubID;
    private Date time;

    public GameDAO(Integer id) {
        this.id = id;

        String query = "SELECT * FROM game WHERE (id = ?);";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                this.name = result.getString("name");
                this.clubID = result.getInt("club_id");
                this.time = result.getDate("time");
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public GameDAO(String name) {
        this.name = name;

        String query = "SELECT * FROM game WHERE (name = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                this.id = result.getInt("id");
                this.clubID = result.getInt("club_id");
                this.time = Date.valueOf(result.getString("time"));
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public GameInfo getModel(){
        return new GameInfo(id, name, clubID, time);
    }
}
