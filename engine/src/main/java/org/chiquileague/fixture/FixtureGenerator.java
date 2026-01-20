package org.chiquileague.fixture;

import org.chiquileague.model.Match;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface FixtureGenerator {
    Map<LocalDate, List<Match>> generate(int competitionID, LocalDate startDate);
}