package org.chiquileague.dao;

import org.chiquileague.model.Stats;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class StatsDAOTest {
    
    @BeforeEach
    public void setUp() throws SQLException, IOException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchStatsTest00() {
        Integer competitionID = 1;
        Integer clubID = 1;
        Stats expected = new Stats(1, 1, 3, 1, 1, 0, 0, 2, 1, 1);

        Stats result = StatsDAO.fetchStats(competitionID, clubID);

        assertEquals(expected, result);
    }

    @Test
    public void fetchStatsTest01() {
        Integer competitionID = 5;
        Integer clubID = 32;
        Stats expected = new Stats(5, 32, 0, 1, 0, 0, 1, 1, 2, -1);

        Stats result = StatsDAO.fetchStats(competitionID, clubID);

        assertEquals(expected, result);
    }
}