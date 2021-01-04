//
//  homeNDE.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 28/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import SwiftUI

struct ndeHomeItem: Identifiable {
    var id = UUID()
    var name: String
}

struct homeNDE: View {
    var items = [ndeHomeItem(name: "Docente"), ndeHomeItem(name: "Discente")]
    
    var body: some View {
        NavigationView {
            List(items) { item in
                Text(item.name)
            }.navigationBarTitle("Home")
        }
    }
}

struct homeNDE_Previews: PreviewProvider {
    static var previews: some View {
        homeNDE()
    }
}
