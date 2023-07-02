//
//  SelectionTabKey.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI

struct SelectionTabKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var selectionTabbKey: Binding<TabFlow> {
        get { self[SelectionTabbKey.self] }
        set { self[SelectionTabbKey.self] = newValue }
    }
}
