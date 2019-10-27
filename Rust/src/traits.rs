pub trait Trait {
    fn say_hello(&self);
    fn say_hi() {
        println!("Hi!");
    }
}

pub struct A {
    some: String
}

impl Trait for A {
    fn say_hello(&self) {
        println!("{}", self.some);
    }
}

fn foo(t: impl Trait) {
    t.say_hello();
}

fn foo0<T: Trait>(t: T) {
    t.say_hello();
}

fn foo1<T>(t: T)
    where T: Trait {
    t.say_hello();
}

pub fn main() {
    let a = A { some: String::from("qaq") };
    foo(a);
}