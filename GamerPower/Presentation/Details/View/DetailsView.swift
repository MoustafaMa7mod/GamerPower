//
//  DetailsView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct DetailsView<ViewModel>: View where ViewModel: DefaultDetailsViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Mostafa")
            }
        }
    }    
}
