//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Vivien on 6/20/23.
//

import SwiftUI

@MainActor class Favorites: ObservableObject {
    @Published private(set) var resorts: Set<String> = Set<String>()
    private let saveKey = "Favorites"
    private var saveFileURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("SavedData.json")
    }()
    
    init() {
        load()
    }
    
    private func load() {
        do {
            let data = try Data(contentsOf: saveFileURL)
            let decodedData = try JSONDecoder().decode(Set<String>.self, from: data)
            resorts = decodedData
        } catch {
            print("Couldn't load data: \(error)")
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: saveFileURL)
        } catch {
            print("Couldn't save data: \(error)")
        }
    }
}

