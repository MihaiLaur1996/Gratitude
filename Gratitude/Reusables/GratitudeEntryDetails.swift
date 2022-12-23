//
//  GratitudeEntryDetails.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

struct GratitudeEntryDetails: View {
    let date: Date
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(date.toString())
                .font(.headline)
                .foregroundColor(.gray)
            Text(title)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.black)
        }
    }
}

#if DEBUG
struct GratitudeEntryDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            GratitudeEntryDetails(
                date: Date(),
                title: LocalizableStrings.Titles.postTitle
            )
            .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
