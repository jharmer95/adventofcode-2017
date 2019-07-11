use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("Error, must provide a file to read from!");
        return;
    }
    let mut vec = load_from_file(&args[1]);

    let mut num_steps = 0;
    let mut cur_pos = 0;

    loop {
        if cur_pos >= vec.len() || (cur_pos as i32) < 0 {
            break;
        }

        let jump_num = vec[cur_pos];
        
        if jump_num >= 3 {
            vec[cur_pos] = jump_num - 1;
        }
        else {
            vec[cur_pos] = jump_num + 1;
        }
        
        cur_pos = (cur_pos as i32 + jump_num) as usize;
        num_steps += 1;
    }

    println!("Finished in {} steps!", num_steps);
}

fn load_from_file<P>(filename: P) -> Vec<i32> where P: AsRef<Path>, {
    let mut vec: Vec<i32> = Vec::new();
    let file = File::open(filename).unwrap();

    for line in BufReader::new(file).lines() {
        vec.push(line.unwrap().parse::<i32>().unwrap());
    }

    return vec;
}
