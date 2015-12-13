//n! means n × (n − 1) × ... × 3 × 2 × 1
//
//For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
//and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
//Find the sum of the digits in the number 100!

func sumDigits(number: Int) -> Int {
    
    var value = number
    var sum = 0
    while value > 0 {
        let rightMostDigit = value % 10
        sum = sum + rightMostDigit
        value = value / 10
    }
    
    return sum
}

print(sumDigits(123) == 6)
print(sumDigits(0) == 0)
print(sumDigits(10) == 1)
print(sumDigits(3403) == 10)

func factorial(number: Int) -> Int {
    
    switch number {
    case 1:
        return 1
    default:
        return factorial(number - 1) * number
    }
    
}

print(factorial(3) == 6)
print(factorial(4) == 24)

let factorialValue = factorial(20)
