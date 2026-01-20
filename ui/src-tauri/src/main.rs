// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use std::process::{Child, Command, Stdio};
use std::io::{Write, BufRead, BufReader};
use std::sync::Mutex;

struct Engine {
    process: Child,
}

fn main() {
    let child = Command::new("java")
        .arg("-jar")
        .arg("../../engine/target/ChiquiLeague-1.0-SNAPSHOT.jar")
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
        .expect("failed to start java engine");

    tauri::Builder::default()
        .manage(Mutex::new(Engine { process: child }))
        .invoke_handler(tauri::generate_handler![ping_engine])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}

#[tauri::command]
fn ping_engine(state: tauri::State<Mutex<Engine>>) -> Result<String, String> {
    let mut engine = state.lock().unwrap();

    // escribir
    {
        let stdin = engine.process.stdin.as_mut().ok_or("No stdin")?;
        writeln!(stdin, r#"{{"type":"ping"}}"#).map_err(|e| e.to_string())?;
    } // <- acá se libera el borrow de stdin

    // leer
    {
        let stdout = engine.process.stdout.as_mut().ok_or("No stdout")?;
        let mut reader = BufReader::new(stdout);
        let mut response = String::new();
        reader.read_line(&mut response).map_err(|e| e.to_string())?;
        Ok(response)
    }
}