package org.chiquileague.model;

import org.chiquileague.dao.TeamDAO;

import java.util.Objects;

public class Stats {
    private final Integer competition;
    private final Team club;
    private Integer points;
    private Integer matchesPlayed;
    private Integer wins;
    private Integer draws;
    private Integer losses;
    private Integer goalsFor;
    private Integer goalsAgainst;
    private Integer goalDifference;

    public Stats(Integer competitionID, Integer clubID, Integer points, Integer matchesPlayed, Integer wins, Integer draws, Integer losses, Integer goalsFor, Integer goalsAgainst, Integer goalDifference) {
        this.competition = competitionID;
        this.club = TeamDAO.fetch(clubID);
        this.points = points;
        this.matchesPlayed = matchesPlayed;
        this.wins = wins;
        this.draws = draws;
        this.losses = losses;
        this.goalsFor = goalsFor;
        this.goalsAgainst = goalsAgainst;
        this.goalDifference = goalDifference;
    }

    public Integer getPoints() {
        return points;
    }

    public Integer getWins() {
        return wins;
    }

    public Integer getLosses() {
        return losses;
    }

    public Integer getGoalsFor() {
        return goalsFor;
    }

    public Integer getGoalsAgainst() {
        return goalsAgainst;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Stats)) return false;

        Stats that = (Stats) obj;
        return  Objects.equals(competition, that.competition) &&
                Objects.equals(club, that.club) &&
                Objects.equals(points, that.points) &&
                Objects.equals(matchesPlayed, that.matchesPlayed) &&
                Objects.equals(wins, that.wins) &&
                Objects.equals(draws, that.draws) &&
                Objects.equals(losses, that.losses) &&
                Objects.equals(goalsFor, that.goalsFor) &&
                Objects.equals(goalsAgainst, that.goalsAgainst) &&
                Objects.equals(goalDifference, that.goalDifference);
    }

    @Override
    public int hashCode() {
        return Objects.hash(competition, club, points, matchesPlayed, wins, draws, losses, goalsFor, goalsAgainst, goalDifference);
    }
}
