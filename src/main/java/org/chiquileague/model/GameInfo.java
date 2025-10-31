package org.chiquileague.model;

import org.chiquileague.dao.TeamDAO;

import java.sql.Date;
import java.util.Objects;

public class GameInfo implements Entity {
    private Integer id;
    private String name;
    private Integer clubID;
    private Date time;
    private Team selectedTeam;

    public GameInfo(Integer id, String name, Integer clubID, Date time) {
        this.id = id;
        this.name = name;
        this.clubID = clubID;
        this.time = time;
        selectedTeam = TeamDAO.fetch(clubID);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getClubID() {
        return clubID;
    }

    public void setClubID(Integer clubID) {
        this.clubID = clubID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Team getSelectedTeam(){
        return selectedTeam;
    }

    public void setSelectedTeam(Team selectedTeam){
        this.selectedTeam = selectedTeam;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof GameInfo)) return false;

        GameInfo that = (GameInfo) obj;
        return  Objects.equals(id, that.id) &&
                Objects.equals(name, that.name) &&
                Objects.equals(clubID, that.clubID) &&
                Objects.equals(time, that.time) &&
                Objects.equals(selectedTeam, that.selectedTeam);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, clubID, time, selectedTeam);
    }
}
