//
//  Contacts.swift
//  ContactsApp
//
//  Created by Елизавета Метла on 10/26/20.
//

import Foundation
import SwiftUI

struct Contacts: Identifiable {
    let imageNumber: String
    let name: String
    let phoneNumber: String
    let email: String
    let id = UUID()
}

let contacts = [
    Contacts(imageNumber: "1", name: "Jane Law", phoneNumber: "+375(29)777-55-33", email: "jane@gmail.com"),
    Contacts(imageNumber: "2", name: "Alex Phan", phoneNumber: "+375(33)567-55-33", email: "jane@gmail.com"),
    Contacts(imageNumber: "3", name: "Simon Phan", phoneNumber: "+375(44)333-22-33", email: "simon@gmail.com"),
    Contacts(imageNumber: "4", name: "Harry Green", phoneNumber: "+375(33)234-55-33", email: "hgreen@neymail.com"),
    Contacts(imageNumber: "5", name: "Jorah Mora", phoneNumber: "+375(33)765-55-33", email: "jorah@vuomail.com"),
    Contacts(imageNumber: "6", name: "Zelensky", phoneNumber: "+375(33)123-22-76", email: "zelensky@ypmail.com"),
    Contacts(imageNumber: "7", name: "BITLDJUS", phoneNumber: "+375(33)666-66-66", email: "bitljus@vuomail.com"),
    Contacts(imageNumber: "8", name: "Nikita", phoneNumber: "+375(33)234-22-55", email: "nikita@ypmail.com")
]
