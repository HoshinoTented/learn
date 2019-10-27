pub fn main() {
    let mut queue = vec![];

    for i in 0..10 {
        queue.push(i);
    }

    for i in 0..10 {
        if let Some(v) = queue.first() {
            println!("{}", v);
            queue.remove(0);
        }
    }
}