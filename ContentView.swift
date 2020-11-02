//
//  ContentView.swift
//  demoo
//
//  Created by User24 on 2020/11/2.
//  Copyright © 2020 yuen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var place = ["台北", "新北", "基隆", "台中", "桃園", "新竹"]
    @State private var selectedPlace = "台北"
    @State private var member = false
    @State private var done = false
    @State private var date = Date()
    @State private var time = Date()
    @State private var person: CGFloat = 1
    @State private var name = ""
    @State private var membernum = ""
    @State private var number = ""
    @State private var email = ""
    var body: some View {
        VStack{
            Form{
                VStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                    Text("訂位")
                }
                Group{
                    Text("Fill Your Identity")
                    HStack{
                        Text("Name                 :")
                        TextField("your name", text: $name)
                    }
                    HStack{
                        Text("Mobile Number :")
                        TextField("number", text: $number)
                    }
                    HStack{
                        Text("E-Mail Address :")
                        TextField("email address", text: $email)
                    }
                    Toggle("Membership ", isOn : $member)
                    if(member) {
                        HStack{
                            Text("Member Number :")
                            TextField("number", text: $membernum)
                        }
                    }
                    Text("\nBooking Request")
                    HStack {
                        Text("Person : \(Int(person))")
                        Slider(value: $person, in: 1...20, step: 1) {
                            Text("")
                        }
                    }
                    Text("Place")
                    Picker(selection: $selectedPlace, label: Text("")) {
                        ForEach(place, id: \.self) { (role) in
                            Text(role)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Group{
                    DatePicker("Date", selection: $date, in: Date()..., displayedComponents: .date)
                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                }
            }
            Button(action: {
                 self.done = true
            }) {
                 Text("ORDER")
                }
                 .actionSheet(isPresented: $done) {
                    ActionSheet(title: Text("RESERVATION HAS BEEN MADE"), message: Text("The reservation ticket for " + name + "has been sent to: " + email), buttons: [.default(Text("OK"))])
                  }.buttonStyle(PlainButtonStyle())
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
