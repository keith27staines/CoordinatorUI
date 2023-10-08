//
//  Coordinator.swift
//  CoordinatorUI
//
//  Created by Keith Staines on 08/10/2023.
//

import SwiftUI

protocol Page1Navigation {
    func showPage2()
    func showPage3()
}

protocol Page2Navigation {
    func backToPage1()
    func showPage3()
}

protocol Page3Navigation {
    func backToPage1()
    func backToPage2()
}

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var cover: Cover?
    
    var currentPage: Page = .page1
    
    var root = CoordinatorView()
    
    func start() -> some View {
        build(.page1)
    }
    
    private func push(_ page: Page) {
        path.append(page)
    }
    
    private func pop() {
        path.removeLast()
    }
    
    private func popToRoot() {
        path.removeLast(path.count)
    }
    
    private func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    private func present(_ cover: Cover) {
        self.cover = cover
    }
    
    private func dismissSheet() {
        sheet = nil
    }
    
    private func dismissCover() {
        cover = nil
    }
    
    @ViewBuilder func build(_ page: Page) -> some View {
        switch page {
        case .page1:
            PageView1(coordinator: self)
        case .page2:
            PageView2(coordinator: self)
        case .page3:
            PageView3(coordinator: self)
        }
        
    }
    
    @ViewBuilder func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .sheet1:
            SheetView1(coordinator: self)
        case .sheet2:
            SheetView2(coordinator: self)
        case .sheet3:
            SheetView3(coordinator: self)
        }
    }
    
    @ViewBuilder func build(_ cover: Cover) -> some View {
        switch cover {
        case .cover1:
            CoverView1(coordinator: self)
        case .cover2:
            CoverView2(coordinator: self)
        case .cover3:
            CoverView3(coordinator: self)
        }
    }
}

enum Page: Identifiable {
    case page1
    case page2
    case page3
    var id: String {
        switch self {
        case .page1: return "Page1"
        case .page2: return "Page2"
        case .page3: return "Page3"
        }
    }
}


enum Sheet: Identifiable {
    case sheet1
    case sheet2
    case sheet3
    var id: String {
        switch self {
        case .sheet1: return "Sheet1"
        case .sheet2: return "Sheet2"
        case .sheet3: return "Sheet3"
        }
    }
}

enum Cover: Identifiable {
    case cover1
    case cover2
    case cover3
    var id: String {
        switch self {
        case .cover1: return "Cover1"
        case .cover2: return "Cover2"
        case .cover3: return "Cover3"
        }
    }
}

extension Coordinator: Page1Navigation {
    func showPage2() {
        push(.page2)
    }
    
    func showPage3() {
        push(.page3)
    }
}

extension Coordinator: Page2Navigation {
    func backToPage1() {
        popToRoot()
    }
}

extension Coordinator: Page3Navigation {
    func backToPage2() {
        pop()
    }
}
