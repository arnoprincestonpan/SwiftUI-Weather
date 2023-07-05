//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Arno Princeston pan on 2023-07-05.
//

import Foundation
import SwiftUI

struct WeatherButtonLabel: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 314, height: 64)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 24, weight: .bold, design: .default))
            .cornerRadius(16.0)
    }
}
