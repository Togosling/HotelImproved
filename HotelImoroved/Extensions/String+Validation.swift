//
//  String+Validation.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) != nil
    }
    
    func formatPhoneNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "+X (XXX) XXX-XX-XX"
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        switch result.count {
        case 2:
            result.append(" (***) ***-**-**")
        case 5:
            result.append("**) ***-**-**")
        case 6:
            result.append("*) ***-**-**")
        case 7:
            result.append(") ***-**-**")
        case 10:
            result.append("**-**-**")
        case 11:
            result.append("*-**-**")
        case 12:
            result.append("-**-**")
        case 14:
            result.append("*-**")
        case 15:
            result.append("-**")
        case 17:
            result.append("*")
        default:
            break
        }
        
        return result
    }
}
