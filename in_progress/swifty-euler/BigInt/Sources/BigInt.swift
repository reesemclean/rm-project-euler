public struct BigInt {
    
    public let base: Int
    public let digits: [Int]
    
    public init(digits: [Int], base: Int = 10) {
        self.digits = digits
        self.base = base
    }
    
}

//MARK: - Convience Initializers
public extension BigInt {
	
    public init(integer: Int) {
        self.digits = integer.digitsUsingBase(10)
        self.base = 10
    }
	
}

//MARK: - CustomStringConvertible
extension BigInt: CustomStringConvertible {
    
    public var description: String {
        return self.digits.map { String($0) }.joinWithSeparator("")
    }
    
}

//MARK: - Equality
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

//MARK: Helper Functions

public func trimExcessZeros(digits: [Int]) -> [Int] {
    
    if digits.first == 0 {
        
        var copy = digits
        copy.removeFirst()
        return trimExcessZeros(copy)
        
    }
    
    return digits.count > 0 ? digits : [0]
}