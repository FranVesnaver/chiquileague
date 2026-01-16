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

    private final League primeraDivision = new League(1,"Primera División (Argentina)","DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1);
    private final League primeraNacional = new League(2,"Primera Nacional (Argentina)","DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 2);
    private final League serieA = new League(3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN", new Country(2, "Brasil"), 1);
    private final League serieB = new League(4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN", new Country(2, "Brasil"), 2);
    private final NationalCup copaArgentina = new NationalCup(5,"Copa Argentina","KNOCKOUT", new Country(1, "Argentina"));
    private final NationalCup copaDoBrasil = new NationalCup(6,"Copa do Brasil","KNOCKOUT", new Country(2, "Brasil"));
    private final InternationalCup copaLibertadores = new InternationalCup(7,"Copa Libertadores","GROUP_KNOCKOUT", List.of(new Country(1, "Argentina"), new Country(2, "Brasil")));

    private final Team river = new Team(1, "CA River Plate", primeraDivision);
    private final Team boca = new Team(2, "CA Boca Juniors", primeraDivision);
    private final Team sanMartin = new Team(31, "CA San Martín (Tucumán)", primeraNacional);
    private final Team gimnasia = new Team(32, "CA Gimnasia y Esgrima (Mendoza)", primeraNacional);
    private final Team palmeiras = new Team(67, "SE Palmeiras", serieA);
    private final Team flamengo = new Team(68, "CR Flamengo", serieA);
    private final Team paranaense = new Team(87, "Club Athletico Paranaense", serieB);
    private final Team coritiba = new Team(88, "Coritiba Foot Ball Club", serieB);

    private final Stadium riverStadium = new Stadium(1, "Mâs Monumental", 85018, river);
    private final Stadium bocaStadium = new Stadium(2, "Alberto J. Armando", 54000, boca);
    private final Stadium gimnasiaStadium = new Stadium(32, "Víctor Antonio Legrotaglie", 14000, gimnasia);
    private final Stadium palmeirasStadium = new Stadium(67, "Allianz Parque", 43713, palmeiras);
    private final Stadium coritibaStadium = new Stadium(88, "Estádio Major Antônio Couto Pereira", 40502, coritiba);

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
        Match expected = new Match(1, Date.valueOf("2025-02-01") ,1,2, boca, river, bocaStadium, primeraDivision,1);

        Match result = MatchDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchMatchByDateAndStadiumTest() {
        Date date = Date.valueOf("2025-02-02");
        Integer stadiumID = 67;
        Match expected = new Match(3, Date.valueOf("2025-02-02"),1,1, palmeiras, flamengo, palmeirasStadium, serieA,1);

        Match result = MatchDAO.fetch(date, stadiumID);

        assertEquals(expected, result);
    }

    @Test
    public void insertMatchTest() {
        Match input = new Match(Date.valueOf("2025-03-01"), 2, 1, river, boca, riverStadium, copaArgentina, null);

        MatchDAO.insert(input);
        Match insert = MatchDAO.fetch(Date.valueOf("2025-03-01"), 1);

        assertNotNull(insert);
        assertEquals(input.getHomeGoals(), insert.getHomeGoals());
        assertEquals(input.getAwayGoals(), insert.getAwayGoals());
        assertEquals(input.getHomeClub(), insert.getHomeClub());
        assertEquals(input.getAwayClub(), insert.getAwayClub());
        assertEquals(input.getStadium(), insert.getStadium());
        assertEquals(input.getDate(), insert.getDate());
    }

    @Test
    public void updateStatsTest() {
        Stats homeStatsBefore = StatsDAO.fetch(1, 2);
        Stats awayStatsBefore = StatsDAO.fetch(1, 1);
        Match input = new Match(Date.valueOf("2025-03-9"), 1, 2, boca, river, bocaStadium, primeraDivision, 2);

        MatchDAO.insert(input);
        Stats homeStatsAfter = StatsDAO.fetch(1, 2);
        Stats awayStatsAfter = StatsDAO.fetch(1, 1);


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
        Stats homeStatsBefore = StatsDAO.fetch(1, 2);
        Stats awayStatsBefore = StatsDAO.fetch(1, 1);
        Match input = new Match(Date.valueOf("2025-03-9"), null, null, boca, river, bocaStadium, primeraDivision, 2);

        MatchDAO.insert(input);
        Stats homeStatsAfter = StatsDAO.fetch(1, 2);
        Stats awayStatsAfter = StatsDAO.fetch(1, 1);

        assertEquals(homeStatsBefore, homeStatsAfter);
        assertEquals(awayStatsBefore, awayStatsAfter);
    }

    @Test
    public void fetchMatchesByTeamTest() {
        Team input = new Team(68, "CR Flamengo", serieA);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(3, Date.valueOf("2025-02-02"),1,1, palmeiras, flamengo, palmeirasStadium, serieA,1));
        expected.add(new Match(8, Date.valueOf("2025-02-12"),1,1, coritiba, flamengo, coritibaStadium, copaDoBrasil,null));
        expected.add(new Match(10, Date.valueOf("2025-02-20"),2,1, river, flamengo, riverStadium, copaLibertadores,null));

        List<Match> result = MatchDAO.fetchMatchesByTeam(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest00() {
        League input = new League(1, "Primera División (Argentina)", "DOUBLE_ROUND_ROBIN", new Country(1, "Argentina"), 1);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(1, Date.valueOf("2025-02-01"),1,2, boca, river, bocaStadium, primeraDivision,1));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest01() {
        NationalCup input = new NationalCup(5,"Copa Argentina","KNOCKOUT", new Country(1, "Argentina"));
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(5, Date.valueOf("2025-02-12"),1,0, river, sanMartin, riverStadium, copaArgentina,null));
        expected.add(new Match(6, Date.valueOf("2025-02-12"),1,2, gimnasia, boca, gimnasiaStadium, copaArgentina,null));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesByCompetitionTest02() {
        List<Country> countries = List.of(new Country(1, "Argentina"), new Country(2, "Brasil"));
        InternationalCup input = new InternationalCup(7,"Copa Libertadores","GROUP_KNOCKOUT", countries);
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(9, Date.valueOf("2025-02-20"),1,1, palmeiras, boca, palmeirasStadium, copaLibertadores,null));
        expected.add(new Match(10, Date.valueOf("2025-02-20"),2,1, river, flamengo, riverStadium, copaLibertadores,null));

        List<Match> result = MatchDAO.fetchMatchesByCompetition(input);

        assertIterableEquals(expected, result);
    }

    @Test
    public void fetchMatchesOfTheDayTest() {
        Date input = Date.valueOf("2025-02-12");
        List<Match> expected = new ArrayList<>();
        expected.add(new Match(5, Date.valueOf("2025-02-12"),1,0, river, sanMartin, riverStadium, copaArgentina,null));
        expected.add(new Match(6, Date.valueOf("2025-02-12"),1,2, gimnasia, boca, gimnasiaStadium, copaArgentina,null));
        expected.add(new Match(7, Date.valueOf("2025-02-12"),2,2, palmeiras, paranaense, palmeirasStadium, copaDoBrasil,null));
        expected.add(new Match(8, Date.valueOf("2025-02-12"),1,1, coritiba, flamengo, coritibaStadium, copaDoBrasil,null));

        List<Match> result = MatchDAO.fetchMatchesOfTheDay(input);

        assertIterableEquals(expected, result);
    }
}