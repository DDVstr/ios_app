import SwiftUI
import SwiftUIUtils

struct CharacterView: View {
    let presentation: CharacterPresentation

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    URLImage(imageUrl: presentation.image)
                        .scaledToFill()
                        .frame(width: 120)
                        .cornerRadius(10)

                    VStack(alignment: .leading) {
                        Text(presentation.name)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            
                        Text(presentation.model.species)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                }
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width * 0.95, height: 1, alignment: .center)
            }
            
        }.frame(height: UIScreen.main.bounds.size.height / 5)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let presentation = CharacterPresentation(
                image: nil,
                name: "Rick Sánchez",
                model: .mock
            )

            CharacterView(presentation: presentation)
                .frame(width: 300, height: 300)
                .previewLayout(.sizeThatFits)

            CharacterView(presentation: presentation)
                .frame(width: 300, height: 300)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
