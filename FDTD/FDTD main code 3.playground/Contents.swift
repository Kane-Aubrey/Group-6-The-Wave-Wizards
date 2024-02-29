import Foundation
import Cocoa

// Let us consider a simulation of a wave propagating in free space

let nodeNum = 200 // Number of electric and magnetic field nodes total
let maxTime = 250 // How many time steps to run the simulation for
let imp0 = 377.0 // Characteristic impedence of free space

let t: Int = 1 // Time counter

var ez = [Double](repeating: 0.0, count: nodeNum) // Electric field ez (only has z component) (nodes?)
var hy = [Double](repeating: 0.0, count: nodeNum) // Magnetic field hy (only has y component) (nodes?)

// For the snapshotting
var basename = "simulation"
var filename = [Character](repeating: " ", count: 100)
var frame = 0
var snapshot: UnsafeMutablePointer<FILE>?

//Timestepping loop with 2 embedded loops to update the electric and magnetic fields.
for t in 0..<maxTime {
    
    hy[nodeNum-1] = hy[nodeNum-2] // Simple ABC
    
    // Update magnetic field
    for mm in 0..<(nodeNum - 1) {
        hy[mm] += (ez[mm + 1] - ez[mm]) / imp0
    }
    
    // Correction for Hy adjacent to TFSF boundary
        hy[49] -= exp(-(Double(t) - 30.0) * (Double(t) - 30.0) / 100.0) / imp0 //TFSF boundary between nodes hy[49] and ez[50].

    ez[0] = ez[1] // Simple ABC

    // Update electric field
    for mm in 1..<nodeNum {
        ez[mm] += (hy[mm] - hy[mm - 1]) * imp0
    }
    
    // Correction for Ez adjacent to TFSF boundary
        ez[50] += exp(-(Double(t) + 0.5 - (-0.5) - 30.0) * (Double(t) + 0.5 - (-0.5) - 30.0) / 100.0) //TFSF boundary between nodes hy[49] and ez[50].
    
    // Taking snapshots of the simulation
    if t % 10 == 0 {
        let fileName = "\(basename).\(frame)"
        frame += 1
        
        if let filePointer = fopen(fileName, "w") {
            snapshot = filePointer
            
            for mm in 0..<SIZE {
                fprintf(snapshot, "%g\n", ez[mm])
            }
            
            fclose(snapshot)
        }
    }
}

// Hardwire a source node. Note - output is a Gaussian

    ez[50] += exp(-pow((Double(qTime) - 30.0), 2.0) / 100.0)

    print(ez[50]) // Prints the value of ez[50] to the screen per time step

