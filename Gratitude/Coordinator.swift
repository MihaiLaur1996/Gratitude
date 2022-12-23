//
//  Coordinator.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 21.12.2022.
//

import SwiftUI
import Combine

class Coordinator {
    private let window: UIWindow?
    
    private var mainNavigationController: UINavigationController?
    private var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow?) {
        self.window = window
        
        start()
    }
    
    func start() {
        let viewModel = GratitudeListViewModel()
        viewModel
            .onNext
            .sink { [weak self] post in
                self?.showGratitudeDescriptionScreen(post: post, onChange: {
                    viewModel.update(post: $0)
                }, onDelete: {
                    viewModel.remove(post: $0)
                })
            }
            .store(in: &subscriptions)
        
        let gratitudeListViewController = GratitudeListViewController(viewModel: viewModel)
        mainNavigationController = UINavigationController(rootViewController: gratitudeListViewController)
        mainNavigationController?.navigationBar.isHidden = true
        window?.rootViewController = mainNavigationController
    }
    
    private func showGratitudeDescriptionScreen(
        post: Post,
        onChange: @escaping (Post) -> Void,
        onDelete: @escaping (Post) -> Void
    ) {
        let viewModel = GratitudeDescriptionViewModel(post: post)
        viewModel
            .onBack
            .sink { [weak self] post in
                self?.mainNavigationController?.popViewController(animated: true)
                onChange(post)
            }
            .store(in: &subscriptions)
        viewModel
            .onDelete
            .sink { [weak self] post in
                self?.mainNavigationController?.popViewController(animated: true)
                onDelete(post)
            }
            .store(in: &subscriptions)
        
        let gratitudeDescriptionViewController = GratitudeDescriptionViewController(viewModel: viewModel)
        mainNavigationController?.pushViewController(gratitudeDescriptionViewController, animated: true)
    }
    
    private func presentPostCreationScreen() {
        
    }
}
