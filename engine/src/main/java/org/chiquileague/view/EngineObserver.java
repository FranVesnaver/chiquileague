package org.chiquileague.view;

import org.chiquileague.model.GameInfo;

public interface EngineObserver {
    void update(GameInfo info);
}
