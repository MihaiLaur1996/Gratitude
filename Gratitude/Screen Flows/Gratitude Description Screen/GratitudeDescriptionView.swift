//
//  GratitudeDescriptionView.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 21.12.2022.
//

import SwiftUI

struct GratitudeDescriptionView: View {
    @ObservedObject var viewModel: GratitudeDescriptionViewModel
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: 3)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
                .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false) {
                content
                imagesCarousel
                tagsGrid
            }
        }
        .foregroundColor(.black)
        .background(Color.lightGray)
        .sheet(isPresented: $viewModel.isEditing) {
            PostEditingView(
                post: $viewModel.post,
                isEditingScreenPresented: $viewModel.isEditing
            )
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            GratitudeEntryDetails(
                date: viewModel.post.date,
                title: viewModel.post.title
            )
            .padding(.horizontal)
            if let image = viewModel.post.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding(.top)
    }
    
    private var imagesCarousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<(viewModel.post.carouselImages ?? []).count, id: \.self) {
                    viewModel.post.carouselImages?[$0]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 50)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
    
    private var tagsGrid: some View {
        LazyVGrid(columns: items, spacing: 10) {
            ForEach(viewModel.post.tags ?? [], id: \.self) {
                if let tag = $0 {
                    Tag(text: tag)
                }
            }
        }
        .padding(.top)
    }
    
    private var header: some View {
        HStack {
            Button {
                viewModel.onBack.send(viewModel.post)
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Text(LocalizableStrings.Buttons.back)
                        .font(.headline)
                }
            }
            .buttonStyle(.plain)
            Spacer()
            trailingButtons
        }
        .padding(.horizontal)
    }
    
    private var trailingButtons: some View {
        HStack(spacing: 20) {
            Button {
                viewModel.isEditing = true
            } label: {
                Image(systemName: "pencil")
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)
            Button {
                viewModel.onDelete.send(viewModel.post)
            } label: {
                Image(systemName: "trash")
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)
        }
    }
}

#if DEBUG
struct GratitudeDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            GratitudeDescriptionView(viewModel: GratitudeDescriptionViewModel(post: Post.allPosts[0]))
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
