use std::io::{self, Write};

fn main() {
    let menu_items = vec![
        "APT Update",
        "Display Disk Space",
        "Display System Information",
        "Get Network (local) IP Address",
        "Path Includes",
        "Week of the Year",
        "When is Easter?",
        "Watch Star Wars Instead",
        "Quit",
    ];

    loop {
        println!("Choose an option:");
        for (index, item) in menu_items.iter().enumerate() {
            println!("{}) {}", index + 1, item);
        }

        let mut input = String::new();
        print!("Enter Selection, $USER [1-9] > ");
        io::stdout().flush().unwrap();
        io::stdin().read_line(&mut input).expect("Failed to read line");

        match input.trim().parse::<usize>() {
            Ok(choice) => match choice {
                0 => {
                    // Open the URL
                    println!("Opening https://www.d3c3p7.com in your default browser!");
                    // Implement opening URL functionality here
                }
                1..=8 => {
                    // Handle options 1-8
                    match choice {
                        1 => {
                            // APT Update
                            println!("Running sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y");
                            // Implement the update logic here
                        }
                        2 => {
                            // Display Disk Space
                            println!("Running df -h");
                            // Implement disk space display logic here
                        }
                        3 => {
                            // Display System Information
                            println!("Hostname: {:?}", hostname::get().unwrap());
                            // Implement system information display logic here
                        }
                        4 => {
                            // Get Network (local) IP Address
                            println!("Your local IP address is: {:?}", local_ipaddress::get().unwrap());
                            // Implement local IP address retrieval logic here
                        }
                        5 => {
                            // Path Includes
                            println!("Weak human, this is your PATH:\n{:?}", std::env::var("PATH").unwrap());
                            // Implement PATH display logic here
                        }
                        6 => {
                            // Week of the Year
                            println!("The week is: {:?}", chrono::Local::now().iso_week().week());
                            // Implement week of the year logic here
                        }
                        7 => {
                            // When is Easter?
                            println!("This year's Easter is on: {:?}", chrono::Local::now().with_month(4).and_then(|d| d.with_day(4)));
                            // Implement Easter calculation logic here
                        }
                        8 => {
                            // Watch Star Wars Instead
                            println!("Get ready to watch Star Wars!");
                            // Implement Star Wars watching logic here
                        }
                        _ => unreachable!(),
                    }

                    println!("Press Enter to return to the menu.");
                    let mut dummy_input = String::new();
                    io::stdin().read_line(&mut dummy_input).expect("Failed to read line");
                }
                9 => {
                    // Quit
                    let quotes = [
                        "Humans don't deserve to live!",
                        "You fail me yet again, Starscream. GET THEM!",
                        "Is it fear or courage that compels you, fleshling?",
                        "Give me the Allspark, and you may live to be my pet.",
                    ];

                    let rand_index = rand::random::<usize>() % quotes.len();
                    println!("{}", quotes[rand_index]);
                    return;
                }
                _ => {
                    // Invalid choice
                    println!("Invalid choice. Try again.");
                }
            },
            Err(_) => {
                // Invalid input
                println!("Invalid input. Enter a number.");
            }
        }
    }
}

