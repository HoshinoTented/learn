use std::io;

pub fn main() {
    let mut line = String::new();

    io::stdin().read_line(&mut line);

    let v: Vec<&str> = line.trim().split(' ').collect();
    
    let a: &i32 = &v[0].parse().expect("qaq");
    let b: &i32 = &v[1].parse().expect("qaq");

    println!("{}", a + b);
}