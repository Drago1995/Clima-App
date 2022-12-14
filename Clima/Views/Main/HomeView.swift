//
//  HomeView.swift
//  Clima
//
//  Created by Gilberto Mera on 14/12/22.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable{
    case top = 0.83
    case middle = 0.385
    
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        NavigationView {
            ZStack{
                    // MARK: Background color
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.top, 257)
                    
                    VStack(spacing: -10){
                        Text("Atlacoyork")
                            .font(.largeTitle)
                        
                        VStack{
                            Text(attributedString)
                            Text("H:24  L:18")
                                .font(.title3.weight(.semibold))
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    
                //MARK: Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition){
                    //Text(bottomSheetPosition.rawValue.formatted())
                }content:{
                    ForecastView()
                }
                
                //MARK: Tab Bar
                TabBar(action: {
                    bottomSheetPosition = .top
                })
                }
            .navigationBarHidden(true)
        }
        
    }
    private var attributedString: AttributedString{
        var string = AttributedString("19°" + "\n " + "Despejado")
        
        if let temp = string.range(of: "19°"){
            string[temp].font = .system(size: 96, weight: .thin)
            string [temp].foregroundColor = .primary
            
        }
        
        if let separador = string.range(of: " | "){
            string[separador].font = .title3.weight(.semibold)
            string[separador].foregroundColor = .secondary
        }
        
        if let clima = string.range(of: "Despejado"){
            string[clima].font = .title3.weight(.semibold)
            string[clima].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
