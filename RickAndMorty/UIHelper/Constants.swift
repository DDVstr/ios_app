//
//  Constants.swift
//  RickAndMorty
//
//  Created by Ilya Zhornichenko on 01.06.2022.
//

import Foundation
import UIKit


//Setting structure for UIContsants

struct Constants {
    
    enum RMUrl {
        static let apiUrl = "https://rickandmortyapi.com/api"
    }
    
    enum RMSystemSymbols {
        static let characters = UIImage(systemName: "person.3")
        static let locations  = UIImage(systemName: "map")
        static let location = UIImage(systemName: "mappin.and.ellipse")
    }
    
    enum Images {
        static let imgPlaceholder = UIImage(named: "RickandMortyPlaceholder")
        static let imgNotFound    = UIImage(named: "RM404")
    }
    
    enum Section {
        case main
    }
}




