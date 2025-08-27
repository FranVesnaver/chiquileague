package org.chiquileague.dao;

import org.chiquileague.model.InternationalCup;
import org.chiquileague.model.League;
import org.chiquileague.model.NationalCup;
import org.chiquileague.model.Team;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompetitionDAO {
    /**
     * Fetch a league from the database searching by its id
     * @param id ID of the league requested
     */
    public static League fetchLeague(Integer id) {
        String query = "SELECT id, name, competition_format, country_id, league_rank FROM competition " +
                       "NATURAL JOIN league " +
                       "WHERE (id = ?);";
        return fetchLeague(query, id.toString());
    }

    /**
     * Fetch a league from the database searching by its name
     * @param name Name of the league requested
     */
    public static League fetchLeague(String name) {
        String query = "SELECT id, name, competition_format, country_id, league_rank FROM competition " +
                "NATURAL JOIN league " +
                "WHERE (name = ?);";
        return fetchLeague(query, name);
    }

    /**
     * Fetch a National Cup from the database searching by its id
     * @param id ID of the cup requested
     */
    public static NationalCup fetchNationalCup(Integer id) {
        String query = "SELECT * FROM competition cmp " +
                "NATURAL JOIN national_cup nc " +
                "WHERE (cmp.id = ?);";
        return fetchNationalCup(query, id.toString());
    }

    /**
     * Fetch a National Cup from the database searching by its name
     * @param name Name of the cup requested
     */
    public static NationalCup fetchNationalCup(String name) {
        String query = "SELECT * FROM competition cmp " +
                "NATURAL JOIN national_cup nc " +
                "WHERE (cmp.name = ?);";
        return fetchNationalCup(query, name);
    }

    /**
     * Fetch an International Cup from the database searching by its id
     * @param id ID of the cup requested
     */
    public static InternationalCup fetchInternationalCup(Integer id) {
        String query1 = "SELECT * FROM international_cup NATURAL JOIN competition WHERE (id = ?)";
        String query2 = "SELECT * FROM international_cup_country WHERE (id = ?);";
        return fetchInternationalCup(query1, query2, id.toString());
    }

    /**
     * Fetch an International Cup from the database searching by its name
     * @param name Name of the cup requested
     */
    public static InternationalCup fetchInternationalCup(String name) {
        String query1 = "SELECT * FROM international_cup NATURAL JOIN competition WHERE (name = ?" +
                ");";
        String query2 = "SELECT id, country_id FROM international_cup_country NATURAL JOIN competition WHERE (name = ?);";
        return fetchInternationalCup(query1, query2, name);
    }

    public static List<Team> getTeamsByLeague(League league){
        String query = "SELECT club.id, name, league_id FROM club " +
                "JOIN league ON (club.league_id = league.id) " +
                "WHERE (league.id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, league.getId().toString());
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

    private static League fetchLeague(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new League(result.getInt("id"),
                                  result.getString("name"),
                                  result.getString("competition_format"),
                                  result.getInt("country_id"),
                                  result.getInt("league_rank")
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    private static NationalCup fetchNationalCup(String query, String x){
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new NationalCup(result.getInt("id"),
                        result.getString("name"),
                        result.getString("competition_format"),
                        result.getInt("country_id")
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    private static InternationalCup fetchInternationalCup(String query1, String query2, String x){
        try (PreparedStatement statement1 = Database.getConnection().prepareStatement(query1);
             PreparedStatement statement2 = Database.getConnection().prepareStatement(query2)) {
            statement1.setString(1, x);
            statement2.setString(1, x);
            ResultSet result1 = statement1.executeQuery();
            ResultSet result2 = statement2.executeQuery();

            if (result1.next()) {
                List<Integer> countries = new ArrayList<>();
                while (result2.next())
                    countries.add(result2.getInt("country_id"));

                return new InternationalCup(result1.getInt("id"),
                        result1.getString("name"),
                        result1.getString("competition_format"),
                        countries
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}