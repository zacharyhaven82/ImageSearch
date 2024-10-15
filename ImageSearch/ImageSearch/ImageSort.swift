//
//  ImageSort.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//


enum ImageSort: CaseIterable, Hashable {
    
    case time, viral
    case top(SortWindow)
    
    static var allCases: [ImageSort] = [.time, .viral, .top(.all)]
    
    func displayValue() -> String {
        switch self {
        case .time: return "Time"
        case .viral: return "Viral"
        case .top: return "Top"
        }
    }
    
    func urlValue() -> String {
        switch self {
        case .time:
            return "/time"
        case .viral:
            return "/viral"
        case .top(let window):
            return "/top/\(window.rawValue)"
        }
    }
}

enum SortWindow: String, CaseIterable, Hashable {
    
    case all, day, week, month, year
    
    func displayValue() -> String {
        self.rawValue.capitalized
    }
}