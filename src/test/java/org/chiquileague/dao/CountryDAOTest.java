package org.chiquileague.dao;

import org.chiquileague.model.Country;
import org.chiquileague.model.League;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CountryDAOTest {

    @BeforeEach
    public void setUp() throws IOException, SQLException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchByIDTest() {
        //arrange
        int input = 1;
        Country expected = new Country(1, "Argentina");

        //act
        Country result = CountryDAO.fetch(input);

        //assert
        assertEquals(expected, result);
    }

    @Test
    public void fetchByNameTest() {
        String input = "Brasil";
        Country expected = new Country(2, "Brasil");

        Country result = CountryDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void getLeaguesTest01(){
        Country input = new Country(1, "Argentina");
        ArrayList<League> expected = new ArrayList<>();
        expected.add(new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 1));
        expected.add(new League(2, "Primera Nacional (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 2));

        List<League> result = CountryDAO.getLeagues(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void getLeaguesTest02(){
        Country input = new Country(2, "Brasil");
        ArrayList<League> expected = new ArrayList<>();
        expected.add(new League(3, "Campeonato Brasileiro Serie A", "DOUBLE_ROUND_ROBIN", 2, 1));
        expected.add(new League(4, "Campeonato Brasileiro Serie B", "DOUBLE_ROUND_ROBIN", 2, 2));

        List<League> result = CountryDAO.getLeagues(input);

        assertIterableEquals(expected, result);
    }
}
