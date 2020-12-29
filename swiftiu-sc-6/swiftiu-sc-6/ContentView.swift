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
    @Binding var BMI_val : String
    @Binding var BMI_status : String
    @State private var showsAlert = false
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
              //  let hd = Double(h)!
             //   let wd = Double(w)!
                if  Double(h)! < 0.5 || Double(h)! > 2.5 || Double(w)! < 30 || Double(w)! > 350 {
                    showsAlert = true}
                else{
                showsAlert = false
                let B = Double(w)! / ( Double(h)! * Double(h)! )

                if B > 25 {
                    BMI_status = "سمين"
                } else if B > 20 {
                    BMI_status = "جيد"
                } else {
                    BMI_status = "ضعيف"
                }
                BMI_val = String(format: "%.1f", B)
                    }
                }
                ,label: {
                Text("احسب")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
            Text("BMI")
                .font(.title)
                .bold()
                .padding()
                .alert(isPresented: $showsAlert) {
                                Alert(
                                    title: Text("Freez in ur place 🔫"),
                                    message: Text("make sure you entered the right values :("),
                                    dismissButton: .default(Text("OK , I got it"))
                                )
                            }
            Text("\(BMI_val)")
                .font(.title)
                .bold()
                .padding()
            Text("Status")
                .font(.title)
                .bold()
                .padding()
            Text("\(BMI_status)")
                .font(.title)
                .bold()
                .padding()
            }

}
    
}

    struct ContentView: View {
        @State var BMI_val = ""
        @State var BMI_status = ""
        var body: some View {
            NavigationView{
            VStack(){
            Text("BMI : \(BMI_val) ")
                .font(.title)
                .bold()
                .padding()
            Text("Status : \(BMI_status) ")
                .font(.title)
                .bold()
                .padding()
                NavigationLink(
                    destination: BMI(BMI_val: $BMI_val, BMI_status: $BMI_status),
                    label: {
                        Text("Go to calculator")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    })
                
                
    }
    }
    }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
