package org.chiquileague.mvc;

import java.util.List;

public interface View {
    void mainMenu();
    void gameMenu();
    void errorMessage(String msg);
    void print(String msg);
    void showList(List<?> list);
    void showSquad();

    void formationMenu();
    void calendarMenu();
    void informationMenu();
    void nextDayMenu();
}
