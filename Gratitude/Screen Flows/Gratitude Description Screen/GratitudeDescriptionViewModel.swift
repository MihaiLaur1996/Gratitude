//
//  GratitudeDescriptionViewModel.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import Foundation
import Combine

class GratitudeDescriptionViewModel: ObservableObject {
    @Published var post: Post
    @Published var isEditing = false
    
    let onBack = PassthroughSubject<Post, Never>()
    let onDelete = PassthroughSubject<Post, Never>()
    
    init(post: Post) {
        self.post = post
    }
}
