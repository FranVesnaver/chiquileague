package org.chiquileague.model;

import org.chiquileague.dao.TeamDAO;

import java.sql.Date;

public class GameInfo {
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
        selectedTeam = new TeamDAO(clubID).getModel();
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
}
