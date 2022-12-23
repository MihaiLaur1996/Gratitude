//
//  PostAdditionView.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import SwiftUI

struct PostAdditionView: View {
    let viewModel: GratitudeListViewModel
    
    @State var post = Post(date: Date(), title: "", carouselImages: [])
    @State var tags: String = ""
    @State var isPictureSelectionPresented = false
    
    var body: some View {
        PostManipulationContent(
            post: $post,
            tags: $tags,
            isPictureSelectionPresented: $isPictureSelectionPresented
        ) {
            viewModel.setNewPost(post: &post, tags: tags)
        }
    }
}

#if DEBUG
struct PostAdditionView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            PostAdditionView(viewModel: GratitudeListViewModel())
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
