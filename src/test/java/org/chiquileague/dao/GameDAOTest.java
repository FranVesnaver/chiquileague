package org.chiquileague.dao;

import org.chiquileague.model.GameInfo;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class GameDAOTest {

    @BeforeEach
    public void setUp() throws SQLException, IOException {
        TestDatabase.setUpTestDatabase();
    }

    @AfterEach
    public void tearDown() throws IOException {
        TestDatabase.tearDownTestDatabase();
    }

    @Test
    public void fetchGameInfoByIdTest(){
        Integer input = 1;
        GameInfo expected = new GameInfo(1, "river1", 1, Date.valueOf("2025-05-05"));

        GameInfo result = GameDAO.fetch(input);

        assertEquals(expected, result);
    }

    @Test
    public void fetchGameInfoByNameTest(){
        String input = "river1";
        GameInfo expected = new GameInfo(1, "river1", 1, Date.valueOf("2025-05-05"));

        GameInfo result = GameDAO.fetch(input);

        assertEquals(expected, result);
    }

}