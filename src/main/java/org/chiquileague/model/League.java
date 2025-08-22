package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

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
        if (this ==  obj) return true; //referential equality
        if (!(obj instanceof League)) return false;

        League leagueObj = (League) obj;
        if (!super.getId().equals(leagueObj.getId())) return false;
        if (!super.getName().equals(leagueObj.getName())) return false;
        if (!super.getCompetitionFormat().equals(leagueObj.getCompetitionFormat())) return false;
        if (!this.countryID.equals(leagueObj.getCountryID())) return false;
        if (!this.leagueRank.equals(leagueObj.getLeagueRank())) return false;
        return true;
    }
}
