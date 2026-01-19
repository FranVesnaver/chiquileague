package org.chiquileague.model;

import java.util.Objects;

public class Stadium implements Entity {
    private final Integer id;
    private final Team club;
    private final String name;
    private Integer capacity;

    public Stadium(Integer id, String name, Integer capacity, Team club) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.club = club;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Team getClub() {
        return club;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Stadium)) return false;
        Stadium stadium = (Stadium) obj;
        return  Objects.equals(id, stadium.id) &&
                Objects.equals(name, stadium.name) &&
                Objects.equals(club, stadium.club);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, club);
    }

    @Override
    public String toString() {
        return name;
    }
}
