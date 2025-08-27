package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.Objects;

public class League extends Competition{
    private Integer countryID;
    private Integer leagueRank;

    public League(Integer id, String name, String competitionFormat, Integer countryID, Integer leagueRank) {
        super(id, name, competitionFormat);
        this.countryID = countryID;
        this.leagueRank = leagueRank;
    }

    public Integer getCountryID() {
        return countryID;
    }

    public void setCountryID(Integer countryID) {
        this.countryID = countryID;
    }

    public Country getCountry() {
        return CountryDAO.fetch(countryID);
    }

    public void setCountry(Country country) {
        this.countryID = country.getId();
    }

    public Integer getLeagueRank() {
        return leagueRank;
    }

    public void setLeagueRank(Integer leagueRank) {
        this.leagueRank = leagueRank;
    }

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof League)) return false;

        League that = (League) obj;
        return Objects.equals(this.countryID, that.countryID) &&
                Objects.equals(this.leagueRank, that.leagueRank);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), countryID, leagueRank);
    }
}
