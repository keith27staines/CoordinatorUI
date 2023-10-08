//
//  CoordinatorView.swift
//  CoordinatorUI
//
//  Created by Keith Staines on 08/10/2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.start()
                .navigationDestination(for: Page.self) { destination in
                    coordinator.build(destination)
                }
        }
    }
}

#Preview {
    CoordinatorView()
}


