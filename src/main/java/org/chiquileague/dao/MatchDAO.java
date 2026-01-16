package org.chiquileague.dao;

import org.chiquileague.model.Competition;
import org.chiquileague.model.Match;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {
    public static Match fetch(Date date, Integer stadiumID) {
        String query = "SELECT * FROM f_match WHERE (date = ? AND stadium_id = ?)";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, date.toString());
            statement.setString(2, stadiumID.toString());
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                // to handle null values
                int homeGoals = result.getInt("home_goals");
                Integer homeGoalsResult = result.wasNull() ? null : homeGoals;
                int awayGoals = result.getInt("away_goals");
                Integer awayGoalsResult = result.wasNull() ? null : awayGoals;
                int matchday = result.getInt("matchday");
                Integer matchdayResult = result.wasNull() ? null : matchday;

                return new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        homeGoalsResult,
                        awayGoalsResult,
                        TeamDAO.fetch(result.getInt("home_club_id")),
                        TeamDAO.fetch(result.getInt("away_club_id")),
                        StadiumDAO.fetch(result.getInt("stadium_id")),
                        CompetitionDAO.fetch(result.getInt("competition_id")),
                        matchdayResult);
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
                // to handle null values
                int homeGoals = result.getInt("home_goals");
                Integer homeGoalsResult = result.wasNull() ? null : homeGoals;
                int awayGoals = result.getInt("away_goals");
                Integer awayGoalsResult = result.wasNull() ? null : awayGoals;
                int matchday = result.getInt("matchday");
                Integer matchdayResult = result.wasNull() ? null : matchday;

                return new Match(result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        homeGoalsResult,
                        awayGoalsResult,
                        TeamDAO.fetch(result.getInt("home_club_id")),
                        TeamDAO.fetch(result.getInt("away_club_id")),
                        StadiumDAO.fetch(result.getInt("stadium_id")),
                        CompetitionDAO.fetch(result.getInt("competition_id")),
                        matchdayResult);
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

             statement.setInt(4, match.getHomeClub().getId());
             statement.setInt(5, match.getAwayClub().getId());
             statement.setInt(6, match.getStadium().getId());
             statement.setInt(7, match.getCompetition().getId());

             if (match.getMatchday() != null)
                 statement.setInt(8, match.getMatchday());
             else
                 statement.setNull(8, Types.INTEGER);

             statement.executeUpdate();

             if (match.getHomeGoals() != null && match.getAwayGoals() != null)
                 updateStats(match); //if the match was played, insert stats

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
                        TeamDAO.fetch(result.getInt("home_club_id")),
                        TeamDAO.fetch(result.getInt("away_club_id")),
                        StadiumDAO.fetch(result.getInt("stadium_id")),
                        CompetitionDAO.fetch(result.getInt("competition_id")),
                        matchdayResult));
            }

            return matches;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static List<Match> fetchMatchesByCompetition(Competition competition) {
        String query = "SELECT * FROM f_match WHERE (competition_id = ?);";
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, competition.getId().toString());
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
                        TeamDAO.fetch(result.getInt("home_club_id")),
                        TeamDAO.fetch(result.getInt("away_club_id")),
                        StadiumDAO.fetch(result.getInt("stadium_id")),
                        CompetitionDAO.fetch(result.getInt("competition_id")),
                        matchdayResult));
            }

            return matches;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static List<Match> fetchMatchesOfTheDay(Date date) {
        String query = "SELECT * FROM f_match WHERE (date = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, date.toString());
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

                matches.add(new Match(
                        result.getInt("id"),
                        Date.valueOf(result.getString("date")),
                        homeGoalsResult,
                        awayGoalsResult,
                        TeamDAO.fetch(result.getInt("home_club_id")),
                        TeamDAO.fetch(result.getInt("away_club_id")),
                        StadiumDAO.fetch(result.getInt("stadium_id")),
                        CompetitionDAO.fetch(result.getInt("competition_id")),
                        matchdayResult
                ));
            }

            return matches;
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    private static void updateStats(Match match){
        if (match.getHomeGoals() == null || match.getAwayGoals() == null) throw new IllegalArgumentException("The match has not been played yet");

        int homePoints = 0;
        int homeWins = 0;
        int homeDraws = 0;
        int homeLosses = 0;
        int awayPoints = 0;
        int awayWins = 0;
        int awayDraws = 0;
        int awayLosses = 0;

        if (match.getHomeGoals() > match.getAwayGoals()) {
            homePoints = 3;
            homeWins = 1;
            awayLosses = 1;
        } else if (match.getHomeGoals() < match.getAwayGoals()) {
            awayPoints = 3;
            awayWins = 1;
            homeLosses = 1;
        } else {
            homePoints = 1;
            awayPoints = 1;
            homeDraws = 1;
            awayDraws = 1;
        }

        String query = "UPDATE participates SET " +
                "points = (points+?), " +
                "wins = (wins+?), " +
                "draws = (draws+?), " +
                "losses = (losses+?), " +
                "goals_for = (goals_for+?), " +
                "goals_against = (goals_against+?) " +
                "WHERE (competition_id = ? AND club_id = ?);";
        try (PreparedStatement homeStatement = Database.getConnection().prepareStatement(query);
             PreparedStatement awayStatement = Database.getConnection().prepareStatement(query)) {
            homeStatement.setString(1, Integer.toString(homePoints));
            homeStatement.setString(2, Integer.toString(homeWins));
            homeStatement.setString(3, Integer.toString(homeDraws));
            homeStatement.setString(4, Integer.toString(homeLosses));
            homeStatement.setString(5, match.getHomeGoals().toString());
            homeStatement.setString(6, match.getAwayGoals().toString());
            homeStatement.setString(7, match.getCompetition().getId().toString());
            homeStatement.setString(8, match.getHomeClub().getId().toString());

            awayStatement.setString(1, Integer.toString(awayPoints));
            awayStatement.setString(2, Integer.toString(awayWins));
            awayStatement.setString(3, Integer.toString(awayDraws));
            awayStatement.setString(4, Integer.toString(awayLosses));
            awayStatement.setString(5, match.getAwayGoals().toString());
            awayStatement.setString(6, match.getHomeGoals().toString());
            awayStatement.setString(7, match.getCompetition().getId().toString());
            awayStatement.setString(8, match.getAwayClub().getId().toString());

            homeStatement.executeUpdate();
            awayStatement.executeUpdate();
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
