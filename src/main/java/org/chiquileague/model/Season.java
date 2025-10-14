package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;
import org.chiquileague.dao.Database;
import org.chiquileague.dao.MatchDAO;
import org.chiquileague.fixture.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Season {
    LocalDate startDate;
    LocalDate endDate;

    public Season(LocalDate startDate){
        this.startDate = startDate;
        this.endDate = startDate.plusMonths(6);    //preliminary

        List<Country> countries = CountryDAO.fetchAll();
        List<League> leagues = new ArrayList<>();
        for (Country country : countries) {
            leagues.addAll(Objects.requireNonNull(CountryDAO.getLeagues(country)));
        }

        for (League league : leagues) {
            FixtureGenerator fixtureGenerator = FixtureFactory.getGenerator(league.getCompetitionFormat());
            fixtureGenerator.generate(league.getId(), startDate);
        }
    }

    public static List<Match> getFixtureByTeam(Team team){
        return MatchDAO.fetchMatchesByTeam(team);
    }

    public static List<Match> getFixtureByCompetition(League league){
        return MatchDAO.fetchMatchesByCompetition(league);
    }
}
