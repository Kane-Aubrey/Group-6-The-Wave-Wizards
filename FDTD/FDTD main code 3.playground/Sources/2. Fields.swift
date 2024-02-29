import Foundation

// Initialize electric field with initial values and boundary conditions
func initializeElectricField() {
    // Set initial values within the simulation domain
    for i in 0..<gridSizeX {
        for j in 0..<gridSizeY {
            // Example: Set initial electric field values to zero
            electricField[i][j] = 0.0
        }
    }
    
    //    // Apply boundary conditions
    //    // Example: Set boundary values to reflect incoming waves (PEC boundary)
    //    // Top and bottom boundaries
    //    for i in 0..<gridSizeX {
    //        electricField[i][0] = 0.0 // Reflective boundary
    //        electricField[i][gridSizeY - 1] = 0.0 // Reflective boundary
    //    }
    //
    //    // Left and right boundaries
    //    for j in 0..<gridSizeY {
    //        electricField[0][j] = 0.0 // Reflective boundary
    //        electricField[gridSizeX - 1][j] = 0.0 // Reflective boundary
    //    }
    //}
    
    // Initialize magnetic field with initial values and boundary conditions
    func initializeMagneticField() {
        // Set initial values within the simulation domain
        for i in 0..<gridSizeX {
            for j in 0..<gridSizeY {
                // Example: Set initial magnetic field values to zero
                magneticField[i][j] = 0.0
            }
        }
        
        //    // Apply boundary conditions
        //    // Example: Set boundary values to reflect incoming waves (PEC boundary)
        //    // Top and bottom boundaries
        //    for i in 0..<gridSizeX {
        //        magneticField[i][0] = 0.0 // Reflective boundary
        //        magneticField[i][gridSizeY - 1] = 0.0 // Reflective boundary
        //    }
        //
        //    // Left and right boundaries
        //    for j in 0..<gridSizeY {
        //        magneticField[0][j] = 0.0 // Reflective boundary
        //        magneticField[gridSizeX - 1][j] = 0.0 // Reflective boundary
        //    }
}
        
        
//        // Call the initialization functions - program doesn't like this part yet
//        initializeElectricField()
//        initializeMagneticField()
}

