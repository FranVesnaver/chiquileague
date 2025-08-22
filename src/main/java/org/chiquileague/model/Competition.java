package org.chiquileague.model;

public class Competition {
    private Integer id;
    private String name;
    private String competitionFormat;

    public Competition(Integer id, String name, String competitionFormat) {
        this.id = id;
        this.name = name;
        this.competitionFormat = competitionFormat;
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

    public String getCompetitionFormat() {
        return competitionFormat;
    }

    public void setCompetitionFormat(String competitionFormat) {
        this.competitionFormat = competitionFormat;
    }
}
