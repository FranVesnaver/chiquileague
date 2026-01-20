package org.chiquileague.app;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Map;

public class App {

    private static final ObjectMapper mapper = new ObjectMapper();

    public static void main (String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        PrintWriter out = new PrintWriter(System.out, true);

        String line;
        while ((line = in.readLine()) != null) {
            Map<String, Object> request = mapper.readValue(line, Map.class);

            String type = (String) request.get("type");

            if ("ping".equals(type)) {
                out.println("""
                        {"type": "pong"}
                        """
                );
            } else {
                out.println("""
                        {"type": "error", "message": "Unknown command"}
                        """
                );
            }
        }
    }
}
