//
//  GratitudeListView.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 21.12.2022.
//

import SwiftUI

struct GratitudeListView: View {
    @ObservedObject var viewModel: GratitudeListViewModel
    
    var body: some View {
        content
            .onAppear {
                guard viewModel.posts.isEmpty else { return }
                viewModel.fetchPosts()
            }
            .animation(.easeInOut, value: viewModel.isLoading)
            .sheet(isPresented: $viewModel.isSheetPresented) {
                PostAdditionView(viewModel: viewModel)
            }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.posts.isEmpty && !viewModel.isLoading {
            emptyScreen
        } else if viewModel.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            VStack(spacing: 5) {
                header
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.posts, id: \.id) {
                        cell(post: $0)
                    }
                    .padding(.top, 10)
                }
            }
            .background(Color.lightGray)
        }
    }
    
    private var header: some View {
        HStack {
            Text(LocalizableStrings.Titles.mainTitle)
                .font(.system(size: 30, weight: .heavy))
                .foregroundColor(.black)
            Spacer()
            Button {
                viewModel.isSheetPresented = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
    
    private func cell(post: Post) -> some View {
        Button {
            viewModel.onNext.send(post)
        } label: {
            GratitudeCell(post: post)
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 3)
    }
    
    private var emptyScreen: some View {
        VStack(spacing: 30) {
            Image(systemName: "trash")
                .renderingMode(.template)
                .resizable()
                .frame(width: 70, height: 90)
            Text(LocalizableStrings.Empty.emptyPosts)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}

#if DEBUG
struct GratitudeListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PreviewDevices.allCases, id: \.rawValue) {
            GratitudeListView(viewModel: GratitudeListViewModel())
                .previewDevice(PreviewDevice(rawValue: $0.rawValue))
        }
    }
}
#endif
