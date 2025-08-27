package org.chiquileague.dao;

import org.chiquileague.model.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MatchDAOTest {

    @BeforeEach
    public void setUp() throws SQLException, IOException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchMatchByIDTest() {
        Integer input = 1;
        Match expected = new Match(1, Date.valueOf("2025-02-01") ,1,2,2,1,2,1,1);

        Match result = MatchDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchMatchByDateAndStadiumTest() {
        Date date = Date.valueOf("2025-02-02");
        Integer stadiumID = 67;
        Match expected = new Match(3, Date.valueOf("2025-02-02"),1,1,67,68,67,3,1);

        Match result = MatchDAO.fetch(date, stadiumID);

        assertEquals(expected, result);
    }

    @Test
    public void insertMatchTest() {
        Match input = new Match(Date.valueOf("2025-03-01"), 2, 1, 1, 2, 1, 5, null);

        MatchDAO.insert(input);
        Match insert = MatchDAO.fetch(Date.valueOf("2025-03-01"), 1);

        assertNotNull(insert);
        assertEquals(input.getHomeGoals(), insert.getHomeGoals());
        assertEquals(input.getAwayGoals(), insert.getAwayGoals());
        assertEquals(input.getHomeClubID(), insert.getHomeClubID());
        assertEquals(input.getAwayClubID(), insert.getAwayClubID());
        assertEquals(input.getStadiumID(), insert.getStadiumID());
        assertEquals(input.getDate(), insert.getDate());
    }

    @Test
    public void updateStatsTest() {
        Stats homeStatsBefore = StatsDAO.fetchStats(1, 2);
        Stats awayStatsBefore = StatsDAO.fetchStats(1, 1);
        Match input = new Match(Date.valueOf("2025-03-9"), 1, 2, 2, 1, 2, 1, 2);

        MatchDAO.insert(input);
        Stats homeStatsAfter = StatsDAO.fetchStats(1, 2);
        Stats awayStatsAfter = StatsDAO.fetchStats(1, 1);


        assertEquals(homeStatsBefore.getLosses()+1, homeStatsAfter.getLosses());
        assertEquals(homeStatsBefore.getGoalsFor()+1, homeStatsAfter.getGoalsFor());
        assertEquals(homeStatsBefore.getGoalsAgainst()+2, homeStatsAfter.getGoalsAgainst());


        assertEquals(awayStatsBefore.getWins()+1, awayStatsAfter.getWins());
        assertEquals(awayStatsBefore.getPoints()+3, awayStatsAfter.getPoints());
        assertEquals(awayStatsBefore.getGoalsFor()+2, awayStatsAfter.getGoalsFor());
        assertEquals(awayStatsBefore.getGoalsAgainst()+1, awayStatsAfter.getGoalsAgainst());
    }

    @Test
    public void insertUnplayedMatchDoesNotUpdateStatsTest() {
        Stats homeStatsBefore = StatsDAO.fetchStats(1, 2);
        Stats awayStatsBefore = StatsDAO.fetchStats(1, 1);
        Match input = new Match(Date.valueOf("2025-03-9"), null, null, 2, 1, 2, 1, 2);

        MatchDAO.insert(input);
        Stats homeStatsAfter = StatsDAO.fetchStats(1, 2);
        Stats awayStatsAfter = StatsDAO.fetchStats(1, 1);

        assertEquals(homeStatsBefore, homeStatsAfter);
        assertEquals(awayStatsBefore, awayStatsAfter);
    }

    @Test
    public void fetchMatchesByTeamTest() {
        Team input = new Team(68, "CR Flamengo", 3);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(3, Date.valueOf("2025-02-02"),1,1,67,68,67,3,1));
        expected.add(new Match(8, Date.valueOf("2025-02-12"),1,1,88,68,88,6,null));
        expected.add(new Match(10, Date.valueOf("2025-02-20"),2,1,1,68,1,7,null));

        List<Match> result = MatchDAO.fetchMatchesByTeam(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest00() {
        League input = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", 1, 1);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(1, Date.valueOf("2025-02-01"),1,2,2,1,2,1,1));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest01() {
        NationalCup input = new NationalCup(5,"Copa Argentina","KNOCKOUT", 1);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(5, Date.valueOf("2025-02-12"),1,0,1,31,1,5,null));
        expected.add(new Match(6, Date.valueOf("2025-02-12"),1,2,32,2,32,5,null));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest02() {
        List<Integer> countriesIDs = List.of(1,2);
        InternationalCup input = new InternationalCup(7,"Copa Libertadores","GROUP_KNOCKOUT", countriesIDs);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(9, Date.valueOf("2025-02-20"),1,1,67,2,67,7,null));
        expected.add(new Match(10, Date.valueOf("2025-02-20"),2,1,1,68,1,7,null));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesOfTheDayTest() {
        Date input = Date.valueOf("2025-02-12");
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(5, Date.valueOf("2025-02-12"),1,0,1,31,1,5,null));
        expected.add(new Match(6, Date.valueOf("2025-02-12"),1,2,32,2,32,5,null));
        expected.add(new Match(7, Date.valueOf("2025-02-12"),2,2,67,87,67,6,null));
        expected.add(new Match(8, Date.valueOf("2025-02-12"),1,1,88,68,88,6,null));

        List<Match> result = MatchDAO.fetchMatchesOfTheDay(input);

        assertIterableEquals(expected, result);
    }
}