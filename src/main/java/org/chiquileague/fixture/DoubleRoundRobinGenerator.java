package org.chiquileague.fixture;

import org.chiquileague.dao.LeagueDAO;
import org.chiquileague.dao.MatchDAO;
import org.chiquileague.dao.StadiumDAO;
import org.chiquileague.model.Match;
import org.chiquileague.model.Team;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class DoubleRoundRobinGenerator implements FixtureGenerator{
    public void generate(int competitionID, LocalDate startDate) {
        List<Team> teams = LeagueDAO.getTeams(LeagueDAO.fetch(competitionID));
        if (teams.size() % 2 != 0)
            teams.add(null);

        int rounds = teams.size()-1;
        int matchesPerRound = teams.size() / 2;
        LocalDate currentDate = startDate;
        for (int round = 0; round < rounds*2; round++) {
            for (int match = 0; match < matchesPerRound; match++) {
                int homeIndex = (round + match) % (teams.size()-1);
                int awayIndex = (teams.size() - 1 - match + round) % (teams.size()-1);

                if (match == 0)
                    awayIndex = teams.size()-1;

                Team home = teams.get(homeIndex);
                Team away = teams.get(awayIndex);

                if (home != null && away != null) {
                    if (round < rounds)
                        MatchDAO.insert(new Match(Date.valueOf(currentDate), null, null, home.getId(), away.getId(), StadiumDAO.fetchByClubID(home.getId()).getId(), competitionID, round+1));
                    else
                        MatchDAO.insert(new Match(Date.valueOf(currentDate), null, null, away.getId(), home.getId(), StadiumDAO.fetchByClubID(away.getId()).getId(), competitionID, round+1));
                }
            }
            currentDate = currentDate.plusDays(7);
        }
    }
}
