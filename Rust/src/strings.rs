pub fn main() {
    let mut s = String::new();

    s.push_str("qaq");

    println!("{}", s);

    let s0 = "!";
    let s1 = s + &s0;
    
    println!("{}", s1);

    let cs = s1.chars();

    for c in cs {
        println!("{}", c);
    }
}