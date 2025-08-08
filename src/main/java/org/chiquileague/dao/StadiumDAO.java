package org.chiquileague.dao;

import org.chiquileague.model.Stadium;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StadiumDAO {
    public static Stadium fetch(Integer id){
        String query = "SELECT * FROM stadium WHERE (id = ?);";
        return fetch(query, id.toString());
    }

    public static Stadium fetchByClubID(Integer clubID){
        String query = "SELECT * FROM stadium WHERE (club_id = ?);";
        return fetch(query, clubID.toString());
    }

    public static Stadium fetch(String name){
        String query = "SELECT * FROM stadium WHERE (name = ?);";
        return fetch(query, name);
    }

    private static Stadium fetch(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Stadium(result.getInt("id"),
                                   result.getString("name"),
                                   result.getInt("capacity"),
                                   result.getInt("club_id"));
            }
        } catch (SQLException | IOException | ClassNotFoundException e ) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
