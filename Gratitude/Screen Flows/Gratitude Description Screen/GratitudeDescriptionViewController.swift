//
//  GratitudeDescriptionViewController.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import SwiftUI

class GratitudeDescriptionViewController: UIHostingController<GratitudeDescriptionView> {
    let viewModel: GratitudeDescriptionViewModel
    
    init(viewModel: GratitudeDescriptionViewModel) {
        self.viewModel = viewModel
        
        super.init(rootView: GratitudeDescriptionView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
