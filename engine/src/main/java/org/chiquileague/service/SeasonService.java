package org.chiquileague.service;

import org.chiquileague.fixture.FixtureFactory;
import org.chiquileague.fixture.FixtureGenerator;
import org.chiquileague.model.Competition;
import org.chiquileague.model.Match;
import org.chiquileague.model.Season;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public class SeasonService {

    private final FixtureFactory fixtureFactory;

    public SeasonService(FixtureFactory fixtureFactory) {
        this.fixtureFactory = fixtureFactory;
    }

    public Season createSeason(List<Competition> competitions, LocalDate startDate) {
        Season season = new Season(startDate);

        for (Competition competition : competitions) {
            season.addCompetition(competition);

            FixtureGenerator generator = fixtureFactory.getGenerator(competition.getCompetitionFormat());

            Map<LocalDate, List<Match>> fixture = generator.generate(competition.getId(), startDate);

            fixture.forEach(season::addMatches);
        }

        return season;
    }
}
