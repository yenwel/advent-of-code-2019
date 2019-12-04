use std::iter::FromIterator;

const DOUBLES : [&'static str; 9] = ["11", "22", "33", "44", "55", "66", "77", "88", "99"];

fn fitcriteria(password : i64) -> bool {
    let password_string = password.to_string();
    let mut password_string_vector = Vec::from_iter(password_string.chars());
    password_string_vector.sort();
    let password_string_sorted = password_string_vector.into_iter().collect::<String>();
    //println!("{} {}", &password_string, &password_string_sorted);
    (
        &password_string == &(password_string_sorted) && 
        password_string.len() == 6 && 
        DOUBLES.iter().any(|&double| (password_string.contains(&double)))
    )
}

fn main() {
    println!("{}", fitcriteria(111111));    
    println!("{}", fitcriteria(122345));         
    println!("{}", fitcriteria(111123));     
    println!("{}", fitcriteria(135679));   
    println!("{}", fitcriteria(223450));    
    println!("{}", fitcriteria(123789));
    println!("{}", (235741..706948).into_iter().filter(|x| fitcriteria(*x)).count());
}
