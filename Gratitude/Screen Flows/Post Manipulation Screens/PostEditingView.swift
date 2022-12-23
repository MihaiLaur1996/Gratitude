//
//  PostEditingView.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

struct PostEditingView: View {
    @Binding var post: Post
    @Binding var isEditingScreenPresented: Bool
    
    @State var isPictureSelectionPresented = false
    @State var tags: String = ""
    
    var body: some View {
        PostManipulationContent(
            post: $post,
            tags: $tags,
            isPictureSelectionPresented: $isPictureSelectionPresented
        ) {
            post.tags = tags.components(separatedBy: ", ")
            isEditingScreenPresented = false
        }
    }
}

#if DEBUG
struct PostEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            PostEditingView(
                post: .constant(Post.allPosts[1]),
                isEditingScreenPresented: .constant(true)
            )
            .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
