package org.chiquileague.model;

public class League {
    private Integer id;                 //from competition
    private String name;                //from competition
    private String competitionFormat;   //from competition
    private Integer country_id;
    private Integer league_rank;

    public League(Integer id, String name, String competitionFormat, Integer country_id, Integer league_rank) {
        this.id = id;
        this.name = name;
        this.competitionFormat = competitionFormat;
        this.country_id = country_id;
        this.league_rank = league_rank;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCompetitionFormat() {
        return competitionFormat;
    }

    public Integer getCountry_id() {
        return country_id;
    }

    public Integer getLeague_rank() {
        return league_rank;
    }
}
