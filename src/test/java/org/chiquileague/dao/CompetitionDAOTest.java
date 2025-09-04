package org.chiquileague.dao;

import org.chiquileague.model.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CompetitionDAOTest {

    @BeforeEach
    public void setUp() throws IOException, SQLException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchLeagueByIDTest(){
        Integer input = 1;
        League expected = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 1);

        League result = CompetitionDAO.fetchLeague(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchLeagueByNameTest(){
        String input = "Primera Nacional (Argentina)";
        League expected = new League(2, "Primera Nacional (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 2);

        League result = CompetitionDAO.fetchLeague(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchNationalCupByIDTest(){
        Integer input = 5;
        NationalCup expected = new NationalCup(5, "Copa Argentina", "KNOCKOUT", 1);

        NationalCup result = CompetitionDAO.fetchNationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchNationalCupByNameTest(){
        String input = "Copa do Brasil";
        NationalCup expected = new NationalCup(6, "Copa do Brasil", "KNOCKOUT", 2);

        NationalCup result = CompetitionDAO.fetchNationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchInternationalCupByIDTest(){
        Integer input = 7;
        List<Integer> countries = List.of(1,2);
        InternationalCup expected = new InternationalCup(7, "Copa Libertadores", "GROUP_KNOCKOUT", countries);

        InternationalCup result = CompetitionDAO.fetchInternationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchInternationalCupByNameTest(){
        String input = "Copa Libertadores";
        List<Integer> countries = List.of(1,2);
        InternationalCup expected = new InternationalCup(7, "Copa Libertadores", "GROUP_KNOCKOUT", countries);

        InternationalCup result = CompetitionDAO.fetchInternationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchAllTest() {
        List<Competition> expected = List.of(
                new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 1),
                new League(2, "Primera Nacional (Argentina)","DOUBLE_ROUND_ROBIN", 1, 2),
                new League(3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN", 2, 1),
                new League(4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN", 2, 2),
                new NationalCup(5, "Copa Argentina", "KNOCKOUT", 1),
                new NationalCup(6, "Copa do Brasil","KNOCKOUT", 2),
                new InternationalCup(7,"Copa Libertadores","GROUP_KNOCKOUT", List.of(1,2))
        );

        List<Competition> result = CompetitionDAO.fetchAll();

        assertIterableEquals(expected, result);
    }

    @Test
    public void getTeamsByLeagueTest01(){
        League input = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 1);
        List<Team> expected = new ArrayList<>();
        expected.add(new Team(1, "CA River Plate", 1));
        expected.add(new Team(2, "CA Boca Juniors", 1));

        List<Team> result = CompetitionDAO.getTeamsByLeague(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void getTeamsByLeagueTest02(){
        League input = new League(3, "Campeonato Brasileiro Serie A", "DOUBLE_ROUND_ROBIN", 2, 1);
        List<Team> expected = new ArrayList<>();
        expected.add(new Team(67, "SE Palmeiras", 3));
        expected.add(new Team(68, "CR Flamengo", 3));

        List<Team> result = CompetitionDAO.getTeamsByLeague(input);

        assertIterableEquals(expected, result);
    }
}