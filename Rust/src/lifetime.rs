fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() > b.len() {
        a
    } else {
        b
    }
}

pub fn main() {
//    let r;
//
//    {
//        let x = 5;
//        r = &x;
//
//        println!("{}", r);
//    }

//      println!("{}", r);

    let str0 = "qaq";

    {
        let str1 = String::from("hello");

        println!("{}", longest(str0, str1.as_str()));
    }
}