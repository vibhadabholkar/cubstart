//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

struct CustomCell: View {
    
    var imageName: String
    var itemName: String
    var quantity: Int
    
    var body: some View {
        HStack {
            Image(imageName)
            Text(itemName)
            Text(quantity)
        }.leading()
    }
}

class Items: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: Int
    
    init(image: String, name: String, number: Int) {
        self.imageName: image
        self.itemName: name
        self.quantity: number
    }
}

struct ContentView: View {
    
    var list = [
        Items(imageName: "banana.jpeg", itemName: "Bananas", quantity: 3),
        Items(imageName: "apple.jpeg", itemName: "Apples", quantity: 4),
        Items(imageName: "eggs.jpeg", itemName: "Eggs", quantity: 12)]
    
    var body: some View {
        NavigationView {
            Section(header: Text("Fruits")) {
                ForEach(list) { i in
                    CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                }
            }
            .navigationTitle("Shopping List")
            .listStyle(GroupedListSyle())
        }
    }
}
