//
//  PostManipulationContent.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct PostManipulationContent: View {
    @Binding var post: Post
    @Binding var tags: String
    @Binding var isPictureSelectionPresented: Bool
    
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ModalHeader(action: action)
                .foregroundColor(.black)
            ScrollView {
                VStack(spacing: 40) {
                    TitledTextField(text: $post.title)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    TitledImagePicker(
                        image: $post.image,
                        isPictureSelectionPresented: $isPictureSelectionPresented
                    )
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    TitledCarouselImages(carouselImages: $post.carouselImages)
                    TitledTextEditor(tags: $tags)
                        .padding(.horizontal)
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 16, trailing: 0))
            }
        }
        .background(Color.lightGray)
        .sheet(isPresented: $isPictureSelectionPresented) {
            PhotosPicker(image: $post.image, carouselImages: .constant(nil))
        }
        .onAppear {
            tags = post.tags?.joined(separator: ", ") ?? ""
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

#if DEBUG
struct PostManipulationContent_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            PostManipulationContent(
                post: .constant(Post.allPosts[0]),
                tags: .constant(""),
                isPictureSelectionPresented: .constant(false),
                action: {}
            )
            .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
