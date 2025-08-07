package org.chiquileague.dao;

import org.chiquileague.model.Country;
import org.chiquileague.model.League;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO {
    /**
     * Fetch a country from the database searching by its id
     * @param id ID of the country requested
     */
    public static Country fetch(Integer id){
        String query = "SELECT * FROM country WHERE (id = ?);";
        return fetch(query, id.toString());
    }

    /**
     * Fetch a country from the database searching by its name
     * @param name Name of the country requested
     */
    public static Country fetch(String name){
        String query = "SELECT * FROM country WHERE (name = ?);";
        return fetch(query, name);
    }

    public static List<League> getLeagues(Country country) {
        String query = "SELECT id, name, league_rank FROM competition " +
                       "NATURAL JOIN league " +
                       "WHERE (league.country_id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, country.getId().toString());
            ResultSet result = statement.executeQuery();

            List<League> leagues = new ArrayList<>();

            while (result.next()) {
                leagues.add(new League(result.getInt("id"),
                                       result.getString("name"),
                                       country.getId(),   //country_id
                                       result.getInt("league_rank")
                            )
                );
            }

            return leagues;

        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    private static Country fetch(String query, String x) {
        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, x);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Country(result.getInt("id"),
                                   result.getString("name")
                );
            }
        } catch (SQLException | IOException | ClassNotFoundException e ) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}
