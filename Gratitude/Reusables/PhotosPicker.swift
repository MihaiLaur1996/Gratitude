//
//  PhotosPicker.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct PhotosPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    @Binding var image: Image?
    @Binding var carouselImages: [Image]?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image, carouselImages: $carouselImages, photosPicker: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: Image?
        @Binding var carouselImages: [Image]?
        
        let photosPicker: PhotosPicker
        
        init(image: Binding<Image?>, carouselImages: Binding<[Image]?>, photosPicker: PhotosPicker) {
            self._image = image
            self._carouselImages = carouselImages
            self.photosPicker = photosPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.editedImage] as? UIImage {
                let castedImage = Image(uiImage: selectedImage)
                image = castedImage
                carouselImages?.append(castedImage)
            }
            
            picker.dismiss(animated: true)
        }
    }
}
