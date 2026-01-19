# On changes in the database
On any change in the database schema or the structures of the tables, one must reload the databases using the following commands

- For main database
```bash
cd src/main/resources/org/chiquileague/db/
rm chiqui.db
sqlite3 chiqui.db < ../sql/schema.sql
sqlite3 chiqui.db < ../sql/mvp.sql
```

- For test database
```bash
cd src/test/resources
rm test_template.db
sqlite3 test_template.db < ../../main/resources/org/chiquileague/sql/schema.sql
sqlite3 test_template.db < ../../main/resources/org/chiquileague/sql/test.sql
```