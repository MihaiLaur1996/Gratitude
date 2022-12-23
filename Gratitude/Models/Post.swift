//
//  Post.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let date: Date
    var title: String {
        didSet {
            if title.count > 40 && oldValue.count <= 40 {
                title = oldValue
            }
        }
    }
    var image: Image?
    var carouselImages: [Image]?
    var tags: [String]?
    
    static let allPosts = [
        Post(
            date: Date.fromString(dateAsString: "25/05/2021"),
            title: "Daily Gratitude",
            image: Image("sunset_couple_picture"),
            carouselImages: [
                Image("sunset_couple_picture"),
                Image("adventure_in_nature"),
                Image("city_break")
            ],
            tags: [
            "Nature",
            "Beach",
            "Together",
            "Love"
            ]
        ),
        Post(
            date: Date.fromString(dateAsString: "16/01/2022"),
            title: "Adventure in nature",
            image: Image("adventure_in_nature"),
            carouselImages: [
                Image("sunset_couple_picture"),
                Image("adventure_in_nature"),
                Image("city_break")
            ],
            tags: [
                "Nature",
                "Hiking",
                "Danger",
                "Gratitude"
            ]
        ),
        Post(
            date: Date.fromString(dateAsString: "21/12/2022"),
            title: "City Break",
            image: Image("city_break"),
            carouselImages: [
                Image("sunset_couple_picture"),
                Image("adventure_in_nature"),
                Image("city_break")
            ],
            tags: [
                "City",
                "Break",
                "Bucharest",
                "Amazing"
            ]
        )
    ]
}
