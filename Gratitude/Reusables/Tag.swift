//
//  Tag.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

struct Tag: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
}

#if DEBUG
struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            Tag(text: LocalizableStrings.Others.nature)
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
