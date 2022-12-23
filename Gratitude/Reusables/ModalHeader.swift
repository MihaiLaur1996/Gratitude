//
//  ModalHeader.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct ModalHeader: View {
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                Text(LocalizableStrings.Titles.editPost)
                    .font(.headline)
                    .fontWeight(.heavy)
                Button {
                    action()
                } label: {
                    Text(LocalizableStrings.Buttons.done.uppercased())
                        .font(.headline)
                        .fontWeight(.heavy)
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            Rectangle()
                .frame(height: 1)
        }
        .foregroundColor(.black)
    }
}

#if DEBUG
struct ModalHeader_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            ModalHeader(action: {})
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
