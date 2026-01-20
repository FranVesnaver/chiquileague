package org.chiquileague.fixture;

import org.chiquileague.model.Match;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GroupKnockoutGenerator implements FixtureGenerator{
    @Override
    public Map<LocalDate, List<Match>> generate(int competitionID, LocalDate startDate) {
        Map<LocalDate, List<Match>> fixture = new HashMap<>();
        return fixture;
    }
}
