package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.ArrayList;
import java.util.List;

public class InternationalCup extends Competition{
    private List<Integer> countriesIDs;

    public InternationalCup(Integer id, String name, String competitionFormat, List<Integer> countriesIDs) {
        super(id, name, competitionFormat);
        this.countriesIDs = countriesIDs;
    }

    public List<Country> getCountries() {
        List<Country> countries = new ArrayList<>();
        for (Integer countryID : countriesIDs)
            countries.add(CountryDAO.fetch(countryID));
        return countries;
    }

    public void setCountries(List<Country> countries) {
        List<Integer> countriesIDs = new ArrayList<>();
        for (Country country : countries)
            countriesIDs.add(country.getId());
        this.countriesIDs = countriesIDs;
    }
}
