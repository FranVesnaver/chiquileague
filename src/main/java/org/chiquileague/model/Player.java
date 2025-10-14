package org.chiquileague.model;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class Player {
    private int id;
    private String name;
    private Date birthDate;
    private int age;
    private String nationality;

    private String foot;
    private float height;
    private int passing;
    private int shooting;
    private int dribbling;
    private int tackling;
    private int pace;
    private int stamina;
    private int vision;
    private int positioning;
    private int decisionMaking;
    private int strength;

    private List<Position> positions;

    private int attrID;
    private int clubID;
    private int contractID;
    private Integer youthAcademyID;

    public Player(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Player(int id, String name, Date birthDate, int age, String nationality, String foot, float height, int attrID, Integer youthAcademyID, List<Position> positions) {
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
        this.age = age;
        this.nationality = nationality;
        this.foot = foot;
        this.height = height;
        this.attrID = attrID;
        this.youthAcademyID = youthAcademyID;
        this.positions = positions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getFoot() {
        return foot;
    }

    public void setFoot(String foot) {
        this.foot = foot;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public int getPassing() {
        return passing;
    }

    public void setPassing(int passing) {
        this.passing = passing;
    }

    public int getShooting() {
        return shooting;
    }

    public void setShooting(int shooting) {
        this.shooting = shooting;
    }

    public int getDribbling() {
        return dribbling;
    }

    public void setDribbling(int dribbling) {
        this.dribbling = dribbling;
    }

    public int getTackling() {
        return tackling;
    }

    public void setTackling(int tackling) {
        this.tackling = tackling;
    }

    public int getPace() {
        return pace;
    }

    public void setPace(int pace) {
        this.pace = pace;
    }

    public int getStamina() {
        return stamina;
    }

    public void setStamina(int stamina) {
        this.stamina = stamina;
    }

    public int getVision() {
        return vision;
    }

    public void setVision(int vision) {
        this.vision = vision;
    }

    public int getPositioning() {
        return positioning;
    }

    public void setPositioning(int positioning) {
        this.positioning = positioning;
    }

    public int getDecisionMaking() {
        return decisionMaking;
    }

    public void setDecisionMaking(int decisionMaking) {
        this.decisionMaking = decisionMaking;
    }

    public int getStrength() {
        return strength;
    }

    public void setStrength(int strength) {
        this.strength = strength;
    }

    public List<Position> getPositions() {
        return positions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }

    public int getAttrID() {
        return attrID;
    }

    public void setAttrID(int attrID) {
        this.attrID = attrID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    public Integer getYouthAcademyID() {
        return youthAcademyID;
    }

    public void setYouthAcademyID(Integer youthAcademyID) {
        this.youthAcademyID = youthAcademyID;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Player)) return false;

        Player that = (Player) obj;
        return  id == that.id &&
                attrID == that.attrID &&
                Objects.equals(name, that.name) &&
                Objects.equals(birthDate, that.birthDate) &&
                Objects.equals(nationality, that.nationality);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, birthDate, nationality, attrID);
    }

    @Override
    public String toString() {
        return name;
    }
}