import SwiftUI
import SwiftUIUtils

struct CharacterDetailView<ViewModel>: View where ViewModel: CharacterDetailViewModelType {
    var viewModel: ViewModel
    @State var isLiked: Bool
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self._isLiked = State(initialValue: FavoritesCharacters.favoritesCharactersArray.contains(viewModel.output.state.name))
    }
    
    var body: some View {
        GeometryReader { proxy in
            List {
                let presentation = viewModel.output.state
                
                // Image
                URLImage(imageUrl: presentation.image)
                    .scaledToFit()
                    .cornerRadius(10)
                
                // Name and like button
                HStack {
                    Text(viewModel.output.state.name).bold()
                    
                    Spacer()
                    
                    Button {
                        buttonPressed()
                    } label: {
                        isLiked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    }.buttonStyle(BorderlessButtonStyle())
                }
                
                
                // INFO
                ForEach(presentation.sections, id: \.self) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.rows, id: \.self) { rowInfo in
                            ListInfoRowView(label: rowInfo.title, value: rowInfo.gender)
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.input.onAppear)
    }

    func buttonPressed() {
        var elementPresentedInSet = FavoritesCharacters.favoritesCharactersArray.contains(viewModel.output.state.name)
        
        if elementPresentedInSet {
            print("Removed from favorites: \(viewModel.output.state.name)")
            isLiked.toggle()
            FavoritesCharacters.favoritesCharactersArray.remove(viewModel.output.state.name)
        } else {
            print("Added to favorites: \(viewModel.output.state.name)")
            isLiked.toggle()
            FavoritesCharacters.favoritesCharactersArray.insert(viewModel.output.state.name)
        }
    }
    
    @ViewBuilder
    private func makeDestination(for episode: CharacterDetailPresentation.EpisodePresentationData) -> some View {
        viewModel.input.showEpisode(episode.model)
    }
}

// struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let dependencies = CharacterDetailModuleFactory.Dependencies(
//            getEpisodeList: GetEpisodeListUseCase,
//            characterEpisodes: { _ in AnyView(EmptyView()) }
//        )
//        return CharacterDetailModuleFactory(dependencies: dependencies).make(character: .mock)
//    }
// }
