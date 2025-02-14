//
//  CarouselScrollView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct CarouselScrollView: View {
    
    @State var items: [GiveawayItemPresentationModel]
    private let viewHeight: CGFloat = 220

    var body: some View {
           ScrollView(.horizontal, showsIndicators: false) {
               
               HStack(spacing: -10) {
                   
                   ForEach(items, id: \.id) { item in
                       GeometryReader { proxy in
                           let minX = proxy.frame(in: .global).minX
                           let screenWidth = UIScreen.main.bounds.width
                           let rotation = -minX / screenWidth * 15

                           GiveawayCard(item: item, viewHeight: viewHeight)
                               .frame(width: screenWidth * 0.92, height: viewHeight)
                               .cornerRadius(12)
                               .shadow(radius: 4)
                               .rotation3DEffect(
                                   .degrees(rotation),
                                   axis: (x: 0, y: 1, z: 0)
                               )
                       }
                       .frame(width: UIScreen.main.bounds.width * 0.92, height: viewHeight)
                   }
               }
               .padding(.horizontal, 8)
           }
           .frame(height: viewHeight)
       }

}
