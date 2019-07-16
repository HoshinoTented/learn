pub fn main() {
    let mut s = [1, 2, 3];
    let mut i = &s[1];
    i = &3;

    println!("{}", i);
}