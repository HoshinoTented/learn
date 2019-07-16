fn saySome(some: Option<i32>) {
    if let Some(i) = some {
        println!("{}", i);
    };
}

pub fn main() {
    saySome(Some(3));
    saySome(None);
}