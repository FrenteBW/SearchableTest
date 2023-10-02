//
//  People.swift
//  SearchableTest
//
//  Created by 안병욱의 mac on 2023/10/02.
//

import Foundation

struct People: Identifiable {
    var id = UUID()
    var name: String
}

var peoples = [People(name: "Byungwook An"), People(name: "Yunmo An"), People(name: "Yujin Jang"), People(name: "Yejin An")]
