package org.chiquileague.fixture;

import java.time.LocalDate;

public interface FixtureGenerator {
    void generate(int competitionID, LocalDate startDate);

}