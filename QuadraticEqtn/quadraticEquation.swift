//
//  quadraticEquation.swift
//  QuadraticEqtn
//
//  Created by IIT Phys 440 on 1/27/23.
//

import SwiftUI

class quadraticEquation: NSObject {
    ///This class is defined with three core variables, a, b and c to compute all four solutions of a quadratic equation
    var a: Double = 0.0
    var b: Double = 0.0
    var c: Double = 0.0
    
    var solOne: Double = 0.0
    var solOneR: Double = 0.0
    var solOneIm: Double = 0.0
    var solTwoR: Double = 0.0
    var solTwoIm: Double = 0.0
    
    func calculateDeterminant()->Double{
        ///This function takes in the values of a, b and c and returns the determinant with formula:
        ///b^2-4ac
        ///as a Double
        return Double(pow(b,2)) - 4.0*a*c
    }
    
    func calculateQuadraticSolutions(){
        
        var det = self.calculateDeterminant()
        switch det {
        case let x where x < 0:
            det = det*(-1.0)
            let sqrt = det.squareRoot()
            solOneR = (-1.0)*b/(2.0)*a
            solTwoR = solOneR
            solOneIm = (1.0/(2.0*a))*sqrt
            solTwoIm = (-1.0)*solOneIm
        case let x where x == 0:
            solOneR = (-1.0)*b/(2.0)*a
        case let x where x > 0:
            let sqrt = det.squareRoot()
            solOneR = ((-1.0)*b + sqrt)/(2*a)
            solTwoR = ((-1.0)*b - sqrt)/(2*a)
        default:
            print("this is impossible")
        }
    }
    
    
    

}
