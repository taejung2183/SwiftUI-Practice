//
//  AboutView.swift
//  Bullseye
//
//  Created by atj on 2021/01/26.
//

import SwiftUI

struct AboutView: View {
    let bgColor = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct TextViewStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }
    
    struct VStackStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }
    
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯")
                .modifier(HeadingStyle())
            Text("This is Bullseye game.")
                .modifier(TextViewStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .navigationBarTitle("About Bullseye")
        .background(bgColor)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        //AboutView()
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
