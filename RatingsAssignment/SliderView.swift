//
//  SliderView.swift
//  RatingsAssignment
//
//  Created by Rishabh Raj on 20/05/20.
//  Copyright © 2020 Rishabh Raj. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showSuccessAlert = false

    @State private var rating : Double = 0
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Slider(value: $rating, in: 0...9, step: 1)
                Text("Rating \(Int(rating)) ")
                
                Button(action: saveRatings) {
                    Text("Submit")
                }
                NavigationLink(destination: SavedRatingView().environment(\.managedObjectContext, self.managedObjectContext)) {
                    Text("ShowSavedRatings")
                }
            }.alert(isPresented: $showSuccessAlert) { () -> Alert in
                Alert(title: Text("Saved"), message:Text("Rating Saved Successfully"), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func saveRatings() {
        
        let newRating = Rating(context: self.managedObjectContext)
        newRating.id = UUID()
        newRating.date = Date()
        newRating.rating = "\(self.rating)"
        
        do {
            try self.managedObjectContext.save()
            self.showSuccessAlert = true
            rating = 0
        }catch {
            print(error.localizedDescription)
        }
   
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
