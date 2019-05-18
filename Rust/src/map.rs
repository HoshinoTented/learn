use std::collections::HashMap;

pub fn main() {
    let mut map: HashMap<&str, &str> = HashMap::new();

    map.insert("qwq", "qaq");
    
    // let qwq = &map["qwq"];
    let qwq0 = map.entry("qwq").or_insert("qnq");

    println!("{}", qwq0);
}