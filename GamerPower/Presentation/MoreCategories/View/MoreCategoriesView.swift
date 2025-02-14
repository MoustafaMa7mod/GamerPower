//
//  MoreCategoriesView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct MoreCategoriesView: View {
    
    @State var items: [String: [GiveawayItemPresentationModel]]
    private var viewHeight: CGFloat
    
    init(items: [String : [GiveawayItemPresentationModel]] = [:], viewHeight: CGFloat = 220) {
        self.items = items
        self.viewHeight = viewHeight
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading) {
                sectionsView
            }
        }
        .padding(.top, 12)
    }
    
    var sectionsView: some View {
        
        ForEach(items.keys.sorted(), id: \.self) { category in
            
            Section(header: Text(category)
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.bottom, 2)
            ) {
                
                if let categories = items[category] {
                    
                    CarouselScrollView(items: categories)
                        .padding(.top, 0)
                }
            }
        }
    }
}
