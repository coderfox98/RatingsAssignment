//
//  ContentView.swift
//  RatingsAssignment
//
//  Created by Rishabh Raj on 20/05/20.
//  Copyright © 2020 Rishabh Raj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var minimumRating = ""
    @State private var maximumRating = ""
    @State private var showAlert = false
    @State private var shouldShowRatingView = false
    
    var checkMinMaxRating : Binding<Bool> {
        guard let intMinRating = Int(minimumRating) else { return .constant(false) }
        guard let intMaxRating = Int(maximumRating)  else { return .constant(false) }
        guard intMinRating < 10 else {
            return .constant(true)
        }
        guard intMaxRating < 10 else {
            return .constant(true)
        }
        if intMaxRating < intMinRating {
            return .constant(true)
        }
        return .constant(false)
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            HStack {
                TextField("Minimum Rating", text: $minimumRating)
                    .keyboardType(.numberPad)
                TextField("Maximum Rating", text: $maximumRating)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: checkMinMaxRating) {
                Alert(title: Text("Error"), message: Text("Please enter a rating between 0 - 9"), dismissButton: .default(Text("Ok"), action: {
                    self.resetViews()
                }))
                
            }
            Text("Rating: \(minimumRating) - \(maximumRating)")
           
            Button(action: { self.shouldShowRatingView.toggle() }) {
                Text("Show Rating Slider")
            }
            
        }.padding()
            .sheet(isPresented: $shouldShowRatingView) {
                SliderView().environment(\.managedObjectContext, self.managedObjectContext)
        }
        
    }
    
    func resetViews() {
        self.minimumRating = ""
        self.maximumRating = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

