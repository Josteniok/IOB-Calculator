//
//  ContentView.swift
//  IOB Calculator
//
//  Created by Justin Ennis on 1/14/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var bg: String = ""
    @State var tdd: String = ""
    @State var iobn: String = "0"

    var body: some View {
        Form {
            HStack {
                Text("Blood Glucose")
                Spacer()
                TextField("Blood Glucose", text: $bg)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Total Daily Dose")
                Spacer()
                TextField("Total Daily Dose", text: $tdd)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            HStack {
                Spacer()
                Button(action: {
                    let bgfloat = Float(bg) ?? 0.0
                    let tddfloat = Float(tdd) ?? 0.0
                    let cf = 277700/(bgfloat * tddfloat)
                    let iobnnumerator = (bgfloat - 100) < 0 ? 0 : bgfloat - 100
                    iobn = String(format: "%.2f", iobnnumerator / cf)
                }) {
                    Text("Calculate IOB Needed")
                }
                .font(.footnote)
                .cornerRadius(40)
                .padding(10)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 1))
                Spacer()
            }
            HStack {
                Text("Insulin on Board Needed")
                Spacer()
                Text(iobn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
