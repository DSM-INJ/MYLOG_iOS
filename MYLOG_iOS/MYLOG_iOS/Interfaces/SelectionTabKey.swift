//
//  SelectionTabKey.swift
//  MYLOG
//
//  Created by 강인혜 on 30/6/23.
//

import SwiftUI

struct SelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var selectionTabbKey: Binding<TabFlow> {
        get { self[SelectionTabbKey.self] }
        set { self[SelectionTabbKey.self] = newValue }
    }
}

