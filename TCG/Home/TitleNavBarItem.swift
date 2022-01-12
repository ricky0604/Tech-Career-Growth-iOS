//
//  TitleNavBarItem.swift
//  TCG
//
//  Created by Alexander Chiou on 1/11/22.
//

import SwiftUI
import PagerTabStripView

private class NavTabViewTheme: ObservableObject {
    @Published var textColor = Color.gray
    @Published var backgroundColor = Color.white
}

struct TitleNavBarItem: View, PagerTabViewDelegate {
    
    let title: String
    @ObservedObject fileprivate var theme = NavTabViewTheme()
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(theme.textColor)
                .font(.system(size: 17))
                .padding(.horizontal)
        }
        .background(theme.backgroundColor)
    }
    
    func setState(state: PagerTabViewState) {
        switch state {
        case .selected:
            self.theme.textColor = Colors.titleText
            self.theme.backgroundColor = Colors.tabBackground
        case .highlighted:
            self.theme.textColor = Colors.highlightedText
            self.theme.backgroundColor = Colors.tabBackground
        default:
            self.theme.textColor = Colors.footerText
            self.theme.backgroundColor = Colors.tabBackground
        }
    }
}