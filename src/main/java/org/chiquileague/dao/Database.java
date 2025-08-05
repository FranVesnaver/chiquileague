package org.chiquileague.dao;

import org.chiquileague.model.Country;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// singleton pattern
public class Database {
    private static String DB_RESOURCE_PATH = "/org/chiquileague/db/chiqui.db";
    private static Connection connection;

    public static void connect() throws SQLException, IOException {
        if (connection != null && !connection.isClosed()) return;

        Path tempDir = Files.createTempDirectory("chiquileague");
        Path dbPath = tempDir.resolve("chiqui.db");

        try (InputStream inputStream = Database.class.getResourceAsStream(DB_RESOURCE_PATH)) {
            if (inputStream == null)
                throw new FileNotFoundException("Couldn't find database file");
            Files.copy(inputStream, dbPath, StandardCopyOption.REPLACE_EXISTING);
        }

        String url = "jdbc:sqlite:" + dbPath.toAbsolutePath();
        connection = DriverManager.getConnection(url);

        // activate foreign key constraints on sqlite3
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("PRAGMA foreign_keys = ON;");
        }
    }

    public static Connection getConnection() throws SQLException, IOException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            connect();
        }
        return connection;
    }

    public static void close() {
        try {
           if (connection != null && !connection.isClosed()) connection.close();
        } catch (SQLException ignored) {}
    }

    public static void connectTo(Path dbPath) throws SQLException {
        if (connection != null && !connection.isClosed()) connection.close();
        String url = "jdbc:sqlite:" + dbPath.toAbsolutePath();
        connection = DriverManager.getConnection(url);

        // activate foreign key constraints on sqlite3
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("PRAGMA foreign_keys = ON;");
        }
    }

    public static String getDbResourcePath() {
        return DB_RESOURCE_PATH;
    }

    public static void setDbResourcePath(String dbResourcePath) {
        DB_RESOURCE_PATH = dbResourcePath;
    }


    public static List<Country> fetchCountries() {
        String query = "SELECT * FROM country;";

        try {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(query);

            List<Country> countries = new ArrayList<>();
            while (result.next()){
                countries.add(new Country(result.getInt("id"), result.getString("name")));
            }

            return countries;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void createGame(String name, Integer clubID) {
        String query = "INSERT INTO game (name, club_id, time) VALUES (?, ?, ?)";

        try (PreparedStatement statement = getConnection().prepareStatement(query)) {
            statement.setString(1, name);
            statement.setInt(2, clubID);
            statement.setString(3, "2025-01-01");
            statement.executeUpdate();
        } catch (SQLException | IOException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
