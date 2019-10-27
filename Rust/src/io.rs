use std::io;
use std::io::Read;

pub fn main() {
    let mut string = String::new();

    std::io::stdin().read_line(&mut string).expect("qaq");

    let args: Vec<&str> = string.trim().split(' ').collect();
    let first = args[0].parse::<i32>().expect("qaq");

    println!("{}", first);
}