//
//  Address.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct Address: View {
    @StateObject private var vm = AddressViewModel(
        useCase: SearchAddressByCepImp(
            repository: SearchAddressByCepRepositoryImpl()
        )
    )

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
                LoadingBar(quantitySteps: 3, actualStep: 2)
                InputTitled(
                    title: "CEP",
                    size: 1.0,
                    padding: 24.0,
                    required: true,
                    onCommit: {
                        Task {
                            await vm.searchAddresByCep(cep: vm.cep)
                               }
                    } ,
                    value: $vm.cep
                )
                HStack(spacing: 12){
                    InputTitled(title: "Logradouro", size: 2/3,padding: 16, required: true, onCommit: {}, value: $vm.logradouro)
                    InputTitled(title: "Número", size: 1/3,padding: 16,required: true, onCommit: {}, value: $vm.numero)
                }
            InputTitled(title: "Bairro", size: 1,padding: 24, required: false, onCommit: {}, value: $vm.bairro)
            InputTitled(title: "Complemento", size: 1,padding: 24, required: false, onCommit: {}, value: $vm.complemento)
                HStack(spacing: 12){
                    InputTitled(title: "Cidade", size: 2/3,padding: 16, required: true, onCommit: {}, value: $vm.cidade)
                    InputTitled(title: "Estado", size: 1/3,padding: 16, required: true, onCommit: {}, value: $vm.estado)
                }
            .padding(.top,12)
        }
        Spacer()
            Divider()
            NavigationLink(
                destination: Completed()
            )
            {
                HStack{
                    Text("Continuar")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(Color.black)
                .cornerRadius(8)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(.init(systemName: "chevron.down"))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            })
            .navigationTitle("Endereço")
            .padding(.horizontal,16)
            .padding(.top,6)
    }
}

struct Address_Previews: PreviewProvider {
    static var previews: some View {
        Address()
    }
}
