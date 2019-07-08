use std::fs::File;
use std::io::Error;
use std::io::Read;

pub fn read_file(path: &String) -> Result<String, Error> {
    let mut f = File::open(path)?;
    let mut s = String::new();

    f.read_to_string(&mut s)?;
    Ok(s)
}

pub fn main() {
//    let f = File::open("qwq.txt").expect("Failed to open  qwq.txt");

//    let f = match f {
//        Ok(file) => file,
//        Err(e) => panic!("{}", e)
//    };

    read_file(&String::from("qwq.txt")).expect("qaq");
}