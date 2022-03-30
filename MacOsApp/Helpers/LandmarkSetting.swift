//
//  LandmarkSetting.swift
//  MacOsApp
//
//  Created by JoSoJeong on 2022/03/31.
//

import SwiftUI

struct LandmarkSetting: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
           Picker("Map Zoom:", selection: $zoom) {
               ForEach(MapView.Zoom.allCases) { level in
                   Text(level.rawValue)
               }
           }
           .pickerStyle(InlinePickerStyle())
       }
       .frame(width: 300)
       .navigationTitle("Landmark Settings")
       .padding(80)
    }
}

struct LandmarkSetting_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSetting()
    }
}
