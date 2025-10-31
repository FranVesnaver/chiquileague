package org.chiquileague.model;

import java.util.Objects;

public class Team implements Entity {
    private Integer id;
    private String name;
    private Integer leagueID;

    public Team(Integer id, String name, Integer leagueID) {
        this.id = id;
        this.name = name;
        this.leagueID = leagueID;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getLeagueID() {
        return leagueID;
    }

    @Override
    public boolean equals(Object obj) {
        if (this ==  obj) return true; //referential equality
        if (!(obj instanceof Team)) return false;

        Team that = (Team) obj;
        return  Objects.equals(this.id, that.id) &&
                Objects.equals(this.name, that.name) &&
                Objects.equals(this.leagueID, that.leagueID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, leagueID);
    }

    @Override
    public String toString() {
        return name;
    }
}
