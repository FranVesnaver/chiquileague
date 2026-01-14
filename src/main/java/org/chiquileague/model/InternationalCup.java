package org.chiquileague.model;

import org.chiquileague.dao.CountryDAO;

import java.util.*;

public class InternationalCup extends Competition {
    private final List<Country> countries = new ArrayList<>();

    public InternationalCup(Integer id, String name, String competitionFormat, List<Integer> countriesIDs) {
        super(id, name, competitionFormat);

        for (Integer countryID : countriesIDs) {
            Country country = CountryDAO.fetch(countryID);
            countries.add(country);
        }
    }

    public List<Country> getCountries() {
        return countries;
    }

    @Override
    public boolean equals(Object obj) {
        if (!super.equals(obj)) return false;
        if (!(obj instanceof InternationalCup)) return false;

        InternationalCup that = (InternationalCup) obj;
        return Objects.equals(Set.copyOf(countries), Set.copyOf(that.countries));
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), new HashSet<>(countries));
    }
}
