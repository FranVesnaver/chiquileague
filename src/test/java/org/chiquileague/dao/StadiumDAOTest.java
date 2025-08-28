package org.chiquileague.dao;

import org.chiquileague.model.Stadium;
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
        Stadium expected = new Stadium(1, "Mâs Monumental", 85018, 1);

        Stadium result = StadiumDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByNameTest() {
        String input = "Alberto J. Armando";
        Stadium expected = new Stadium(2, "Alberto J. Armando", 54000, 2);

        Stadium result = StadiumDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByClubIDTest() {
        Integer input = 31;
        Stadium expected = new Stadium(31, "La Ciudadela", 28500, 31);

        Stadium result = StadiumDAO.fetchByClubID(input);

        assertEquals(expected, result);
    }
}