struct Pos<A, B> {
    x: A,
    y: B,
}

pub fn main() {
    let p0 = Pos { x: 1, y: "2" };
    // let p0 = Pos { x: 1, y: 2.0 };
    println!("({}, {})", p0.x, p0.y);
}