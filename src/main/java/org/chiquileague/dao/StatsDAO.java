package org.chiquileague.dao;

import org.chiquileague.model.Stats;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatsDAO {
    public static Stats fetchStats(Integer competitionID, Integer clubID) {
        String query = "SELECT * FROM participates WHERE (competition_id = ? AND club_id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, competitionID.toString());
            statement.setString(2, clubID.toString());
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Stats(
                        result.getInt("competition_id"),
                        result.getInt("club_id"),
                        result.getInt("points"),
                        result.getInt("matches_played"),
                        result.getInt("wins"),
                        result.getInt("draws"),
                        result.getInt("losses"),
                        result.getInt("goals_for"),
                        result.getInt("goals_against"),
                        result.getInt("goal_difference")
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
