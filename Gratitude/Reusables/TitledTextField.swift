//
//  TitledTextField.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct TitledTextField: View {
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizableStrings.Titles.title)
                .font(.headline)
                .fontWeight(.bold)
            TextField(LocalizableStrings.Empty.enterPostTitle, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .fill(Color.black)
                )
        }
    }
}

#if DEBUG
struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            TitledTextField(text: .constant(""))
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
