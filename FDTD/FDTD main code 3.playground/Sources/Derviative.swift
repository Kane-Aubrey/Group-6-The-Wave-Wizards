import Foundation

public func dydtForParticle(dydt: DoubleVector, t: Double) -> DoubleVector {
    let E = DoubleVector(element: [1.0, 1.0, 1.0])
    let B = DoubleVector(element: [1.0, 1.0, 1.0])
    let m = 1e-10
    
    let X = 0
    let X_t = 1
    let V = 2
    let V_t = 3
    let A = 4
    let A_t = 5
    
    
    var dydt_out = [ 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    dydt_out[X] = dydt.element[X_t]
    
    dydt_out[X_t] = (E.element[X] + ( dydt.element[V_t] * B.element[V] ) - ( dydt.element[A_t] * B.element[X_t])) / m
    
    dydt_out[V] = dydt.element[V_t]
    
    dydt_out[V_t] = (E.element[X_t] - ( dydt.element[X_t] * B.element[V] ) + ( dydt.element[A_t] * B.element[X])) / m
    
    dydt_out[A] = dydt.element[A_t]
    
    dydt_out[A_t] = (E.element[V] + ( dydt.element[X_t] * B.element[X_t] ) - ( dydt.element[V_t] * B.element[X])) / m
    
    
    return DoubleVector(element: [dydt_out[X],
                                  dydt_out[X_t],
                                  dydt_out[V],
                                  dydt_out[V_t],
                                  dydt_out[A],
                                  dydt_out[A_t]])
}
