package org.chiquileague.mvc;

import java.util.List;
import java.util.Objects;

public interface View {
    void mainMenu();
    void gameMenu();
    void errorMessage(String msg);
    void print(String msg);
    void showList(List<?> list);
    void showMatchesOfTheDay();
    void showSquad();
    void showCalendar();
}
