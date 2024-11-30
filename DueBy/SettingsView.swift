//
//  SettingsView.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .font(.largeTitle)
            .fontWeight(.bold)
        List {
            Section(header: Text("Account")) {
                HStack {
                    Text("iCloud Sync")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            
            
            //Section(header: Text("Appearance")) {
            //    NavigationLink("Widget Color", destination: WidgetColorSettings())
            //}
            

            Section(header: Text("Notifications")) {
                Button(action: {
                    // Open notification settings
                }) {
                    Text("Open Notification Settings")
                }
            }
            
            Section(header: Text("Actions")) {
                Button(action: {
                    // Open app settings
                }) {
                    Text("Open in Settings")
                }
                
                Button(action: {
                    // Restore purchases
                }) {
                    Text("Restore Purchases")
                }
                
                Button(action: {
                    // Send feedback
                }) {
                    Text("Send Feedback")
                }
                
                Button(action: {
                    // Show privacy policy
                }) {
                    Text("Privacy Policy")
                }
            }
            
            Section {
                GithubPromo()
                DonationPromo()
            }
            
            
            
        }
        .navigationTitle("Settings")
        
        
    }
}

struct WidgetColorSettings: View {
    var body: some View {
        Text("Widget Color Settings")
    }
}

#Preview {
    SettingsView()
}

