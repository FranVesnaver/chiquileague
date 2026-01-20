package org.chiquileague.model;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class Player {
    private final int id;
    private final String name;
    private Date birthDate;
    private int age;
    private String nationality;
    private String foot;
    private float height;

    private List<Position> positions;

    private Team clubID;
    private Integer contractID;
    private Integer youthAcademyID;

    public Player(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Player(int id, String name, Date birthDate, int age, String nationality, String foot, float height, Integer youthAcademyID, List<Position> positions) {
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
        this.age = age;
        this.nationality = nationality;
        this.foot = foot;
        this.height = height;
        this.youthAcademyID = youthAcademyID;
        this.positions = positions;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Position> getPositions() {
        return positions;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Player)) return false;

        Player that = (Player) obj;
        return  id == that.id &&
                Objects.equals(name, that.name) &&
                Objects.equals(birthDate, that.birthDate) &&
                Objects.equals(nationality, that.nationality);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, birthDate, nationality);
    }

    @Override
    public String toString() {
        return name;
    }
}