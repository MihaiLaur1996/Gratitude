//
//  GratitudeListViewController.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

class GratitudeListViewController: UIHostingController<GratitudeListView> {
    private let viewModel: GratitudeListViewModel
    
    init(viewModel: GratitudeListViewModel) {
        self.viewModel = viewModel
        
        super.init(rootView: GratitudeListView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
