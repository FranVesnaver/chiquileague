package org.chiquileague.model;

public class League {
    private Integer id;     //from competition
    private String name;    //from competition
    private Integer country_id;
    private Integer league_rank;

    public League(Integer id, String name, Integer country_id, Integer league_rank) {
        this.id = id;
        this.name = name;
        this.country_id = country_id;
        this.league_rank = league_rank;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getCountry_id() {
        return country_id;
    }

    public Integer getLeague_rank() {
        return league_rank;
    }
}
