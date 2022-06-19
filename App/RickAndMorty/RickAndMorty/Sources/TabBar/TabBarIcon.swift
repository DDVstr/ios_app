import SwiftUI

enum TabBarIcon {
    case characters
    case locations
    case episodes
}

extension TabBarIcon {
    private var imageResourceName: String {
        switch self {
        case .characters:
            return "heart"
        case .locations:
            return "homepod.and.homepodmini.fill"
        case .episodes:
            return "homepod.and.homepodmini.fill"
        }
    }

    var image: Image {
        Image(systemName: imageResourceName)
    }
}
