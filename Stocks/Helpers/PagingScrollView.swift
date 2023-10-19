//
//  PagingScrollView.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI

struct PagingScrollView<Content: View>: View {
    let pageCount: Int
    let content: (Int) -> Content
    @Binding var currentPage: Int

    init(pageCount: Int, currentPage: Binding<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        self.pageCount = pageCount
        self._currentPage = currentPage
        self.content = content
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(0..<pageCount, id: \.self) { page in
                    content(page)
                        .frame(width: Config.shared.screenWidth)
                }
            }
        }
        .pagingEnabled(pageCount: pageCount, currentPage: $currentPage)
    }
}

extension ScrollView {
    func pagingEnabled(currentPage: Binding<Int>) -> some View {
        GeometryReader { geometry in
            self
                .content
                .offset(x: CGFloat(currentPage.wrappedValue) * -geometry.size.width)
                .frame(width: geometry.size.width, alignment: .leading)
                .onChange(of: currentPage.wrappedValue) { newPage in
                    withAnimation {
                        currentPage.wrappedValue = newPage
                    }
                }
        }
    }
    func pagingEnabled(pageCount: Int, currentPage: Binding<Int>) -> some View {
        GeometryReader { [pageCount] geometry in
            let pageWidth = geometry.size.width
            let offset = CGFloat(currentPage.wrappedValue) * CGFloat(-pageWidth)

            return self
                .content
                .frame(width: pageWidth, alignment: .leading)
                .offset(x: offset)
                .gesture(DragGesture().onEnded { [pageCount] value in
                    let change = value.translation.width
                    let newPage: Int

                    if change > pageWidth / 2 {
                        newPage = max(currentPage.wrappedValue - 1, 0)
                    } else if change < -pageWidth / 2 {
                        newPage = min(currentPage.wrappedValue + 1, pageCount - 1)
                    } else {
                        newPage = currentPage.wrappedValue
                    }

                    withAnimation {
                        currentPage.wrappedValue = newPage
                    }
                })
        }
    }
}

public enum AppFontSize {
    case small(isBold: Bool), medium(isBold: Bool), large(isBold: Bool)
}

extension View {
    @ViewBuilder
    public func appFont(_ size: AppFontSize) -> some View {
        switch size {
        case .small(let isBold):
            isBold ? self.font(.body.bold()) : self.font(.body)
        case .medium(let isBold):
            isBold ? self.font(.title3.bold()) : self.font(.title3)
        case .large(let isBold):
            isBold ? self.font(.title.bold()) : self.font(.title)
        }
    }
}
