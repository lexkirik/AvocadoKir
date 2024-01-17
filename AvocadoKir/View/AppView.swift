//
//  AppView.swift
//  AvocadoKir
//
//  Created by Test on 2.10.23.
//

import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            AvocadoView()
                .tabItem {
                    Image("TabIcons/tabicon-branch")
                    Text("Avocados")
                }
            ContentView()
                .tabItem {
                    Image("TabIcons/tabicon-book")
                    Text("Recies")
                }
            RipeningStagesView()
                .tabItem {
                    Image("TabIcons/tabicon-avocado")
                    Text("Ripening")
                }
            SettingsView()
                .tabItem {
                    Image("TabIcons/tabicon-settings")
                    Text("Settings")
                }
        }
        .ignoresSafeArea(.all)
        .accentColor(.primary)
    }
}

#Preview {
    AppView()
}
