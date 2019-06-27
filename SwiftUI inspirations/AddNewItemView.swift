//
//  AddNewItemView.swift
//  SwiftUI inspirations
//
//  Created by Sajad Beheshti on 6/27/19.
//  Copyright © 2019 SOOJI. All rights reserved.
//

import SwiftUI

struct AddNewItemView : View {
    @State var viewState = CGSize.zero
    @State var showingWelcome = false
    @Binding var name: String
    var body: some View {
        return HStack {
            if showingWelcome {
                TextField($name, placeholder: Text("Type your message...").color(.white))
                    .font(.system(size: 13))
                    .padding(.vertical,7)
                    .padding(.horizontal,10)
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.3), cornerRadius: 30)
                    .padding(.leading,7)
            }
            Button(action: {
                withAnimation {
                    self.showingWelcome.toggle()
                }
            }) {
                HStack {
                    Image(systemName: showingWelcome ? "checkmark.circle.fill" : "plus.circle.fill")
                        .foregroundColor(.white)
                        .padding(.horizontal,showingWelcome ? 9 : 15)
                        .padding(.vertical, showingWelcome ? 12 : 18)
                    }
                    .background(Color(red: 86.0/255.0, green: 245.0/255.0, blue: 183.0/255.0, opacity: 1.0),cornerRadius: 35)
                    .offset(x: showingWelcome ? -5 : 0)
                    .padding(.leading,showingWelcome ? 3:0)
                    .padding(.vertical, showingWelcome ? 6:0)
                
            }
            }
            .background(!showingWelcome ? Color(red: 86.0/255.0, green: 245.0/255.0, blue: 183.0/255.0, opacity: 1.0) : Color(red: 117.0/255.0, green: 73.0/255.0, blue: 243.0/255.0, opacity: 1.0), cornerRadius: showingWelcome ? 35 : 30)
            .animation(.fluidSpring())
            .offset(y: viewState.height)
            .gesture(
                DragGesture()
                    .onChanged {value in
                        self.viewState = value.translation
                        self.showingWelcome = false
                    }
                    .onEnded {value in
                        self.viewState = .zero
                }
        )
    }
}
