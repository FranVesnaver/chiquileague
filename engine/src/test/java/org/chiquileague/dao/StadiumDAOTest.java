package org.chiquileague.dao;

import org.chiquileague.model.Country;
import org.chiquileague.model.League;
import org.chiquileague.model.Stadium;
import org.chiquileague.model.Team;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class StadiumDAOTest {

    @BeforeEach
    public void setUp() throws SQLException, IOException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchByIDTest() {
        Integer input = 1;
        Team club = new Team(1, "CA River Plate", new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1));
        Stadium expected = new Stadium(1, "Mâs Monumental", 85018, club);

        Stadium result = StadiumDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByNameTest() {
        String input = "Alberto J. Armando";
        Team club = new Team(2, "CA Boca Juniors", new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1));
        Stadium expected = new Stadium(2, "Alberto J. Armando", 54000, club);

        Stadium result = StadiumDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByClubIDTest() {
        Integer input = 31;
        Team club = new Team(31, "CA San Martín (Tucumán)", new League(2, "Primera Nacional (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 2));
        Stadium expected = new Stadium(31, "La Ciudadela", 28500, club);

        Stadium result = StadiumDAO.fetchByClubID(input);

        assertEquals(expected, result);
    }
}