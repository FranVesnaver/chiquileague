package org.chiquileague.model;

import java.util.Date;

public class Player {
    private int id;
    private String name;
    private Date birth_date;
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
    private int decision_making;
    private int strength;

    private String[] position;

    private int clubID;
    private int contractID;
    private int youthAcademyID;

    public Player(int id, String name, Date birth_date, int age, String nationality, String foot, float height, int passing, int shooting, int dribbling, int tackling, int pace, int stamina, int vision, int positioning, int decision_making, int strength, String[] position, int clubID, int contractID, int youthAcademyID) {
        this.id = id;
        this.name = name;
        this.birth_date = birth_date;
        this.age = age;
        this.nationality = nationality;
        this.foot = foot;
        this.height = height;
        this.passing = passing;
        this.shooting = shooting;
        this.dribbling = dribbling;
        this.tackling = tackling;
        this.pace = pace;
        this.stamina = stamina;
        this.vision = vision;
        this.positioning = positioning;
        this.decision_making = decision_making;
        this.strength = strength;
        this.position = position;
        this.clubID = clubID;
        this.contractID = contractID;
        this.youthAcademyID = youthAcademyID;
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

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
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

    public int getDecision_making() {
        return decision_making;
    }

    public void setDecision_making(int decision_making) {
        this.decision_making = decision_making;
    }

    public int getStrength() {
        return strength;
    }

    public void setStrength(int strength) {
        this.strength = strength;
    }

    public String[] getPosition() {
        return position;
    }

    public void setPosition(String[] position) {
        this.position = position;
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

    public int getYouthAcademyID() {
        return youthAcademyID;
    }

    public void setYouthAcademyID(int youthAcademyID) {
        this.youthAcademyID = youthAcademyID;
    }
}
