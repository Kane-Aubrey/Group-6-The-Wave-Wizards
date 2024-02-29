import Foundation

public struct DoubleVector {
    public var element: [Double]
    
    public init(element: [Double]) {
        self.element = element
    }

    func add(_ other: DoubleVector) -> DoubleVector {
        if checkEqualLength(other){
            var result = initialiseResult()
            for i in 0..<element.count {
                result.element[i] = element[i] + other.element[i]
            }
            return result
        }
        return DoubleVector(element: [Double]())
    }

    static func +(lhs: DoubleVector, rhs: DoubleVector) -> DoubleVector {
        return lhs.add(rhs)
    }

    func times(_ scalar: Double) -> DoubleVector {
        var result = initialiseResult ()
        for i in 0..<element.count {
            result.element[i] = element[i] * scalar
        }
        return result
    }
    
    static func *(lhs: Double, rhs: DoubleVector) -> DoubleVector {
        return rhs.times(lhs)
    }
    
    static func *(lhs: DoubleVector, rhs: Double) -> DoubleVector {
        return lhs.times(rhs)
    }

    func checkEqualLength(_ other: DoubleVector) -> Bool {
        return element.count == other.element.count
    }
    
    func initialiseResult() -> DoubleVector {
        return DoubleVector(element: [Double](repeating: 0.0,
                                                   count: element.count))
    }
    
    static func ==(lhs: DoubleVector, rhs: DoubleVector) -> Bool {
        if lhs.element.count == rhs.element.count {
            for i in 0..<lhs.element.count {
                if Int(lhs.element[i] * 10e10) != Int(rhs.element[i] * 10e10) {
                    return false
                }
            }
            return true
        } else {
            return true
        }
    }
}

public func crossProduct(_ a: DoubleVector, _ b: DoubleVector) -> DoubleVector? {
  
    let result = DoubleVector(element: [
        a.element[1] * b.element[2] - a.element[2] * b.element[1],
        a.element[2] * b.element[0] - a.element[0] * b.element[2],
        a.element[0] * b.element[1] - a.element[1] * b.element[0]
    ])
    
    return result
}



