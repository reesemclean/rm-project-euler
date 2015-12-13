public struct BigInt {
    
    public let base: Int
    public let digits: [Int]
    
    public init(digits: [Int], base: Int = 10) {
        self.digits = digits
        self.base = base
    }
    
    public init(integer: Int) {
        self.digits = integer.digitsUsingBase(10)
        self.base = 10
    }
    
}

//Printable
extension BigInt: CustomStringConvertible {
    
    public var description: String {
        return self.digits.map { String($0) }.joinWithSeparator("")
    }
    
}

//Equality
extension BigInt: Equatable {}

public func ==(lhs: BigInt, rhs: BigInt) -> Bool {
    
    guard lhs.digits.isEmpty == false || rhs.digits.isEmpty == false else { return true }
    
    if lhs.base == rhs.base {
        
        guard lhs.digits == rhs.digits else { return false }
        
        return true
    } else {
        
        //TODO: convert to same base and compare
        return false
    }
}

//MARK: - Addition
extension BigInt {
    
    public func add(other: BigInt) -> BigInt {
        
        guard self.base == other.base else { fatalError("Only adding BigInts with equal bases is implemented") }
        
        let leftMagnitude = self.digits.count
        let rightMagnitude = other.digits.count
        
        let biggestMagnitude = max(self.digits.count, other.digits.count)
        
        let numberOfZerosToPadToLeftValue = biggestMagnitude - leftMagnitude
        let numberOfZerosToPadToRightValue = biggestMagnitude - rightMagnitude
        
        let leftZeroArray = [Int](count: numberOfZerosToPadToLeftValue, repeatedValue: 0)
        let rightZeroArray = [Int](count: numberOfZerosToPadToRightValue, repeatedValue: 0)
        
        let leftDigits = leftZeroArray + self.digits
        let rightDigits = rightZeroArray + other.digits
        
        var digits: [Int] = []
        var carryValue = 0
        for index in (biggestMagnitude - 1).stride(through: 0, by: -1) {
            
            let leftDigit = leftDigits[index]
            let rightDigit = rightDigits[index]
            let value = leftDigit + rightDigit + carryValue
            let digit = value % base //18 % 10, digit = 8, carry
            
            if value >= base {
                carryValue = 1
            } else {
                carryValue = 0
            }
            
            digits.insert(digit, atIndex: 0)
            
        }
        
        digits.insert(carryValue, atIndex: 0)
        
        return BigInt(digits: trimExcessZeros(digits), base: self.base)
        
    }
    
}

//MARK: - Multiply
public extension BigInt {
    
    public func multiply(other: BigInt) -> BigInt {
        
        guard self.base == other.base else { fatalError("Only multipling BigInts with equal bases is implemented") }
        
        var valuesToAdd = [BigInt]()
        
        for (index, leftDigit) in other.digits.reverse().enumerate() {
            
            var digits = [Int](count: index, repeatedValue: 0)
            var carryValue = 0
            for rightDigit in self.digits.reverse() {
                
                let value = rightDigit * leftDigit + carryValue
                let digit = value % base
                carryValue = value / base
                digits.insert(digit, atIndex: 0)
                
            }
            digits.insert(carryValue, atIndex: 0)
            let trimmedDigits = trimExcessZeros(digits)
            valuesToAdd.append(BigInt(digits: trimmedDigits, base: self.base))
        }
        
        var sum = BigInt(integer: 0)
        for value in valuesToAdd {
            sum = sum.add(value)
        }
        
        return sum
        
    }
    
}

//MARK: Integer Extensions

public extension Int {
    
    public func digitsUsingBase(base: Int) -> [Int] {
        
        var digits: [Int] = []
        var value = self
        repeat {
        
            digits.append(value % base)
            value = value / 10
            
        } while value > 0
        
        return digits.reverse()
        
    }
    
}

//MARK: Helper Functions

public func trimExcessZeros(digits: [Int]) -> [Int] {
    
    if digits.first == 0 {
        
        var copy = digits
        copy.removeFirst()
        return trimExcessZeros(copy)
        
    }
    
    return digits.count > 0 ? digits : [0]
}