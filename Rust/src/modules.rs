mod sound {
    pub mod instrument {
        pub fn clarinet() {
            super::qwq();
        }
    }

    pub fn qwq() {
        println!("hoshino is a very lovely girl!");
    }
}

mod plant {
    pub struct Vegetable {
        pub name: String,
        id: i32,
    }

    impl Vegetable {
        pub fn new(name: &str) -> Vegetable {
            Vegetable {
                name: String::from(name),
                id: 1
            }
        }
    }
}

use sound::{instrument};

pub fn main() {
    // crate::modules::sound::instrument::clarinet();

    instrument::clarinet();

    let v = plant::Vegetable::new("hoshino");

    println!("{}", v.name);
}