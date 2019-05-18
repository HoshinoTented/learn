#[derive(Debug)]
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(u32, u32, u32)
}

impl Message {
    fn call(&self) {
        println!("{:?}", self);
    }
}

pub fn main() {
    let m = Message::Write(String::from("qwq"));
    m.call();

    let just: Option<String> = Option::Some(String::from("qwq"));
    let none: Option<i32> = None;

    let result = match just {
        Some(s) => s,
        None => String::from("None")
    };

    println!("{}", result);
}