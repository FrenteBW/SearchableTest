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
                        Text(data.name)
                    }
                }
                .listStyle(DefaultListStyle())
                .navigationTitle("Searchable Test")
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            
            .onChange(of: text) { searchValue in
                updatedPeoples = peoples.filter { $0.name.localizedStandardContains(searchValue)}
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

struct People: Identifiable {
    var id = UUID()
    var name: String
}


var peoples = [People(name: "Seongbeom Ko"), People(name: "Byungjun An"), People(name: "Bokyung Kim"), People(name: "Jinwoo Jeon"), People(name: "Jongsung Lee"), People(name: "Hyungmo Yang"), People(name: "Changhoon Kwon"), People(name: "Kije Lee"), People(name: "Kihun Yeom"), People(name: "Sangmin Lee"), People(name: "Juchan Kim"), People(name: "Kozuka Kazuki")]
