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