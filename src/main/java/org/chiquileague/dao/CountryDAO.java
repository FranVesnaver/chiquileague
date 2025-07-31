package org.chiquileague.dao;

import org.chiquileague.model.League;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO {
    private Integer id;
    private String name;

    /**
     * Fetch a country from the database searching by its id
     * @param id ID of the country requested
     */
    public CountryDAO(Integer id){
        this.id = id;
        String query = "SELECT * FROM country WHERE (id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                name = result.getString("name");
            }
        } catch (SQLException | IOException | ClassNotFoundException e ) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    /**
     * Fetch a country from the database searching by its name
     * @param name Name of the country requested
     */
    public CountryDAO(String name){
        this.name = name;
        String query = "SELECT * FROM country WHERE (id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                id = result.getInt("id");
            }
        } catch (SQLException | IOException | ClassNotFoundException e ) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public List<League> getLeagues() {
        String query = "SELECT id, name, league_rank FROM competition " +
                       "NATURAL JOIN league " +
                       "WHERE (league.country_id = ?);";

        try (PreparedStatement statement = Database.getConnection().prepareStatement(query)) {
            statement.setString(1, id.toString());
            ResultSet result = statement.executeQuery();

            List<League> leagues = new ArrayList<>();

            while (result.next()) {
                leagues.add(new League(result.getInt("id"),
                                       result.getString("name"),
                                       id,   //country_id
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
}
