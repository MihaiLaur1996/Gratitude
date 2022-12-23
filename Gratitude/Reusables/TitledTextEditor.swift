//
//  TitledTextEditor.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct TitledTextEditor: View {
    @Binding var tags: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizableStrings.Titles.tags)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            TextEditor(text: $tags)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .fill(Color.black)
                )
                .frame(minHeight: 200, maxHeight: .infinity)
        }
    }
}

#if DEBUG
struct TitledTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            TitledTextEditor(tags: .constant(""))
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
