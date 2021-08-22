//
//  ButtonLabel.swift
//  ButtonLabel
//
//  Created by Stewart Lynch on 2021-08-17.
//

import SwiftUI

struct ButtonLabel: View {
    let symbolName: String
    let label: String
    var body: some View {
        HStack {
            Image(systemName: symbolName)
            Text(label)
        }
        .font(.headline)
        .padding()
        .frame(height: 40)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(symbolName: "camera", label: "Camera")
    }
}
