module org.chiquileague {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;

    exports org.chiquileague.app;
    opens org.chiquileague.app to javafx.fxml;
}
