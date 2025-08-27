package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.Objects;

public class NationalCup extends Competition {
    private Integer countryID;

    public NationalCup(Integer id, String name, String competitionFormat, Integer countryID) {
        super(id, name, competitionFormat);
        this.countryID = countryID;
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

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof NationalCup)) return false;

        NationalCup that = (NationalCup) obj;
        return Objects.equals(this.countryID, that.countryID);
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), countryID);
    }
}
