//
//  Piano_Practice_AppApp.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

@main
struct Piano_Practice: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Pianoman()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

                .environmentObject(SongModel())
                .environmentObject(Settings())
                .environmentObject(AudioRecorder())
                .environmentObject(AudioPlayer())
        }
    }
}
