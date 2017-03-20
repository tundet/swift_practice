func fibonacci(_ number: Int) -> Int {

    assert(number > 0 && number < 1000, "Must choose a number between 0 and 1000.")

    if number <= 2 {
        return 1
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}

print(fibonacci(25))
