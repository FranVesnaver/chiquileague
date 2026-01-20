package org.chiquileague.model;

import java.util.Objects;

public class Team {
    private final Integer id;
    private final String name;
    private final League league;

    public Team(Integer id, String name, League league) {
        this.id = id;
        this.name = name;
        this.league = league;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public League getLeague() {
        return league;
    }

    @Override
    public boolean equals(Object obj) {
        if (this ==  obj) return true; //referential equality
        if (!(obj instanceof Team)) return false;

        Team that = (Team) obj;
        return  Objects.equals(this.id, that.id) &&
                Objects.equals(this.name, that.name) &&
                Objects.equals(this.league, that.league);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, league);
    }

    @Override
    public String toString() {
        return name;
    }
}
