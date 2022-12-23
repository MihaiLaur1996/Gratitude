//
//  TitledCarouselImages.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct TitledCarouselImages: View {
    @Binding var carouselImages: [Image]?
    
    @State var isPhotoPickerPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizableStrings.Titles.carouselImages)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        isPhotoPickerPresented = true
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .frame(width: 100, height: 50)
                            .overlay {
                                Image(systemName: "plus")
                            }
                    }
                    .buttonStyle(.plain)
                    ForEach(0..<(carouselImages ?? []).count, id: \.self) { index in
                        if let carouselImages = carouselImages {
                            carouselImages[index]
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 50)
                                .cornerRadius(10)
                                .clipped()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isPhotoPickerPresented) {
            PhotosPicker(image: .constant(nil), carouselImages: $carouselImages)
        }
    }
}

#if DEBUG
struct TitledCarouselImages_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            TitledCarouselImages(carouselImages: .constant(nil))
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
