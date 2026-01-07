//
//  Order.swift
//  Exercise4
//
//  Created by Khue on 7/1/26.
//

import SwiftUI
import Combine

final class Order: ObservableObject {
    @Published var items: [Appertizer] = []
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appertizer: Appertizer) {
        items.append(appertizer)
    }
    
    func deleteAtIndexSet(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
