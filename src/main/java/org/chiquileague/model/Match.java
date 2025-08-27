package org.chiquileague.model;

import org.chiquileague.dao.StadiumDAO;
import org.chiquileague.dao.TeamDAO;

import java.sql.Date;
import java.util.Objects;

public class Match {
    private Integer id;
    private Date date;
    private Integer homeGoals;
    private Integer awayGoals;
    private Integer homeClubID;
    private Integer awayClubID;
    private Integer stadiumID;
    private Integer competitionID;
    private Integer matchday;

    public Match(Integer id, Date date, Integer homeGoals, Integer awayGoals, Integer homeClubID, Integer awayClubID, Integer stadiumID, Integer competitionID, Integer matchday) {
        this.id = id;
        this.date = date;
        this.homeGoals = homeGoals;
        this.awayGoals = awayGoals;
        this.homeClubID = homeClubID;
        this.awayClubID = awayClubID;
        this.stadiumID = stadiumID;
        this.competitionID = competitionID;
        this.matchday = matchday;
    }

    public Match(Date date, Integer homeGoals, Integer awayGoals, Integer homeClubID, Integer awayClubID, Integer stadiumID, Integer competitionID, Integer matchday) {
        this.date = date;
        this.homeGoals = homeGoals;
        this.awayGoals = awayGoals;
        this.homeClubID = homeClubID;
        this.awayClubID = awayClubID;
        this.stadiumID = stadiumID;
        this.competitionID = competitionID;
        this.matchday = matchday;
    }

    public Team getHomeClub(){
        return TeamDAO.fetch(homeClubID);
    }

    public Team getAwayClub(){
        return TeamDAO.fetch(awayClubID);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getHomeGoals() {
        return homeGoals;
    }

    public void setHomeGoals(Integer homeGoals) {
        this.homeGoals = homeGoals;
    }

    public Integer getAwayGoals() {
        return awayGoals;
    }

    public void setAwayGoals(Integer awayGoals) {
        this.awayGoals = awayGoals;
    }

    public Integer getHomeClubID() {
        return homeClubID;
    }

    public void setHomeClubID(Integer homeClubID) {
        this.homeClubID = homeClubID;
    }

    public Integer getAwayClubID() {
        return awayClubID;
    }

    public void setAwayClubID(Integer awayClubID) {
        this.awayClubID = awayClubID;
    }

    public Integer getStadiumID() {
        return stadiumID;
    }

    public void setStadiumID(Integer stadiumID) {
        this.stadiumID = stadiumID;
    }

    public Stadium getStadium(){
        return StadiumDAO.fetch(stadiumID);
    }

    public Integer getCompetitionID() {
        return competitionID;
    }

    public void setCompetitionID(Integer competitionID) {
        this.competitionID = competitionID;
    }

    public Integer getMatchday() {
        return matchday;
    }

    public void setMatchday(Integer matchday) {
        this.matchday = matchday;
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
                Objects.equals(homeClubID, that.homeClubID) &&
                Objects.equals(awayClubID, that.awayClubID) &&
                Objects.equals(stadiumID, that.stadiumID) &&
                Objects.equals(competitionID, that.competitionID) &&
                Objects.equals(matchday, that.matchday);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, homeGoals, awayGoals, homeClubID, awayClubID, stadiumID, competitionID, matchday);
    }
}
