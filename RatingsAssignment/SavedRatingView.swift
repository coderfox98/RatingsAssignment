//
//  SavedRatingView.swift
//  RatingsAssignment
//
//  Created by Rishabh Raj on 20/05/20.
//  Copyright © 2020 Rishabh Raj. All rights reserved.
//

import SwiftUI

struct SavedRatingView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(entity: Rating.entity(), sortDescriptors: [], predicate: nil, animation: Animation.default) var ratings : FetchedResults<Rating>
    
    var body: some View {
        List(ratings) { rating in
            VStack(alignment: .leading) {
                Text("\(rating.rating ?? "")")
                Text("\(rating.date ?? Date())")
                    .navigationBarTitle(Text("Saved Ratings"))
            }

        }
    }
}

struct SavedRatingView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRatingView()
    }
}
