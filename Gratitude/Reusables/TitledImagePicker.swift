//
//  TitledImagePicker.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI
import PhotosUI

struct TitledImagePicker: View {
    @Binding var image: Image?
    @Binding var isPictureSelectionPresented: Bool
    
    @State var isErrorShowing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizableStrings.Titles.image)
                .font(.headline)
                .fontWeight(.bold)
            Button {
                checkAuthorizationStatus()
            } label: {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .clipped()
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .buttonStyle(.plain)
        }
        .alert(isPresented: $isErrorShowing) {
            Alert(title: Text(LocalizableStrings.Titles.accessDenied), message: Text(LocalizableStrings.Titles.accessDeniedMessage), dismissButton: .cancel(requestPhotosPermission))
        }
    }
    
    private func checkAuthorizationStatus() {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .notDetermined: requestPhotosPermission()
        case .restricted: print("Restricted")
        case .denied: isErrorShowing = true
        case .authorized: isPictureSelectionPresented = true
        case .limited: print("Limited")
        @unknown default: fatalError("Error")
        }
    }
    
    private func requestPhotosPermission() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .notDetermined: print("Not Determined")
            case .restricted: print("Restricted")
            case .denied: isErrorShowing = true
            case .authorized: isPictureSelectionPresented = true
            case .limited: print("Limited")
            @unknown default: fatalError("Error")
            }
        }
    }
}

#if DEBUG
struct TitledImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            TitledImagePicker(
                image: .constant(Image("city_break")),
                isPictureSelectionPresented: .constant(true)
            )
            .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
