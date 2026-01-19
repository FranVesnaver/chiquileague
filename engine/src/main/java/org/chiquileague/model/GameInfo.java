package org.chiquileague.model;

import org.chiquileague.dao.TeamDAO;

import java.sql.Date;
import java.util.Objects;

public class GameInfo implements Entity {
    private final Integer id;
    private final String name;
    private final Team selectedTeam;
    private Date time;

    public GameInfo(Integer id, String name, Integer clubID, Date time) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.selectedTeam = TeamDAO.fetch(clubID);
    }

    public Integer getId() {
        return id;
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

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof GameInfo)) return false;

        GameInfo that = (GameInfo) obj;
        return  Objects.equals(id, that.id) &&
                Objects.equals(name, that.name) &&
                Objects.equals(time, that.time) &&
                Objects.equals(selectedTeam, that.selectedTeam);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, time, selectedTeam);
    }
}
