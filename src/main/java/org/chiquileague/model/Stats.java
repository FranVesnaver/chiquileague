package org.chiquileague.model;

import java.util.Objects;

public class Stats {
    private Integer competitionID;
    private Integer clubID;
    private Integer points;
    private Integer matchesPlayed;
    private Integer wins;
    private Integer draws;
    private Integer losses;
    private Integer goalsFor;
    private Integer goalsAgainst;
    private Integer goalDifference;

    public Stats(Integer competitionID, Integer clubID, Integer points, Integer matchesPlayed, Integer wins, Integer draws, Integer losses, Integer goalsFor, Integer goalsAgainst, Integer goalDifference) {
        this.competitionID = competitionID;
        this.clubID = clubID;
        this.points = points;
        this.matchesPlayed = matchesPlayed;
        this.wins = wins;
        this.draws = draws;
        this.losses = losses;
        this.goalsFor = goalsFor;
        this.goalsAgainst = goalsAgainst;
        this.goalDifference = goalDifference;
    }

    public Integer getCompetitionID() {
        return competitionID;
    }

    public void setCompetitionID(Integer competitionID) {
        this.competitionID = competitionID;
    }

    public Integer getClubID() {
        return clubID;
    }

    public void setClubID(Integer clubID) {
        this.clubID = clubID;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Integer getMatchesPlayed() {
        return matchesPlayed;
    }

    public void setMatchesPlayed(Integer matchesPlayed) {
        this.matchesPlayed = matchesPlayed;
    }

    public Integer getWins() {
        return wins;
    }

    public void setWins(Integer wins) {
        this.wins = wins;
    }

    public Integer getDraws() {
        return draws;
    }

    public void setDraws(Integer draws) {
        this.draws = draws;
    }

    public Integer getLosses() {
        return losses;
    }

    public void setLosses(Integer losses) {
        this.losses = losses;
    }

    public Integer getGoalsFor() {
        return goalsFor;
    }

    public void setGoalsFor(Integer goalsFor) {
        this.goalsFor = goalsFor;
    }

    public Integer getGoalsAgainst() {
        return goalsAgainst;
    }

    public void setGoalsAgainst(Integer goalsAgainst) {
        this.goalsAgainst = goalsAgainst;
    }

    public Integer getGoalDifference() {
        return goalDifference;
    }

    public void setGoalDifference(Integer goalDifference) {
        this.goalDifference = goalDifference;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Stats)) return false;

        Stats that = (Stats) obj;
        return  Objects.equals(competitionID, that.competitionID) &&
                Objects.equals(clubID, that.clubID) &&
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
        return Objects.hash(competitionID, clubID, points, matchesPlayed, wins, draws, losses, goalsFor, goalsAgainst, goalDifference);
    }
}
