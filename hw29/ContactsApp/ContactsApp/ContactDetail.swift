//
//  ContactDetail.swift
//  ContactsApp
//
//  Created by Елизавета Метла on 10/26/20.
//

import SwiftUI

struct ContactDetail: View {
    let contact : Contacts
    
    var body: some View {
        VStack {
            Image(contact.imageNumber)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 4)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            Text(contact.name)
                .font(.title)
                .fontWeight(.bold)
    
            Form {
                Section {
                    HStack {
                        Text("Phone number")
                        Spacer()
                        Text(contact.phoneNumber)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(contact.email)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                }
                Section {
                    Button(action: {
                        print("Send SMS")
                    }) {
                        Text("Send SMS")
                            .font(.headline)
                    }
                    Button(action: {
                        print("Send message to email")
                    }) {
                        Text("Send message to email")
                            .font(.headline)
                    }
                    Button(action: {
                        print("Call")
                    }) {
                        Text("Call")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: contacts[0])
    }
}
