//
//  CharacterStorage.swift
//  RickAndMorty
//
//  Created by Zhornihcneko on 15.05.2022.
//

import Foundation

enum SaveType {
    case favourite
    case recent
}

protocol Storage {
    func save(_ models: [Int], _ type: SaveType)
}

final class CharacterStorage: Storage {
    func save(_ models: [Int], _ type: SaveType) {
        switch type {
        case .favourite:
            UserDefaults.standard.set(models, forKey: "Favourite characters")
        case .recent:
            UserDefaults.standard.set(models, forKey: "Recent characters")
        }
    }
    
    func getCharactersID(_ type: SaveType) -> [Int] {
        switch type {
        case .favourite:
            return UserDefaults.standard.array(forKey: "Favourite characters") as? [Int] ?? []
        case .recent:
            return UserDefaults.standard.array(forKey: "Recent characters") as? [Int] ?? []
        }
    }
    
    func appendCharacterTo(_ type: SaveType,_ model: CharacterModel) {
        switch type {
        case .favourite:
            let favouriteCharacters = UserDefaults.standard.array(forKey: "Favourite characters") as? [Int]
            var newFavouriteCharacters = favouriteCharacters
            newFavouriteCharacters?.append(model.id)
            UserDefaults.standard.set(newFavouriteCharacters, forKey: "Favourite characters")
        case .recent:
            let favouriteCharacters = UserDefaults.standard.array(forKey: "Recent characters") as? [Int]
            var newFavouriteCharacters = favouriteCharacters
            newFavouriteCharacters?.append(model.id)
            UserDefaults.standard.set(newFavouriteCharacters, forKey: "Recent characters")
        }
    }
    
    func removeCharacterFor(_ type: SaveType,_ model: CharacterModel) {
        switch type {
        case .favourite:
            let favouriteCharacters = UserDefaults.standard.array(forKey: "Favourite characters") as? [Int]
            let newFavouriteCharacters = favouriteCharacters?.filter {$0 != model.id}
            UserDefaults.standard.set(newFavouriteCharacters, forKey: "Favourite characters")
        case .recent:
            let favouriteCharacters = UserDefaults.standard.array(forKey: "Recent characters") as? [Int]
            let newFavouriteCharacters = favouriteCharacters?.filter {$0 != model.id}
            UserDefaults.standard.set(newFavouriteCharacters, forKey: "Recent characters")
        }
    }}
