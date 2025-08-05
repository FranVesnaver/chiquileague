package org.chiquileague.model;

public class Team {
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
}
