package org.chiquileague.model;

public class Team {
    private Integer id;
    private String name;
    private Integer league_id;

    public Team(Integer id, String name, Integer league_id) {
        this.id = id;
        this.name = name;
        this.league_id = league_id;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getLeague_id() {
        return league_id;
    }
}
