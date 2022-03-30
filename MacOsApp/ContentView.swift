//
//  ContentView.swift
//  MacOsApp
//
//  Created by JoSoJeong on 2022/03/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
       LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
