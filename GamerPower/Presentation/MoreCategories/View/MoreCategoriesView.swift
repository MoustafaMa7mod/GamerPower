//
//  MoreCategoriesView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct MoreCategoriesView: View {
    
    @State var moreCategoriesGiveaways: [String: [GiveawayItemPresentationModel]] = [:]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Categories")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    let items = moreCategoriesGiveaways
                    ForEach(items.keys.sorted(), id: \.self) { category in
                        Section(header: Text(category)
                            .font(.headline)
                            .padding(.horizontal)
                        ) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(moreCategoriesGiveaways[category] ?? []) { giveaway in
                                        GiveawayCard(item: giveaway)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            
        }
    }
}
