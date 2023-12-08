//
//  TabType.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import Foundation

enum TabType: Int, CaseIterable {
    
    case journal, medications, reminders, settings
    func title() -> String {
        switch self {
        case .journal:
            return "journal".capitalized
        case .medications:
            return "medications".capitalized
        case .reminders:
            return "reminders".capitalized
        case .settings:
            return "settings".capitalized
        }
    }
    
    func image() -> String {
        switch self {
        case .journal:
            return "list.bullet.circle"
        case .medications:
            return "pill.circle"
        case .reminders:
            return "calendar.badge.exclamationmark"
        case .settings:
            return "gearshape.circle"
        }
    }
}
