//
//  ContentView.swift
//  SwiftUI_Layout
//
//  Created by Duc Dang on 7/2/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image("scuba").resizable()
                .frame(width: 350.0, height: 500.0)
                .cornerRadius(30)
                .aspectRatio(contentMode: .fill)
//            Spacer()
            Text("Hello World")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
