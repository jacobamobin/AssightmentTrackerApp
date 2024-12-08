//
//  Home.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//
import SwiftUI
import SwiftData

struct Home: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var events: [Event]
    @Query private var classes: [Classes]
    
    @State private var selectedClass: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeHeader(events: events, classes: classes, selectedClass: $selectedClass)
                    
                    ScrollView {
                        //Stats()
                        
                        ClassSelector(selectedClass: $selectedClass)
                        
                        HomeScrollingSection(
                            events: events,
                            classes: classes,
                            selectedClass: $selectedClass
                        )
                        
                        Spacer()
                        
                        DonationPromo()
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                    }
                }
                .padding(5)
                
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        VStack (spacing: -15){
                            NavigationLink(destination: EventAdderMic()) {
                                AddByMicrophone()
                            }
                            NavigationLink(destination: EventAdder()) {
                                AddButton()
                            }
                        }
                        
                    }
                    .padding(5)
                }
                .padding(5)
            }
        }
    }
}

#Preview {
    Home()
}
