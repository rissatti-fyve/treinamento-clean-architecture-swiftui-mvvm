//
//  DetailsProductView.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct DetailsProductView: View {
    @State private var image: UIImage? = nil
    @State private var selectedSize: String?
    @State var quantity = 1
    @State var selectdImage: Int = 0
    
    @StateObject private var vm = DetailsProductViewModel(
        useCase: SendPostRequestImp(
            repository: SendPostRequestRepositoryImpl()
        )
    )
    
    let product: ProductBack
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 270)
                    .clipped()
            } else {
                Color(white: 0.9)
                    .frame(width: 175, height: 147)
                    .onAppear {
                        loadImageFromURL(product.images.principal) { loadedImage in
                            DispatchQueue.main.async {
                                self.image = loadedImage
                            }
                        }
                    }
            }
            ImageCarrousel(selectedImageIndex: $selectdImage, imageStringURLs: product.images.others)
                .onChange(of: selectdImage) { _ in
                    loadImageFromURL(product.images.others[selectdImage]){
                        loadedImage in
                            DispatchQueue.main.async {
                                self.image = loadedImage
                            }
                    }
                }
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.categoria)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(product.nome)
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(product.description)
                        .foregroundColor(.gray)
                    SizeSelector(sizes: product.sizes, selectedSize: $selectedSize)
                        .padding(.top, 10)
                }.padding(.horizontal, 16)
            }
            Divider()
            HStack(alignment: .center) {
                Counter(value: $quantity, isSmall: false)
                Button {
                    Task{
                        await vm.sendPostRequest(for: product, for: quantity)
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Adicionar")
                            .foregroundColor(.white)
                        Spacer()
                        Text("R$" + (product.price * Double(quantity)).formatPrice())
                            .foregroundColor(.white)
                    }
                    .frame(width: (UIScreen.main.bounds.width * 3/5) - 16)
                    .padding(15)
                    .background(.black)
                    .cornerRadius(6)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton())
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
