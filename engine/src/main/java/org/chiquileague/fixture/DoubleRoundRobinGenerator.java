package org.chiquileague.fixture;

import org.chiquileague.dao.CompetitionDAO;
import org.chiquileague.dao.MatchDAO;
import org.chiquileague.dao.StadiumDAO;
import org.chiquileague.model.Match;
import org.chiquileague.model.Team;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DoubleRoundRobinGenerator implements FixtureGenerator{
    public Map<LocalDate, List<Match>> generate(int competitionID, LocalDate startDate) {
        Map<LocalDate, List<Match>> fixture = new HashMap<>();

        List<Team> teams = CompetitionDAO.getTeamsByLeague(CompetitionDAO.fetchLeague(competitionID));
        if (teams.size() % 2 != 0)
            teams.add(null);

        int rounds = teams.size()-1;
        int matchesPerRound = teams.size() / 2;
        LocalDate currentDate = startDate;
        for (int round = 0; round < rounds*2; round++) {
            List<Match> matches = new ArrayList<>();
            for (int match = 0; match < matchesPerRound; match++) {

                int homeIndex = (round + match) % (teams.size()-1);
                int awayIndex = (teams.size() - 1 - match + round) % (teams.size()-1);

                if (match == 0)
                    awayIndex = teams.size()-1;

                Team home = teams.get(homeIndex);
                Team away = teams.get(awayIndex);

                if (home != null && away != null) {
                    if (round < rounds) {
                        matches.add(new Match(Date.valueOf(currentDate), null, null, home, away, StadiumDAO.fetchByClubID(home.getId()), CompetitionDAO.fetch(competitionID), round+1));
                    } else {
                        matches.add(new Match(Date.valueOf(currentDate), null, null, away, home, StadiumDAO.fetchByClubID(away.getId()), CompetitionDAO.fetch(competitionID), round+1));
                    }
                }
            }
            fixture.put(currentDate, matches);
            currentDate = currentDate.plusDays(7);
        }
        return fixture;
    }
}
