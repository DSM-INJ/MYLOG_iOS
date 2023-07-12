//
//  CurrentDate.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Foundation

extension BaseViewModel {
    func now() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        return dateFormatter.string(from: now)
    }
}

extension Date {
    func now() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        return dateFormatter.string(from: self)
    }
    
    func nowWeekDay() -> String {
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEE"
        weekdayFormatter.locale = Locale(identifier: "en_US")
        
        return weekdayFormatter.string(from: self).uppercased()
    }
    
    func nowDay() -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        
        return dayFormatter.string(from: self).uppercased() 
    }
}

extension String {
    func now() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        return dateFormatter.date(from: self) ?? .init()
    }
    
    func nowWeekDay() -> Date {
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEE"
        weekdayFormatter.locale = Locale(identifier: "en_US")
        
        return weekdayFormatter.date(from: self) ?? .init()
    }
    
    func nowDay() -> Date {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        
        return dayFormatter.date(from: self) ?? .init()
    }
}
