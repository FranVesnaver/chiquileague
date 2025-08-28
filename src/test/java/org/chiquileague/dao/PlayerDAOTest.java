package org.chiquileague.dao;

import org.chiquileague.model.Player;
import org.chiquileague.model.Position;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class PlayerDAOTest {

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
        Integer input = 2;
        List<Position> positions = List.of(Position.PO);
        Player expected = new Player(2, "Franco Armani", Date.valueOf("1986-10-16"), 38, "Argentina", "Derecho", Float.parseFloat("1.89"), 2, null, positions);

        Player result = PlayerDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchByNameTest() {
        String input = "Facundo Colidio";
        List<Position> positions = List.of(Position.DC, Position.EI, Position.MCO);
        Player expected = new Player(29, "Facundo Colidio", Date.valueOf("2000-01-04"), 25, "Argentina", "Derecho", Float.parseFloat("1.8"), 29, null, positions);

        Player result = PlayerDAO.fetch(input);

        assertEquals(expected, result);
    }
}