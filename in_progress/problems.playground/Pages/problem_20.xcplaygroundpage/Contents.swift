//n! means n × (n − 1) × ... × 3 × 2 × 1
//
//For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
//and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
//Find the sum of the digits in the number 100!

func sumDigits(number: BigInt) -> BigInt {
    
    return number.digits.reduce(BigInt(integer: 0)) { (previousSum, nextValue) -> BigInt in
        previousSum.digits.last
        return previousSum.add(BigInt(integer: nextValue))
    }
    
}

print(sumDigits(BigInt(integer: 123)) == BigInt(integer: 6))
print(sumDigits(BigInt(integer: 0)) == BigInt(integer: 0))
print(sumDigits(BigInt(integer: 10)) == BigInt(integer: 1))
print(sumDigits(BigInt(integer: 3403)) == BigInt(integer: 10))

func factorial(number: Int) -> BigInt {

    switch number {
    case 1:
        return BigInt(integer: 1)
    default:
        return factorial(number - 1).multiply(BigInt(integer: number))
    }
    
}

print(factorial(3) == BigInt(integer: 6))
print(factorial(4) == BigInt(integer: 24))

let factorialValue = factorial(100)
let sum = sumDigits(factorialValue)
