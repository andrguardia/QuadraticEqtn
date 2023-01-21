//
//  ContentView.swift
//  QuadraticEqtn
//
//  Created by IIT Phys 440 on 1/20/23.
//

import SwiftUI

struct ContentView: View {
    @State  var a: String = ""
    @State  var b: String = ""
    @State  var c: String = ""
    @State var solutionOne: Double = 0.0
    @State var solutionOneR: Double = 0.0
    @State var solutionOneIm: Double = 0.0
    @State var solutionTwoR: Double = 0.0
    @State var solutionTwoIm: Double = 0.0

    
    var body: some View {
        VStack {
            Text("Quadratic Equation Calculator")
                .font(.largeTitle)
            HStack {
                Text("a:")
                TextField("Enter a value for a", text: $a)
            }
            
            HStack {
                Text("b:")
                TextField("Enter a value for b", text: $b)
            }
            HStack {
                Text("c:")
                TextField("Enter a value for c", text: $c)
            }
            
            Button("Compute!", action: {self.calculate()})
            
            HStack {Text("x_1:")
                Text("\(self.solutionOneR, specifier: "%.2f") + \(self.solutionOneIm, specifier: "%.2f")i")}
            
            HStack {Text("x_2:")
               Text("\(self.solutionTwoR, specifier: "%.2f") + \(self.solutionTwoIm, specifier: "%.2f")i")}
//            HStack {Text("x_3:")
//                Text("Third solution goes here")}
//            HStack {Text("x_4:")
//                Text("Fourth solution goes here")}
            
        }
        .padding()
    }
    
    func calculate(){
        let A = Double(a)!
        let B = Double(b)!
        let C = Double(c)!
        
        var det = Double(pow(B,2)) - 4.0*A*C
        
        switch det {
        case let x where x < 0:
            det = det*(-1.0)
            let sqrt = det.squareRoot()
            solutionOneR = (-1.0)*B/(2.0)*A
            solutionTwoR = solutionOneR
            solutionOneIm = (1.0/(2.0*A))*sqrt
            solutionTwoIm = (-1.0)*solutionOneIm
        case let x where x == 0:
            solutionOneR = (-1.0)*B/(2.0)*A
        case let x where x > 0:
            let sqrt = det.squareRoot()
            solutionOneR = ((-1.0)*B + sqrt)/(2*A)
            solutionTwoR = ((-1.0)*B - sqrt)/(2*A)
        default:
            print("this is impossible")
        }
        
        print(solutionOneR)
        print(solutionOneIm)
        print(solutionTwoR)
        print(solutionTwoIm)
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
