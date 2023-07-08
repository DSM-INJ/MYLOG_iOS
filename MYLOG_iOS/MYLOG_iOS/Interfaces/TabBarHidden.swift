import SwiftUI

struct TabbarHiddenKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

public extension EnvironmentValues {
    var tabbarHidden: Binding<Bool> {
        get { self[TabbarHiddenKey.self] }
        set { self[TabbarHiddenKey.self] = newValue }
    }
}

struct SelectionTabKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var selectionTabbKey: Binding<TabFlow> {
        get { self[SelectionTabKey.self] }
        set { self[SelectionTabKey.self] = newValue }
    }
}
