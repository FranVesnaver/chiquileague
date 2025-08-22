package org.chiquileague.model;

public class Country {
    Integer id;
    String name;

    public Country(Integer id, String name) {
        this.id = id;
        this.name = name;
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

    @Override
    public boolean equals(Object obj) {
        if (this ==  obj) return true; //referential equality
        if (!(obj instanceof Country)) return false;

        Country countryObj = (Country) obj;
        if (!this.id.equals(countryObj.getId())) return false;
        if (!this.name.equals(countryObj.getName())) return false;
        return true;
    }
}
