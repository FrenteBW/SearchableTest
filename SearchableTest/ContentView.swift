//
//  ContentView.swift
//  SearchableTest
//
//  Created by 안병욱의 mac on 2023/10/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var updatedPeoples: [People] = []
    
    var body: some View {
        VStack {
            NavigationView {
                List(text == "" ? peoples : updatedPeoples) { data in
                    NavigationLink {
                        PeopleView(name: data.name)
                    } label: {
                        //Text($0.name)
                        Text(data.name)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Searchable Test")
            }
            //.searchable(text: $text, placement: .navigationBarDrawer)
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            //.searchable(text: $text, placement: .automatic)
            
            
            .onChange(of: text) { searchValue in
                updatedPeoples = peoples.filter { $0.name.contains(searchValue)}
            }
        }
    }
}


struct PeopleView: View {
  var name: String
  
  var body: some View {
    Text(name)
  }
    
}
