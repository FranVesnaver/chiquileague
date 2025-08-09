package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

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
}
