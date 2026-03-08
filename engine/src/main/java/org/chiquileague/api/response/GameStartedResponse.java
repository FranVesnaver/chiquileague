package org.chiquileague.api.response;

import org.chiquileague.model.Team;

public record GameStartedResponse(
        String saveName,
        Team selectedTeam
) {}
