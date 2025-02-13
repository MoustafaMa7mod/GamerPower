//
//  DetailsViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

protocol DetailsViewModel: ObservableObject {
   
    var item: GiveawayItemPresentationModel { get }
}
