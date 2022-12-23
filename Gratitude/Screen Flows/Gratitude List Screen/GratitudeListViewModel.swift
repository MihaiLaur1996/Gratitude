//
//  GratitudeListViewModel.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import Foundation
import Combine

class GratitudeListViewModel: ObservableObject {
    var onNext = PassthroughSubject<Post, Never>()
    
    @Published var posts = [Post]()
    @Published var isLoading = false
    @Published var isSheetPresented = false
    
    func fetchPosts() {
        isLoading = true
        
        Task {
            try await Task.sleep(seconds: 1)
            await MainActor.run {
                posts.append(contentsOf: Post.allPosts)
                posts.sort { $0.date.compare($1.date) == .orderedDescending }
                isLoading = false
            }
        }
    }
    
    func update(post: Post) {
        if let postToChange = posts.firstIndex(where: { $0.id == post.id }) {
            posts[postToChange] = post
        }
    }
    
    func remove(post: Post) {
        posts.removeAll { $0.id == post.id }
    }
    
    func setNewPost(post: inout Post, tags: String) {
        if post.title.isEmpty {
            return
        } else {
            post.tags = tags.components(separatedBy: ", ")
            posts.append(post)
            posts.sort { $0.date.compare($1.date) == .orderedDescending }
        }
        isSheetPresented = false
    }
}
