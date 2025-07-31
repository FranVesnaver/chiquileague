package org.chiquileague.dao;

import org.chiquileague.model.Position;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PlayerDAO {
    private Integer id;
    private String name;
    private Date birthDate;
    private Integer age;
    private String nationality;

    private String foot;
    private float height;
    private Integer attrID;
    private Integer yaID;
    private List<Position> positions;

    /**
     * Fetch a player from the database searching by its id
     * @param id ID of the player requested
     */
    public PlayerDAO(Integer id) {
        this.id = id;
        String query1 = "SELECT * FROM player NATURAL JOIN person WHERE (id = ?);";
        String query2 = "SELECT name AS pos FROM player pl " +
                "JOIN player_position pp ON (pp.player_id = pl.id) " +
                "JOIN f_position ps ON (pp.position_id = ps.id) " +
                "WHERE (pl.id = ?);";

        try (PreparedStatement statement1 = Database.getConnection().prepareStatement(query1);
             PreparedStatement statement2 = Database.getConnection().prepareStatement(query2)) {
            statement1.setString(1, id.toString());
            ResultSet result1 = statement1.executeQuery();
            statement2.setString(1, id.toString());
            ResultSet result2 = statement2.executeQuery();

            while (result1.next()) {
                name = result1.getString("name");
                birthDate = result1.getDate("birth_date");
                age = result1.getInt("age");
                nationality = result1.getString("nationality");

                foot = result1.getString("foot");
                height = result1.getFloat("height");
                attrID = result1.getInt("attr_id");
                yaID = result1.getInt("ya_id");
            }

            positions = new ArrayList<>();
            while (result2.next()){
                positions.add(Position.valueOf(result2.getString("pos")));
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    /**
     * Fetch a player from the database searching by its name
     * @param name Name of the player requested
     */
    public PlayerDAO(String name) {
        this.name = name;
        String query1 = "SELECT * FROM player NATURAL JOIN person WHERE (name = '?');";
        String query2 = "SELECT ps.name AS pos FROM person pr NATURAL JOIN player pl " +
                "JOIN player_position pp ON (pp.player_id = pl.id) " +
                "JOIN f_position ps ON (pp.position_id = ps.id) " +
                "WHERE (pr.name = '?');";

        try (PreparedStatement statement1 = Database.getConnection().prepareStatement(query1);
             PreparedStatement statement2 = Database.getConnection().prepareStatement(query2)) {
            statement1.setString(1, name);
            ResultSet result1 = statement1.executeQuery();
            statement2.setString(1, name);
            ResultSet result2 = statement2.executeQuery();

            while (result1.next()) {
                id = result1.getInt("id");
                birthDate = result1.getDate("birth_date");
                age = result1.getInt("age");
                nationality = result1.getString("nationality");

                foot = result1.getString("foot");
                height = result1.getFloat("height");
                attrID = result1.getInt("attr_id");
                yaID = result1.getInt("ya_id");
            }

            positions = new ArrayList<>();
            while (result2.next()){
                positions.add(Position.valueOf(result2.getString("pos")));
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
