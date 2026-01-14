package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.Objects;

public class League extends Competition{
    private final Country country;
    private final Integer leagueRank;

    public League(Integer id, String name, String competitionFormat, Integer countryID, Integer leagueRank) {
        super(id, name, competitionFormat);
        this.country = CountryDAO.fetch(countryID);
        this.leagueRank = leagueRank;
    }

    public Country getCountry() {
        return country;
    }

    public Integer getLeagueRank() {
        return leagueRank;
    }

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof League)) return false;

        League that = (League) obj;
        return Objects.equals(this.country, that.country) &&
                Objects.equals(this.leagueRank, that.leagueRank);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), country, leagueRank);
    }
}
