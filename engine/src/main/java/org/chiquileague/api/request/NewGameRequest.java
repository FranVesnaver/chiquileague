package org.chiquileague.api.request;

public record NewGameRequest(
        int countryID,
        int leagueID,
        int teamID,
        String saveName
) {}
