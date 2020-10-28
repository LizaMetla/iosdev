//
//  ContentView.swift
//  ContactsApp
//
//  Created by Елизавета Метла on 10/26/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(contacts){ contact in
                NavigationLink(
                    destination: ContactDetail(contact: contact)) {
                ContactRow(contact: contact)
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding(.top, 10)
    }
}

struct ContactRow: View {
    
    let contact: Contacts
    
    var body: some View {
        HStack {
            Image(contact.imageNumber)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .cornerRadius(50)
                .shadow(radius: 4)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Text(contact.phoneNumber)
                    .font(.footnote)
            }
        }
    }
}
