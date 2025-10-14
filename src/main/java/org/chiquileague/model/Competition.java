package org.chiquileague.model;

import java.util.Objects;

public abstract class Competition {
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

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;   // referential equality
        if (!(obj instanceof Competition)) return false;

        Competition that = (Competition) obj;

        return  Objects.equals(this.id, that.id) &&
                Objects.equals(this.name, that.name) &&
                Objects.equals(this.competitionFormat, that.competitionFormat);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, competitionFormat);
    }
}
