pub fn main() {
    // let v: Vec<i32> = vec![1, 2, 3];

    // let value: &i32 = match v.get(1) {
    //     Some(i) => i,
    //     None => &(-1),
    // };

    // println!("{}", value);

    let mut vec: Vec<i32> = Vec::new();

    vec.push(1);
    vec.push(2);
    vec.push(3);
    vec.push(4);

    let v: &i32 = &vec[0];

    println!("{}", v);
}