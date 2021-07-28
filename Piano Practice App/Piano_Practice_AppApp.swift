//
//  Piano_Practice_AppApp.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

@main
struct Piano_Practice_AppApp: App {
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            Pianoman()
                .environmentObject(settings)
        }
    }
}
