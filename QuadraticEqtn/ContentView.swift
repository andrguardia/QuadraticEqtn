//
//  ContentView.swift
//  QuadraticEqtn
//
//  Created by IIT Phys 440 on 1/20/23.
//

import SwiftUI
import Numerics
import ComplexModule

struct ContentView: View {
    @State  var aString: String = ""
    @State  var bString: String = ""
    @State  var cString: String = ""
    /// Solutions using first method provided
    @State var solutionOne: Double = 0.0
    @State var solutionOneR: Double = 0.0
    @State var solutionOneIm: Double = 0.0
    @State var solutionTwoR: Double = 0.0
    @State var solutionTwoIm: Double = 0.0
    /// Solutions using the second method provided, will be used to compute error
    @State var solOnePrime = Complex<Double>(0.0,0.0)
    @State var solTwoPrime = Complex<Double>(0.0,0.0)
    
    @State var solutionOneRPrime: Double = 0.0
    @State var solutionOneImPrime: Double = 0.0
    @State var solutionTwoRPrime: Double = 0.0
    @State var solutionTwoImPrime: Double = 0.0

    
    var body: some View {
        VStack {
            Text("Quadratic Equation Calculator")
                .font(.largeTitle)
            HStack {
                Text("a:")
                TextField("Enter a value for a", text: $aString)
            }
            
            HStack {
                Text("b:")
                TextField("Enter a value for b", text: $bString)
            }
            HStack {
                Text("c:")
                TextField("Enter a value for c", text: $cString)
            }
            
            Button("Compute!", action: {self.calculate()})
            
            HStack {Text("x_1:")
                Text("\(self.solutionOneR, specifier: "%.2f") + \(self.solutionOneIm, specifier: "%.2f")i")}
            
            HStack {Text("x_1':")
                Text("\(self.solutionOneRPrime, specifier: "%.2f") + \(self.solutionOneImPrime, specifier: "%.2f")i")}
            
            HStack {Text("x_2:")
               Text("\(self.solutionTwoR, specifier: "%.2f") + \(self.solutionTwoIm, specifier: "%.2f")i")}
            
            HStack {Text("x_2':")
                Text("\(self.solutionTwoRPrime, specifier: "%.2f") + \(self.solutionTwoImPrime, specifier: "%.2f")i")}
            
        }
        .padding()
    }
    
    func calculate(){
        ///This function defines an object of quadratic equaions, runs both methods to calculate all four solutions.
        ///Returns: void
        let quadraticeqtn = quadraticEquation()
        
        quadraticeqtn.a = Double(aString)!
        quadraticeqtn.b = Double(bString)!
        quadraticeqtn.c = Double(cString)!
        
        
        quadraticeqtn.calculateQuadraticSolutions()
        solutionOneR = quadraticeqtn.solOneR
        solutionOneIm = quadraticeqtn.solOneIm
        solutionTwoR = quadraticeqtn.solTwoR
        solutionTwoIm = quadraticeqtn.solTwoIm
        
        quadraticeqtn.calculateQuadraticSolutionsPrime()
        solutionOneRPrime = quadraticeqtn.solOnePrime.real
        solutionOneImPrime = quadraticeqtn.solOnePrime.imaginary
        solutionTwoRPrime = quadraticeqtn.solTwoPrime.real
        solutionTwoImPrime = quadraticeqtn.solTwoPrime.imaginary
        
        
//        var det = Double(pow(B,2)) - 4.0*A*C
//
//        switch det {
//        case let x where x < 0:
//            det = det*(-1.0)
//            let sqrt = det.squareRoot()
//            solutionOneR = (-1.0)*B/(2.0)*A
//            solutionTwoR = solutionOneR
//            solutionOneIm = (1.0/(2.0*A))*sqrt
//            solutionTwoIm = (-1.0)*solutionOneIm
//        case let x where x == 0:
//            solutionOneR = (-1.0)*B/(2.0)*A
//        case let x where x > 0:
//            let sqrt = det.squareRoot()
//            solutionOneR = ((-1.0)*B + sqrt)/(2*A)
//            solutionTwoR = ((-1.0)*B - sqrt)/(2*A)
//        default:
//            print("this is impossible")
//        }
//
//        print(solutionOneR)
//        print(solutionOneIm)
//        print(solutionTwoR)
//        print(solutionTwoIm)
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
