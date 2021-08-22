//
//  My_ImagesApp.swift
//  My Images
//
//  Created by Stewart Lynch on 2021-08-08.
//

import SwiftUI

@main
struct My_ImagesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
