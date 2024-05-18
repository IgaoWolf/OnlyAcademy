import SwiftUI

struct ProfileView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let postImages = [
        "post1", "post2", "post3", "post4", "post5", "post6"
    ]

    var body: some View {
        ScrollView {
            VStack {
                // Foto de Perfil, Nome de Usuário, Biografia, Contadores, e Botão
                Image("profile_picture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 10)

                Text("Igor Augusto Wolf")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                Text("Esta é a biografia do usuário. Aqui você pode adicionar algumas informações sobre você.")
                    .font(.body)
                    .padding([.leading, .trailing, .top], 20)
                    .multilineTextAlignment(.center)

                HStack {
                    VStack {
                        Text("34")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Postagens")
                    }
                    VStack {
                        Text("1.2k")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Seguidores")
                    }
                    VStack {
                        Text("250")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Seguindo")
                    }
                }
                .padding(.top, 20)

                Button(action: {
                    // Ação do botão
                }) {
                    Text("Editar Perfil")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)

                // Grade de Postagens
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(postImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipped()
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
