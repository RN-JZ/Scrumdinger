//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Furqan on 26/05/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ScrumsView(scrums: $scrums)
            }
        }
    }
}
