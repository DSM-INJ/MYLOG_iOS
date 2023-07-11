//
//  Toast.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import SwiftUI

public enum ToastStyle {
    case info
    case error
    case success
}

public extension ToastStyle {
    var icon: Image {
        switch self {
        case .info:
            return Image(systemName: "info.circle")

        case .error:
            return Image(systemName: "exclamationmark.triangle")

        case .success:
            return Image(systemName: "checkmark")
        }
    }

    var iconForeground: Color {
        switch self {
        case .info:
            return Color("ShadowColor")

        case .error:
            return Color("RedColor")

        case .success:
            return Color("BlueColor")
        }
    }

    var textForeground: Color {
        switch self {
        case .info:
            return Color("SubtitleColor")

        case .error:
            return Color("RedColor")

        case .success:
            return Color("TabBarColor")
        }
    }

    var size: CGSize {
        switch self {
        case .info:
            return .init(width: 20, height: 20)

        case .error:
            return .init(width: 21, height: 18)

        case .success:
            return .init(width: 16, height: 12)
        }
    }
}

struct Toast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let style: ToastStyle

    init(
        isShowing: Binding<Bool>,
        message: String,
        style: ToastStyle
    ) {
        _isShowing = isShowing
        self.message = message
        self.style = style
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            toastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func toastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 10) {
                    style.icon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: style.size.width, height: style.size.height)
                        .foregroundColor(style.iconForeground)

                    Text(message)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(style.textForeground)

                    Spacer()
                }
                .transition(.offset(y: -50).combined(with: AnyTransition.opacity.animation(.default)))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .background {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(4)
                        .shadow(
                            color: .black.opacity(0.08),
                            y: 1,
                            blur: 16
                        )
                }
                .padding(.horizontal, 12)
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            }

            Spacer()
        }
        .animation(.default, value: isShowing)
    }
}

public extension View {
    func toast(
        isShowing: Binding<Bool>,
        message: String,
        style: ToastStyle
    ) -> some View {
        modifier(Toast(isShowing: isShowing, message: message, style: style))
    }
}
