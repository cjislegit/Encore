//
//  StarRatingView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/28/26.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    private let maxRating = 5
    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { star in
                Button {
                    withAnimation(.spring(response: 0.5)) {
                        rating = rating == star ? 0 : star
                    }
                }
                label : {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                }
            }
        }
    }
}

#Preview {
    StarRatingView(rating: .constant(3))
}
