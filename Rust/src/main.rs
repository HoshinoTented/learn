mod sum;
mod enums;

//#[derive(Debug)]
//struct User {
//    name: String,
//    password: String
//}
//
//struct Point(i32, i32);
//
//fn build_user(name: &String, password: &String) -> User {
//    User {
//        name: name.clone(),
//        password: password.clone(),
//    }
//}
//
//fn foo(str: String) {
//    //NoP
//}

struct Rectangle {
    width: u32,
    height: u32
}

impl Rectangle {
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size
        }
    }

    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width >= other.width && self.height >= other.height
    }
}

fn main() {
    enums::main();
}