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

    private final League primeraDivision = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1);
    private final League primeraNacional = new League(2, "Primera Nacional (Argentina)","DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 2);
    private final League serieA = new League(3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN", new Country(2, "Brasil"), 1);
    private final League serieB = new League(4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN", new Country(2, "Brasil"), 2);
    private final NationalCup copaArgentina = new NationalCup(5, "Copa Argentina", "KNOCKOUT", new Country(1, "Argentina"));
    private final NationalCup copaDoBrasil = new NationalCup(6, "Copa do Brasil","KNOCKOUT", new Country(2, "Brasil"));
    private final InternationalCup copaLibertadores = new InternationalCup(7,"Copa Libertadores","GROUP_KNOCKOUT", List.of(new Country(1, "Argentina"), new Country(2, "Brasil")));

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
        League expected = primeraDivision;

        League result = CompetitionDAO.fetchLeague(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchLeagueByNameTest(){
        String input = "Primera Nacional (Argentina)";
        League expected = primeraNacional;

        League result = CompetitionDAO.fetchLeague(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchNationalCupByIDTest(){
        Integer input = 5;
        NationalCup expected = copaArgentina;

        NationalCup result = CompetitionDAO.fetchNationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchNationalCupByNameTest(){
        String input = "Copa do Brasil";
        NationalCup expected = copaDoBrasil;

        NationalCup result = CompetitionDAO.fetchNationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchInternationalCupByIDTest(){
        Integer input = 7;
        InternationalCup expected = copaLibertadores;

        InternationalCup result = CompetitionDAO.fetchInternationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchInternationalCupByNameTest(){
        String input = "Copa Libertadores";
        InternationalCup expected = copaLibertadores;

        InternationalCup result = CompetitionDAO.fetchInternationalCup(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchAllTest() {
        List<Competition> expected = List.of(
                primeraDivision,
                primeraNacional,
                serieA,
                serieB,
                copaArgentina,
                copaDoBrasil,
                copaLibertadores
        );

        List<Competition> result = CompetitionDAO.fetchAll();

        assertIterableEquals(expected, result);
    }

    @Test
    public void getCompetitionByIDTest01() {
        Integer input = 1;
        Competition expected = primeraDivision;

        Competition result = CompetitionDAO.fetch(input);

        assertEquals(expected, result);
        assertInstanceOf(League.class, result);
    }

    @Test
    public void getCompetitionByIDTest02() {
        Integer input = 7;
        Competition expected = copaLibertadores;

        Competition result = CompetitionDAO.fetch(input);

        assertEquals(expected, result);
        assertInstanceOf(InternationalCup.class, result);
    }

    @Test
    public void getTeamsByLeagueTest01(){
        League input = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1);
        List<Team> expected = new ArrayList<>();
        expected.add(new Team(1, "CA River Plate", primeraDivision));
        expected.add(new Team(2, "CA Boca Juniors", primeraDivision));

        List<Team> result = CompetitionDAO.getTeamsByLeague(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void getTeamsByLeagueTest02(){
        League input = new League(3, "Campeonato Brasileiro Serie A", "DOUBLE_ROUND_ROBIN", new Country(2, "Brasil"), 1);
        List<Team> expected = new ArrayList<>();
        expected.add(new Team(67, "SE Palmeiras", serieA));
        expected.add(new Team(68, "CR Flamengo", serieA));

        List<Team> result = CompetitionDAO.getTeamsByLeague(input);

        assertIterableEquals(expected, result);
    }
}