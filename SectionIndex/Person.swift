//
//  Person.swift
//  SectionIndex
//
//  Created by QUYNV on 11/13/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class Person {
    
    static var arrFirstNameMen : [String]!
    static var arrFirstNameWomen : [String]!
    static var arrLastName : [String]!
    static var arrMiddleNameMen : [String]!
    static var arrMiddleNameWomen : [String]!
    static var arrTel : [String]!
    
    var fullName : String!
    var lastName : String!
    var firstName : String!
    var middleName : String!
    var telephone : String!
    
    static var isCheck : Bool = true
    
    init() {
        if Person.isCheck == true {
            Person.arrFirstNameMen = ["Anh", "Bắc", "Biên", "Chung", "Chiến", "Chính", "Công", "Dương", "Dũng", "Đạo", "Điền", "Đạt", "Kiên", "Kiểm", "Long", "Mạnh", "Nam", "Nhân", "Phúc", "Phước", "Phú", "Quảng", "Quân", "Sáng", "Trung", "Tú", "Cần", "Minh", "Phương", "Thế", "Duy", "Cường", "Huy", "Thắng", "Tiến", "Tùng", "Bình"]
            Person.arrFirstNameWomen = ["An", "Anh", "Ánh", "Chung", "Dung", "Giang", "Hằng", "Hương", "Khánh", "Liên", "Linh", "Liễu", "Mai", "Nhi", "Nhung", "Oanh", "Phúc", "Quyên", "Quỳnh", "Thuỷ", "Thảo", "Tú", "Phương",  "Hoa", "Huệ", "Uyên",  "Xinh", "Yến"]
            Person.arrMiddleNameMen = ["Văn", "Đăng", "Bảo", "Đình", "Minh", "Vĩnh", "Hữu", "Công", "Khắc", "Duy", "Kim", "Thế", "Xuân"]
            Person.arrMiddleNameWomen = ["Thị", "Ngọc", "Thuỳ"]
            Person.arrLastName = ["Hoàng", "Trần", "Nguyễn", "Đặng", "Phạm", "Trịnh", "Đỗ", "Đinh", "Lê", "Vũ", "Bùi", "Hồ", "Ngô",  "Dương", "Lý", "Lương", "Doãn"]
            Person.arrTel = ["090", "088", "091", "094", "097", "098"]
            Person.isCheck = false
        }
        
        let genderIndex = arc4random_uniform(2)
        if genderIndex == 0 {
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
        } else {
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrFirstNameMen.count)))]
        }
        
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        telephone = Person.arrTel[Int(arc4random_uniform(UInt32(Person.arrTel.count)))] + "\(1000000 + arc4random_uniform(9000000))"
        
        fullName = lastName + " " + middleName + " " + firstName
    }
    
}
