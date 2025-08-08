package org.chiquileague.dao;

import org.chiquileague.model.League;
import org.chiquileague.model.Match;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {
    public static Match fetch(Date date, Integer stadium_id) {
        String query = "SELECT * FROM f_match WHERE (date = ? AND stadium_id = ?)";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, date.toString());
            statement.setString(2, stadium_id.toString());
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        result.getObject("home_goals", Integer.class),
                        result.getObject("away_goals", Integer.class),
                        result.getInt("home_club_id"),
                        result.getInt("away_club_id"),
                        result.getInt("stadium_id"),
                        result.getInt("competition_id"),
                        result.getObject("matchday", Integer.class));
            }

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static Match fetch(Integer id) {
        String query = "SELECT * FROM f_match WHERE (id = ?)";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        result.getObject("home_goals", Integer.class),
                        result.getObject("away_goals", Integer.class),
                        result.getInt("home_club_id"),
                        result.getInt("away_club_id"),
                        result.getInt("stadium_id"),
                        result.getInt("competition_id"),
                        result.getObject("matchday", Integer.class));
            }

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static void insert(Match match){
        String query = "INSERT INTO f_match (date, home_goals, away_goals, home_club_id, away_club_id, stadium_id, competition_id, matchday) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
         try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
             statement.setString(1, match.getDate().toString());

             if (match.getHomeGoals() != null)
                 statement.setInt(2, match.getHomeGoals());
             else
                 statement.setNull(2, Types.INTEGER);

             if (match.getAwayGoals() != null)
                 statement.setInt(3, match.getAwayGoals());
             else
                 statement.setNull(3, Types.INTEGER);

             statement.setInt(4, match.getHomeClubID());
             statement.setInt(5, match.getAwayClubID());
             statement.setInt(6, match.getStadiumID());
             statement.setInt(7, match.getCompetitionID());

             if (match.getMatchday() != null)
                 statement.setInt(8, match.getMatchday());
             else
                 statement.setNull(8, Types.INTEGER);

             statement.executeUpdate();
         } catch (SQLException | IOException | ClassNotFoundException e) {
             System.out.println("Error: " + e.getMessage());
         }
    }

    public static List<Match> fetchMatchesByTeam(Team team) {
        String query = "SELECT * FROM f_match WHERE (home_club_id = ? OR away_club_id = ?);";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setInt(1, team.getId());
            statement.setInt(2, team.getId());
            ResultSet result = statement.executeQuery();

            List<Match> matches = new ArrayList<>();

            while (result.next()) {
                // to handle null values
                int homeGoals = result.getInt("home_goals");
                Integer homeGoalsResult = result.wasNull() ? null : homeGoals;
                int awayGoals = result.getInt("away_goals");
                Integer awayGoalsResult = result.wasNull() ? null : awayGoals;
                int matchday = result.getInt("matchday");
                Integer matchdayResult = result.wasNull() ? null : matchday;

                matches.add(new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        homeGoalsResult,
                        awayGoalsResult,
                        result.getInt("home_club_id"),
                        result.getInt("away_club_id"),
                        result.getInt("stadium_id"),
                        result.getInt("competition_id"),
                        matchdayResult));
            }

            return matches;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: ACAAAAAAAAAA " + e.getMessage());
        }
        return null;
    }

    public static List<Match> fetchMatchesByCompetition(League league) {
        String query = "SELECT * FROM f_match WHERE (competition_id = ?);";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, league.getId().toString());
            ResultSet result = statement.executeQuery();

            List<Match> matches = new ArrayList<>();

            while (result.next()) {
                // to handle null values
                int homeGoals = result.getInt("home_goals");
                Integer homeGoalsResult = result.wasNull() ? null : homeGoals;
                int awayGoals = result.getInt("away_goals");
                Integer awayGoalsResult = result.wasNull() ? null : awayGoals;
                int matchday = result.getInt("matchday");
                Integer matchdayResult = result.wasNull() ? null : matchday;

                matches.add(new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        homeGoalsResult,
                        awayGoalsResult,
                        result.getInt("home_club_id"),
                        result.getInt("away_club_id"),
                        result.getInt("stadium_id"),
                        result.getInt("competition_id"),
                        matchdayResult));
            }

            return matches;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
