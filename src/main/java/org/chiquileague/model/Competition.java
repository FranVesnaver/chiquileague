package org.chiquileague.model;

public class Competition {
    private Integer id;
    private String name;
    private String CompetitionFormat;

    public Competition(Integer id, String name, String competitionFormat) {
        this.id = id;
        this.name = name;
        CompetitionFormat = competitionFormat;
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
        return CompetitionFormat;
    }

    public void setCompetitionFormat(String competitionFormat) {
        CompetitionFormat = competitionFormat;
    }
}
