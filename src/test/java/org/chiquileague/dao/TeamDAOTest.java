package org.chiquileague.dao;

import org.chiquileague.model.Player;
import org.chiquileague.model.Position;
import org.chiquileague.model.Team;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class TeamDAOTest {

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
        Team expected = new Team(1, "CA River Plate", 1);

        Team result = TeamDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByNameTest() {
        String input = "CA Boca Juniors";
        Team expected = new Team(2, "CA Boca Juniors", 1);

        Team result = TeamDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void getPlayersByTeamTest() {
        Team input = new Team(32, "CA Gimnasia y Esgrima (Mendoza)", 2);
        List<Player> expected = List.of(
                new Player(909, "Lautaro Petruchi", Date.valueOf("1998-09-01"), 26, "Argentina", "Derecho", Float.parseFloat("1.84"), null, List.of(Position.PO)),
                new Player(912, "Imanol González", Date.valueOf("1998-01-06"), 27, "Argentina", "Izquierdo", Float.parseFloat("1.84"), null, List.of(Position.DFC)),
                new Player(923, "Fermín Antonini", Date.valueOf("1997-07-02"), 28, "Argentina", "Derecho", Float.parseFloat("1.74"), null, List.of(Position.MCD)),
                new Player(930, "Facundo Lencioni", Date.valueOf("2001-02-14"), 24, "Argentina", "Izquierdo", Float.parseFloat("1.8"), null, List.of(Position.EI))
        );

        List<Player> result = TeamDAO.getPlayers(input);

        assertIterableEquals(expected, result);
    }
}