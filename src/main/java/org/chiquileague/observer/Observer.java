package org.chiquileague.observer;

import org.chiquileague.model.GameInfo;

public interface Observer {
    void update(GameInfo info);
}
