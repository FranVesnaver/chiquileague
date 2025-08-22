package org.chiquileague.dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;

public class TestDatabase {

    private static final Path templatePath = Path.of("src/test/resources/test_template.db");
    private static final Path testDBPath = Path.of("target/test.db");

    public static void setUpTestDatabase() throws IOException, SQLException {
        Files.createDirectories(testDBPath.getParent());
        Files.copy(templatePath, testDBPath, StandardCopyOption.REPLACE_EXISTING);

        Database.connectTo(testDBPath);
    }

    public static void tearDownTestDatabase() throws IOException {
        Database.close();
        Files.deleteIfExists(testDBPath);
    }
}
