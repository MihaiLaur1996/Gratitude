//
//  UIApplication+Extensions.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 23.12.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
