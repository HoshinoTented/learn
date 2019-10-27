use std::io;
use std::io::Read;

fn guess_number(num: u32, low: u32, high: u32) -> u32 {
    let mut low = low;
    let mut high = high;
    let mut count = 0;

    loop {
        println!("Please guess a number between {} and {}.", low, high);

        let mut line = String::new();
        io::stdin().read_line(&mut line).expect("error");

        let guess = line.trim().parse::<u32>().expect("error");

        if guess < low || high < guess {
            println!("[ERROR] The number {} is out of bounds!", guess);
        } else {
            count = count + 1;

            if guess == num {
                println!("You win!");
                break;
            } else if guess < num {
                low = guess;
            } else {
                high = guess;
            }
        }
    }

    count
}

pub fn main() {
    println!("Guessing count: {}", guess_number(50, 0, 100));
}