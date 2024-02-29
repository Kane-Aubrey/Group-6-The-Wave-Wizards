import Foundation
import XCTest

class FDTDTests: XCTestCase {
    // Test case to validate updateElectricField() function
    func testUpdateElectricField() {
        // Set up initial electric field state
        var electricField: [[Double]] = [[0.0, 0.0, 0.0],
                                         [0.0, 0.0, 0.0],
                                         [0.0, 0.0, 0.0]]
        
        // Call updateElectricField() function
        updateElectricField(&electricField)
        
        // Assert expected electric field values after update
        XCTAssertEqual(electricField, [[1.0, 1.0, 1.0],
                                        [1.0, 1.0, 1.0],
                                        [1.0, 1.0, 1.0]], "Electric field update failed")
    }
    
    // Test case to validate calculateTotalEnergy() function
    func testCalculateTotalEnergy() {
        // Set up electric field with known values
        let electricField: [[Double]] = [[1.0, 2.0, 3.0],
                                         [4.0, 5.0, 6.0],
                                         [7.0, 8.0, 9.0]]
        
        // Calculate total energy
        let totalEnergy = calculateTotalEnergy(electricField)
        
        // Assert expected total energy value
        XCTAssertEqual(totalEnergy, 285.0, accuracy: 0.0001, "Total energy calculation failed")
    }
}

// Example functions to be tested
func updateElectricField(_ electricField: inout [[Double]]) {
     Update electric field values (example implementation)
    for i in 0..<electricField.count {
        for j in 0..<electricField[i].count {
            electricField[i][j] = 1.0 // Set electric field value to 1.0 (example)
        }
    }
}
 
func calculateTotalEnergy(_ electricField: [[Double]]) -> Double {
    // Calculate total energy from electric field values (example implementation)
    var totalEnergy: Double = 0.0
    for i in 0..<electricField.count {
        for j in 0..<electricField[i].count {
            totalEnergy += electricField[i][j]
        }
    }
    return totalEnergy
}
