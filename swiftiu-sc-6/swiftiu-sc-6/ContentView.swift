//
//  ContentView.swift
//  swiftiu-sc-6
//
//  Created by mohamad on 12/28/20.
//

import SwiftUI

struct BMI: View {
    @State var h : String = ""
    @State var w : String = ""
    var body: some View {
        VStack(){
        Text("مرحبا بك بحاسبة BMI")
            .font(.largeTitle)
            .bold()
            .padding()
        
        TextField("الطول بالمتر", text: $h)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("الوزن بالكيلوجرام", text: $w)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            Button(action: {
                var BMI_val = Int(w)! / ( Int(h)! * Int(h)! )
            }, label: {
                Text("احسب")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                
                    
                    
            })
        
        }
        
}
}
    struct ContentView: View {
        var body: some View {
            Text("HI")
        
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BMI()
            .previewDevice("iPhone 11")
    }
}
