//
//  SettingsView.swift
//  AvocadoKir
//
//  Created by Test on 2.10.23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            //header
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                .foregroundStyle(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form {
                // section 1
                Section {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notifications")
                    }
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background refresh")
                    }
                    
                } header: {
                    Text("General Settings")
                }
                
                // section 2
                Section {
                    if enableNotification {
                        HStack {
                            Text("Product")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatibility")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack {
                            Text("Developer")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("Aliaksei")
                        }
                        HStack {
                            Text("Designer")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("Aliaksei")
                        }
                        HStack {
                            Text("Instagram")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("@pterokir")
                        }
                        HStack {
                            Text("Version")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text("Happy Coding!")
                        }
                    }

                } header: {
                    Text("Application")
                }

            }
        }
        .frame(maxWidth: 640)
    }
}

#Preview {
    SettingsView()
}
