//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Vivien on 6/19/23.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum SortOrder {
    case defaultOrder, alphabetical, byCountry
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    @State private var sortOrder = SortOrder.defaultOrder
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu {
                    Button(action: { sortOrder = .defaultOrder }) {
                        Label("Default", systemImage: "arrow.up.arrow.down.square")
                        }

                    Button(action: { sortOrder = .alphabetical }) {
                        Label("Alphabetical", systemImage: "textformat.abc.dottedunderline")
                        }

                    Button(action: { sortOrder = .byCountry }) {
                        Label("By Country", systemImage: "globe")
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down.square")
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                }
            
            WelcomeView()
        }
        .phoneOnlyNavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        let sortedResorts: [Resort]
        
        switch sortOrder {
        case .defaultOrder:
            sortedResorts = resorts
        case .alphabetical:
            sortedResorts = resorts.sorted { $0.name < $1.name }
        case .byCountry:
            sortedResorts = resorts.sorted { $0.country < $1.country }
        }
        
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
