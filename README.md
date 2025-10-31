# ChiquiLeague
Executing the MVP (on the pom.xml path): 
```bash
mvn exec:java -Dexec.mainClass="org.chiquileague.app.MVP"
```


# ChiquiLeague

ChiquiLeague is a football management simulator inspired by titles like Football Manager, focused on the Argentine league system (but easily adaptable to other national and international competitions).
Its main goal is to offer a complete model of the football ecosystem — leagues, cups, teams, players, and stats — built with a modular, extensible, and testable Java architecture.

## Main Features



## Project Architecture

The project is organized into well-defined packages to preserve clear separation of concerns:

```
src/main/java/org/chiquileague/
├── app/           → Application entry point (App, MVP)
├── controller/    → Game flow control logic (MVPController)
├── dao/           → Data access layer (DAOs and SQLite connection)
├── fixture/       → Fixture generators for different competition formats
├── format/        → (Reserved) custom rule and format definitions
├── model/         → Domain model (League, Team, Player, etc.)
├── mvc/           → Core MVC interfaces (Model, View, Controller)
├── observer/      → Observer pattern interfaces (Subject, Observer)
└── view/          → View implementations 
```

The game uses an embedded SQLite database (chiqui.db) defined in src/main/resources/org/chiquileague/sql/schema.sql.
 
## Running the Game

Currently, there's a console driven MVP viable to play a limited version of the game

Compile and run the MVP with Maven:
```bash
mvn clean compile exec:java -Dexec.mainClass="org.chiquileague.app.App"
```

During execution:
- The user can create a new game or load an existing save.
- Choose a country, league, and team.
- Interact with the game via a console-based menu system.

## Technologies

- Java 17
- SQLite (via JDBC)
- JUnit 5 (testing)
- Maven (build)
- PlantUML (documentation)

## Next Steps

- Implement full match simulation logic.
- Add a graphical interface (JavaFX or web).
- Expand player and team statistics.
- Introduce multi-season support with automatic promotions and relegations.
- Add autosave and incremental persistence.

## Author

Developed by Franco Vesnaver
as a personal Software Engineering project, modeling a realistic football management simulator.