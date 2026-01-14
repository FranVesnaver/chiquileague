package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.Objects;

public class NationalCup extends Competition {
    private Country country;

    public NationalCup(Integer id, String name, String competitionFormat, Integer countryID) {
        super(id, name, competitionFormat);
        this.country = CountryDAO.fetch(countryID);
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof NationalCup)) return false;

        NationalCup that = (NationalCup) obj;
        return Objects.equals(this.country, that.country);
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), country);
    }
}
