//
//  MoreCategoriesView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct MoreCategoriesView: View {
    
    @State var items: [String: [GiveawayItemPresentationModel]] = [:]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(items.keys.sorted(), id: \.self) { category in
                        Section(header: Text(category)
                            .font(.headline)
                            .padding(.horizontal)
                        ) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(items[category] ?? []) { giveaway in
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
