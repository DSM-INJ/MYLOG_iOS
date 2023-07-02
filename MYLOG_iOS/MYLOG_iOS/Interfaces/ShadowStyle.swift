//
//  ShadowStyle.swift
//  MYLOG
//
//  Created by 강인혜 on 30/6/23.
//


import SwiftUI


public extension View {
    func shadow(
        color: Color,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0.0,
        spread: CGFloat = 0
    ) -> some View {
        let radius = blur / 2.0
        let spreadedX = x + spread
        let spreadedY = y + spread
        return shadow(
            color: color,
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
}


public struct Shadow: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .shadow(color: Color("ShadowColor").opacity(0.24), y: 1, blur: 10)
    }
}

public extension View {
    func shadow() -> some View {
        modifier(Shadow())
    }
}
