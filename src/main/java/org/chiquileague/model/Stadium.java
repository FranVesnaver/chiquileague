package org.chiquileague.model;

import java.util.Objects;

public class Stadium {
    private Integer id;
    private String name;
    private Integer capacity;
    private Integer clubID;

    public Stadium(Integer id, String name, Integer capacity, Integer clubID) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.clubID = clubID;
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

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getClubID() {
        return clubID;
    }

    public void setClubID(Integer clubID) {
        this.clubID = clubID;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Stadium)) return false;
        Stadium stadium = (Stadium) obj;
        return  Objects.equals(id, stadium.id) &&
                Objects.equals(name, stadium.name) &&
                Objects.equals(clubID, stadium.clubID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, clubID);
    }
}
