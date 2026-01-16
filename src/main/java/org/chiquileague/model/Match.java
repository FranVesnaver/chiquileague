package org.chiquileague.model;

import java.sql.Date;
import java.util.Objects;

public class Match implements Entity {
    private Integer id;
    private final Date date;
    private final Team homeClub;
    private final Team awayClub;
    private final Stadium stadium;
    private final Competition competition;
    private final Integer matchday;

    private Integer homeGoals;
    private Integer awayGoals;

    public Match(Date date, Integer homeGoals, Integer awayGoals, Team homeClub, Team awayClub, Stadium stadium, Competition competition, Integer matchday) {
        this.date = date;
        this.homeGoals = homeGoals;
        this.awayGoals = awayGoals;
        this.homeClub = homeClub;
        this.awayClub = awayClub;
        this.stadium = stadium;
        this.competition = competition;
        this.matchday = matchday;
    }

    public Match(Integer id, Date date, Integer homeGoals, Integer awayGoals, Team homeClub, Team awayClub, Stadium stadium, Competition competition, Integer matchday) {
        this(date, homeGoals, awayGoals, homeClub, awayClub, stadium, competition, matchday);
        this.id = id;
    }


    public Date getDate() {
        return date;
    }

    public Team getHomeClub() {
        return homeClub;
    }

    public Team getAwayClub() {
        return awayClub;
    }

    public Stadium getStadium() {
        return stadium;
    }

    public Competition getCompetition() {
        return competition;
    }

    public Integer getHomeGoals() {
        return homeGoals;
    }

    public Integer getAwayGoals() {
        return awayGoals;
    }

    public void setHomeGoals(Integer homeGoals) {
        this.homeGoals = homeGoals;
    }

    public void setAwayGoals(Integer awayGoals) {
        this.awayGoals = awayGoals;
    }

    public Integer getMatchday() {
        return matchday;
    }

    @Override
    public String toString() {
        return "Match{" +
                "id=" + id +
                ", date=" + date +
                ", homeClub=" + homeClub +
                ", awayClub=" + awayClub +
                ", stadium=" + stadium +
                ", competition=" + competition +
                ", matchday=" + matchday +
                ", homeGoals=" + homeGoals +
                ", awayGoals=" + awayGoals +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Match)) return false;

        Match that = (Match) obj;
        return  Objects.equals(id, that.id) &&
                Objects.equals(date, that.date) &&
                Objects.equals(homeGoals, that.homeGoals) &&
                Objects.equals(awayGoals, that.awayGoals) &&
                Objects.equals(homeClub, that.homeClub) &&
                Objects.equals(awayClub, that.awayClub) &&
                Objects.equals(stadium, that.stadium) &&
                Objects.equals(competition, that.competition) &&
                Objects.equals(matchday, that.matchday);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, homeGoals, awayGoals, homeClub, awayClub, stadium, competition, matchday);
    }
}
