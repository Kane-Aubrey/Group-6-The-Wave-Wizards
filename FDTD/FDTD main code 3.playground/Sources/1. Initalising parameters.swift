import Foundation
import Cocoa

// Grid size parameters
let gridSizeX: Int = 100 // Number of grid points in the x-direction
let gridSizeY: Int = 100 // Number of grid points in the y-direction

// Time parameters
let dt: Double = 0.01 // Time step size
let simulationDuration: Double = 10.0 // Total simulation duration

// Material properties
let epsilon0: Double = 8.854e-12 // Vacuum permittivity of free space
let mu0: Double = 4 * 3.14 * 1e-7 // Vacuum permeability
let c0: Double = 1 / sqrt(epsilon0 * mu0) // Speed of light in vacuum
let propconst: Double = 1 / 4 * 3.14 * epsilon0 // Proportionality constant

// Array to store electric field values
var electricField: [[Double]] = Array(repeating: Array(repeating: 0.0, count: gridSizeY), count: gridSizeX)

// Array to store magnetic field values
var magneticField: [[Double]] = Array(repeating: Array(repeating: 0.0, count: gridSizeY), count: gridSizeX)

// Function to apply sources of the waves
func applySources(atTime t: Double) {
    let sourceAmplitude: Double = 1.0
    let sourceWidth: Double = 10.0
    let sourceFrequency: Double = 1.0
    let sourceFunction: Double = sourceAmplitude * exp(-pow((t - sourceWidth/2) / (sourceWidth / (2 * sqrt(2 * .pi))), 2)) * sin(2 * .pi * sourceFrequency * t)
    electricField[gridSizeX / 2][gridSizeY / 2] += sourceFunction
}
