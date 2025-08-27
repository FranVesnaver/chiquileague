package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.*;

public class InternationalCup extends Competition{
    private List<Integer> countriesIDs;

    public InternationalCup(Integer id, String name, String competitionFormat, List<Integer> countriesIDs) {
        super(id, name, competitionFormat);
        this.countriesIDs = countriesIDs;
    }

    public List<Integer> getCountriesIDs() {
        return countriesIDs;
    }

    public void setCountriesIDs(List<Integer> countriesIDs) {
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

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof InternationalCup)) return false;

        InternationalCup that = (InternationalCup) obj;
        return Objects.equals(Set.copyOf(countriesIDs), Set.copyOf(that.countriesIDs));
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), new HashSet<>(countriesIDs));
    }
}
