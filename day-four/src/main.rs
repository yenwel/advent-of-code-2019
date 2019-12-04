use std::iter::FromIterator;

const DOUBLES : [&'static str; 9] = ["11", "22", "33", "44", "55", "66", "77", "88", "99"];

fn fit_criteria(password : i64) -> bool {
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
    println!("{}", fit_criteria(111111));    
    println!("{}", fit_criteria(122345));         
    println!("{}", fit_criteria(111123));     
    println!("{}", fit_criteria(135679));   
    println!("{}", fit_criteria(223450));    
    println!("{}", fit_criteria(123789));
    println!("{}", (235741..706948).into_iter().filter(|x| fit_criteria(*x)).count());
}
