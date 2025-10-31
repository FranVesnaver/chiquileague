# ChiquiLeague

ChiquiLeague is a football management simulator inspired by classic titles like Football Manager and PC Fútbol.
You take on the role of a club manager — build your team, compete in national and international tournaments, and lead your club to glory season after season.

## Main Features
- Multiple competition types:

  - National leagues with promotion and relegation.

  - Domestic cups with knockout rounds.

  - Continental tournaments like the Copa Libertadores.

- Dynamic season system:
  - Each game starts on a chosen date and simulates entire football seasons.

- Squad management:
  - Inspect your players, check their stats (passing, shooting, pace, etc.), and see which positions they can play.

- Match results and stats: 
  - Matches record scores, goals for and against, all kinds of statistics get recorded after each season

- International realism: 
  - Countries, leagues, and cups are modeled with real-world structure.

## Game Overview

In ChiquiLeague, you control every key aspect of a football club:

- Compete in domestic leagues, national cups, and international tournaments.
- Manage your squad: view players, their stats, and preferred positions.
- Follow your team’s fixtures and results through a realistic season calendar.
- Progress day by day, with new matches and competitions as the season unfolds.
- Save your game anytime and continue later exactly where you left off.

The game currently runs in the console, offering a clear text-based interface that guides you through all menus and actions.

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