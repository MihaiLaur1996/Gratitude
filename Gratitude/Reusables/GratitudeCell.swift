//
//  GratitudeCell.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

struct GratitudeCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                GratitudeEntryDetails(
                    date: post.date,
                    title: post.title
                )
                if let image = post.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            if let tags = post.tags {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tags, id: \.self) {
                            Tag(text: $0)
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
                }
            }
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#if DEBUG
struct GratitudeCell_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            GratitudeCellsView()
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
                .previewLayout(.sizeThatFits)
        }
    }
    
    struct GratitudeCellsView: View {
        var body: some View {
            ScrollView(showsIndicators: false) {
                ForEach(Post.allPosts) {
                    GratitudeCell(post: $0)
                }
                .padding(.vertical)
            }
            .frame(maxHeight: .infinity)
            .background(Color.gray)
        }
    }
}
#endif
