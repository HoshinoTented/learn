pub fn main() {
    let mut s0 = String::new();

    let s1 = &s0;
    let s3 = &s0;
    let s2 = &mut s0;

    s2.push_str("qwq");

    println!("{}, {}", s2, s2);
}