/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)  && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    var title: String {
       let title = filter == .all ? "Landmarks" : filter.rawValue
       return showFavoritesOnly ? "Favorite \(title)" : title
   }



    var body: some View {
        NavigationView {
           List {
               Toggle(isOn: $showFavoritesOnly) {
                   Text("Favorites only")
               }
               ForEach(filteredLandmarks) { landmark in
                   NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                       LandmarkRow(landmark: landmark)
                   }
               }
           }
           .navigationTitle(title)
           .frame(minWidth: 300)
           .toolbar {
               ToolbarItem {
                   Menu {
                       Picker("Category", selection: $filter) {
                           ForEach(FilterCategory.allCases) { category in
                               Text(category.rawValue).tag(category)
                           }
                       }.pickerStyle(InlinePickerStyle())

                       Toggle(isOn: $showFavoritesOnly) {
                           Label("Favorites only", systemImage: "star.fill")
                       }
                   } label: {
                       Label("Filter", systemImage: "slider.horizontal.3")
                   }
               }
           }
        }
            
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}