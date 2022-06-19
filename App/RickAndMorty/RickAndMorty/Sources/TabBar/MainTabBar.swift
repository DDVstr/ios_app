import SwiftUI


struct CustomColor {
    static let myColor = Color("Color")
    
}

struct MainTabBar: View {
    let characterListView: AnyView
    let locationListView: AnyView
    let episodeListView: AnyView
    
    
        //init() {
          //  UITabBar.appearance().backgroundColor = UIColor.blue
        //}
    var body: some View {
        TabView {
            characterListView
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            locationListView
                .tabItem {
                   
                    Label("Favorites", systemImage: "heart.circle")
                }
            episodeListView
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
                .onAppear() {
                    
                    UITabBar.appearance().backgroundColor = UIColor(Color("Color_set"))
                                                                          
                }
        

        .accentColor(Color("Color"))
        

    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar(
            characterListView: AnyView(Text("Hey")),
            locationListView: AnyView(Text("Hey")),
            episodeListView: AnyView(Text("Hey"))
        )
    }
}
