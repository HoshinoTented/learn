mod sum;
mod enums;

// struct Rectangle {
//     width: u32,
//     height: u32
// }

// impl Rectangle {
//     fn square(size: u32) -> Rectangle {
//         Rectangle {
//             width: size,
//             height: size
//         }
//     }

//     fn area(&self) -> u32 {
//         self.width * self.height
//     }

//     fn can_hold(&self, other: &Rectangle) -> bool {
//         self.width >= other.width && self.height >= other.height
//     }
// }

fn main() {
    enums::main();
}