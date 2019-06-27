//
//  ContentView.swift
//  SwiftUI inspirations
//
//  Created by Sajad Beheshti on 6/27/19.
//  Copyright © 2019 SOOJI. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var viewState = CGSize.zero
    @State var name = ""
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                AddNewItemView(name: $name)
                }.padding(.all)
            }.edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone X")
    }
}
#endif
 
