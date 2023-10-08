//
//  PushView.swift
//  CoordinatorUI
//
//  Created by Keith Staines on 08/10/2023.
//

import SwiftUI

struct PageView1: View {
    
    let coordinator: Page1Navigation
    
    var body: some View {
        VStack {
            
            Button("Show page 2") {
                coordinator.showPage2()
            }
            Button("Show page 3") {
                coordinator.showPage3()
            }
        }
        .navigationTitle(String.init(describing: Self.self))
    }
}

struct PageView2: View {
    
    let coordinator: Page2Navigation
    
    var body: some View {
        VStack {
            Button("Back to page 1") {
                coordinator.backToPage1()
            }
            Button("Show page 3") {
                coordinator.showPage3()
            }
        }
        .navigationTitle(String.init(describing: Self.self))
    }
}

struct PageView3: View {
    
    let coordinator: Page3Navigation
    
    var body: some View {
        
        VStack {
            Button("Back to page 1") {
                coordinator.backToPage1()
            }
            Button("Back to page 2") {
                coordinator.backToPage2()
            }
        }
        .navigationTitle(String.init(describing: Self.self))
    }
}

struct CoverView1: View {
    
   let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}

struct CoverView2: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}

struct CoverView3: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}

struct SheetView1: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}

struct SheetView2: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}

struct SheetView3: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        Text(String.init(describing: Self.self))
    }
}
