package org.chiquileague.model;

import java.time.LocalDate;
import java.util.*;

public class Season {
    private LocalDate startDate;
    private LocalDate currentDate;
    private List<Competition> competitions;
    private Map<LocalDate, List<Match>> calendar;

    public Season(LocalDate startDate){
        this.startDate = startDate;
        this.currentDate = startDate;
        this.competitions = new ArrayList<>();
        this.calendar = new HashMap<>();
    }

    public void addCompetition(Competition competition) {
        competitions.add(competition);
    }

    public void addMatches(LocalDate date, List<Match> matches) {
        calendar.put(date, matches);
    }

    public List<Match> getMatchesOfTheDay(LocalDate date) {
        return calendar.getOrDefault(date, List.of());
    }

    public void nextDay() {
        currentDate = currentDate.plusDays(1);
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getCurrentDate() {
        return currentDate;
    }

    public List<Competition> getCompetitions() {
        return competitions;
    }

    public Map<LocalDate, List<Match>> getCalendar() {
        return calendar;
    }
}
